# bilto_admin

Painel administrativo NUI para RedM / RSG Core: suporte a jogadores, moderação, utilidades, teleportes e gestão de cargos da staff.

## Dependências

`ox_lib`, `oxmysql`, `rsg-core`, `rsg-medic`, `rsg-inventory` e `rsg-multijob`.

Os baús de empresa abertos pelo painel são os baús de chefe do `rsg-bossmenu` (`boss_<job>`). A lista vem de `Config.CompanyStashes`, que deve ter os mesmos jobs e limites do rsg-bossmenu.

## Instalação

1. `ensure` as dependências antes do `bilto_admin`.
2. Ajuste `config.lua` (cargos, webhooks, tipos de dinheiro). Uma config inválida **impede o recurso de iniciar** e o console lista cada erro.
3. Inicie o servidor. As tabelas `bilto_admin_roles`, `bilto_admin_staff` e `bilto_admin_teleports` são criadas sozinhas, e os cargos são semeados a partir da config.
4. No console do servidor: `bilto_admin_selfcheck` deve terminar com `selfcheck ok`.

### Vindo da versão 1.x

O formato das tabelas de permissão mudou e não há leitura do formato antigo. `bilto_admin_permissions` e `bilto_admin_role_permissions` deixam de ser usadas: dê os cargos de novo pela aba Permissões e, depois, apague as tabelas antigas (`DROP TABLE bilto_admin_permissions, bilto_admin_role_permissions;`). As permissões de cada cargo voltam ao valor da config e podem ser reeditadas no painel.

## Uso

| Entrada | Quem pode | O que faz |
|---|---|---|
| `/admin` ou tecla PGDN | qualquer cargo | abre/fecha o painel |
| `/nc` | permissão `toggleNoclip` | liga/desliga o noclip |
| `bilto_admin_selfcheck` (console) | console | config, contratos externos, locale, IDs da NUI e testes de funções puras |

## Cargos e permissões

- O cargo de um jogador é o **primeiro** de `Config.Roles` que ele tem, seja pelo ACE `rsgcore.<grupo>` (server.cfg), seja pelo cargo salvo para a citizenid dele na aba Permissões.
- O cargo `all = true` (GOD) tem tudo e é o único que edita cargos e dá cargos.
- Os demais cargos começam com `permissions` + herança (`inherits`) da config. Depois disso valem as permissões salvas em `bilto_admin_roles`, editadas pelo painel.
- Um cargo dado pelo painel também recebe o ACE `rsgcore.<grupo>` enquanto o jogador está online (aplicado no login, removido no logout, na troca de cargo e no stop do recurso).
- A NUI só mostra o que o admin pode usar, mas **toda** ação e todo dado são verificados de novo no servidor.

## Arquitetura

```
config.lua            dados de configuração (validados no start do servidor)
locale.lua            textos pt-BR / en (mesmas chaves nos dois)
server/core.lua       namespace BiltoAdmin, validação de entrada, locale, log, auditoria (webhook), validação da config
server/permissions.lua cargos, staff, ACE, persistência de cargos/staff
server/panel.lua      estado do painel, catálogos, caches, economia, feed do wall/blips, teleportes customizados
server/actions.lua    todas as ações + dispatcher (permissão + lock por admin)
server/main.lua       callbacks, evento de arma, comandos, ciclo de vida, self-check
client/main.lua       ponte NUI, abrir/fechar, efeitos no jogador (teleporte, freeze, raio, stamina, cavalo, spectate)
client/tracking.lua   blips e wall dos admins + relatório de arma de todos os clientes
client/noclip.lua     noclip
ui/                   NUI (index.html, script.js, style.css)
tests/nui_flow.test.js teste de fluxo da NUI (Node)
```

### Fluxo de uma ação

`NUI act()` → `fetch performAction` → `client/main.lua` → `lib.callback bilto_admin:server:performAction` → `Admin.runAction` (handler existe? permissão? lock livre?) → handler valida a entrada, executa, audita → resposta `{ ok, message, data }` → client atualiza o estado do painel (ou fecha o painel quando um inventário/baú é aberto).

## Mapa de rede

### Callbacks do servidor (ox_lib)

| Nome | Acesso | Retorno |
|---|---|---|
| `bilto_admin:server:getPanelState(withCatalog)` | qualquer cargo | dashboard, players, bans (se `viewBannedPlayers`), staff/cargos (se GOD), catálogos estáticos quando pedidos |
| `bilto_admin:server:getPlayerDetails(target)` | qualquer cargo | multijob e altura do jogador selecionado |
| `bilto_admin:server:getTrackedPlayers()` | `togglePlayerBlips` ou `togglePlayerWall` | feed de posição, cargo e arma para blips/wall |
| `bilto_admin:server:getTeleportLocations()` | `teleportToCoords` | teleportes customizados |
| `bilto_admin:server:performAction(payload)` | permissão da ação | `{ ok, message, data }` |

### Ações (`payload.action`)

Suporte: `goto`, `bring`, `teleportToCoords`, `revive`, `heal`, `executeLightning`, `toggleFreeze`, `spectate`, `openInventory`, `openCompanyStash`.
Utilidades: `togglePlayerBlips`, `togglePlayerWall`, `toggleNoclip`, `spawnAdminHorse`.
Moderação: `kick`, `privateMessage`, `banPlayer`, `editBan`, `removeBan`.
Jobs: `setJob`, `upsertMultijobJob`, `removeJob`.
Itens e capacidade: `checkItemCapacity`, `addItem`, `addWeight`, `addSlots`, `removeWeight`, `removeSlots`, `clearInventory`.
Dinheiro: `addMoney`, `removeMoney`.
Personagem: `renameCharacter`, `changeHeight`.
Teleportes (permissão `manageTeleportLocations`): `addTeleportLocation`, `deleteTeleportLocation`.
GOD: `permissionAddPlayer`, `permissionUpdatePlayer`, `permissionRemovePlayer`, `permissionPresetUpdate`.

Permissões que só controlam a NUI: `copyCoords`, `viewBannedPlayers`, `viewUtilitiesPanel`, `teleportToCoords` (também da ação de mesmo nome), `manage_permissions` (= GOD).

### Eventos

| Evento | Direção | Uso |
|---|---|---|
| `bilto_admin:server:reportWeapon(hash)` | client → server | arma em mãos (limitado a 1 por `Config.Limits.wallWeaponReportMinMs`) |
| `bilto_admin:client:openPanel` | server → client | abre o painel (`/admin`) |
| `bilto_admin:client:toast(payload)` | server → client | notificação e mensagem privada |
| `bilto_admin:client:teleportTo(coords)` | server → client | goto / bring / teleportes |
| `bilto_admin:client:setFrozen(state)` | server → client | freeze |
| `bilto_admin:client:executeLightning` | server → client | raio |
| `bilto_admin:client:restoreStamina` | server → client | parte do heal |
| `bilto_admin:client:spawnAdminHorse(model, label)` | server → client | cavalo |
| `bilto_admin:client:spectate(target, name)` | server → client | spectate (0 = desliga) |
| `bilto_admin:client:setNoclip(state)` | server → client | noclip |
| `bilto_admin:client:togglePlayerBlips` / `togglePlayerWall` | server → client | blips / wall |
| `rsg-medic:client:adminRevive` / `adminHeal`, `hud:client:UpdateNeeds` / `UpdateStress` | server → client | integração |
| `RSGCore:Server:PlayerLoaded` / `OnPlayerUnload`, `playerDropped`, `onResourceStop` | escuta | ACE da staff e limpeza de estado |

### NUI

Mensagens client → NUI: `init` (locale, título, debug), `toggle`, `state`, `toast`.
Callbacks NUI → client: `ready`, `close`, `refresh`, `performAction`, `getPlayerDetails`, `getTeleportLocations`, `getCurrentCoords`.

### Exports consumidos

`rsg-inventory`: `OpenPlayerInventory`, `OpenInventory`, `CanAddItem`, `AddItem`, `ClearInventory`.
`rsg-multijob`: `GetJobs`, `AddJob`, `HasJob`, `RemoveJob`.
O recurso não expõe exports.

## Persistência

| Tabela | Conteúdo |
|---|---|
| `bilto_admin_roles` | `role`, `permissions` (array JSON de chaves) |
| `bilto_admin_staff` | `citizenid`, `name`, `role`, `granted_by` |
| `bilto_admin_teleports` | locais customizados (carregados em memória no start) |
| `bans` (rsg-core) | banimentos |
| `players`, `playerskins` (rsg-core / rsg-character) | nome e altura do personagem, totais de dinheiro |

## Caches e limites

- Estado do painel por admin: `Config.Cache.panelStateMs`, invalidado após cada ação bem-sucedida e em login/saída de jogadores.
- Economia (total + top 10): `Config.Cache.economyMs`, invalidado ao adicionar/remover dinheiro.
- Feed do wall/blips: `Config.Cache.trackedPlayersMs`, compartilhado entre admins.
- Catálogos estáticos: montados uma vez por start e enviados à NUI só na primeira abertura.
- Uma ação por vez por admin (lock), botão Atualizar com `Config.Ui.refreshCooldownMs`.

## Logs

`Config.Debug = true` mostra cada ação (admin, alvo, detalhe), chaves de locale ausentes e erros de requisição NUI no console do servidor, F8 e devtools da NUI. Falhas de handler e respostas de webhook fora de 2xx sempre são impressas.

## Limitações conhecidas

- `openInventory` usa o modelo de acesso do rsg-inventory: o admin vê o inventário de qualquer distância, mas só move itens a até `Config.GiveDistance + 2` metros do alvo.
- Spectate exige que o alvo esteja no escopo de streaming do admin (limite do OneSync); fora dele o client avisa e não entra em spectate.
