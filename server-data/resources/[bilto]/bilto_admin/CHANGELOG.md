# Changelog

## 2.0.0 — 2026-10-30

Reescrita completa. Mesma superfície funcional, ~21,7 mil → ~12,3 mil linhas de runtime, integrações que estavam quebradas corrigidas e um único caminho de execução por funcionalidade.

### Corrigido (estava quebrado na 1.x)
- **Abrir inventário** disparava `rsg-inventory:client:openInventory`, evento que não existe no rsg-inventory deste servidor: não acontecia nada. Agora usa o export `OpenPlayerInventory` e fecha o painel para o inventário receber o foco.
- **Multijob** chamava `GetPlayerJobs` / `AddJobToPlayer` / `RemoveJobFromPlayer`, que não existem no rsg-multijob; o `pcall` escondia o erro (lista sempre vazia, "Salvar na Multijob" sempre falhava). Agora usa `GetJobs` / `AddJob` / `HasJob` / `RemoveJob`.
- **Baú de empresa** dependia de `rsg-bossmenu:GetBossStashCatalog`, que não existe: catálogo sempre vazio. A lista agora vem de `Config.CompanyStashes` (baús `boss_<job>` do rsg-bossmenu, com os mesmos limites); o rsg-bossmenu não foi alterado e deixou de ser dependência.
- **Coluna License** da lista de banidos lia `citzenid` (campo inexistente) e mostrava sempre "N/A".
- **Renomear personagem** alterava uma cópia de `PlayerData` (objeto serializado entre recursos), então o save do rsg-core no logout sobrescrevia o nome novo; havia um "persistir de novo 1,5s após o kick" para mascarar. Agora `SetPlayerData('charinfo')` atualiza a sessão real e o save do logout grava o nome certo.
- **Self-check** calculava os problemas mas nunca os imprimia; o version checker não fazia nada. O novo self-check imprime cada problema e um resumo.
- **ESC** fechava o modal errado quando a confirmação estava aberta por cima de outro. Agora existe uma pilha de modais.
- **`/nc`** liberava noclip para qualquer staff, mesmo sem a permissão `toggleNoclip`. Agora exige a permissão.
- **`%` em parâmetros de texto** (ex.: "100%") quebrava a interpolação de locale (`gsub` com string de substituição). Agora é por função.
- **Grade inválida** no "Setar Job" caía silenciosamente para a grade 0. Agora é rejeitada.

- **Jobs e itens desatualizados:** `GetCoreObject()` devolve uma cópia tirada no start, e o rsg-multijob injeta os jobs no rsg-core em runtime. Agora o recurso escuta `RSGCore:Server:UpdateObject`, atualiza a cópia e versiona o catálogo da NUI, que recebe jobs/itens novos sem reiniciar.
### Segurança
- Lista de banidos só é enviada a quem tem `viewBannedPlayers`; staff, cargos e candidatos só ao GOD (antes ia para qualquer staff).
- Teleporte para coordenadas virou ação de servidor (validada, um caminho único), em vez de check de permissão + teleporte local.
- Toda entrada da NUI passa por `Admin.text` / `Admin.key` / `Admin.int` / `Admin.num` (strings aparadas e limitadas, chaves `[a-z0-9_]`, números finitos) e cada ação tem limite explícito em `Config.Limits`.
- Relato de arma do wall é um evento validado e limitado por tempo; o state bag gravável pelo client (canal duplicado) foi removido.

### Desempenho
- Catálogos estáticos (itens, jobs, cavalos, teleportes, permissões...) são enviados uma vez por sessão da NUI, não em cada atualização.
- Locale é enviado uma vez (handshake `init`), não em cada atualização de estado.
- Altura e multijob deixaram de custar 2 consultas por jogador online a cada atualização: são buscados só para o jogador selecionado.
- Total de dinheiro e top 10 numa única consulta e numa passada, com mapa citizenid → sessão (antes: duas consultas e busca O(N×M)).
- Teleportes customizados ficam em memória após o start.
- HUD e movimento do noclip num único laço por frame (antes eram duas threads); nenhum polling de wall/blips quando estão desligados.

### Persistência (formato novo, sem leitura do antigo)
- `bilto_admin_roles (role, permissions)` substitui `bilto_admin_role_permissions`; permissões salvas como array JSON de chaves.
- `bilto_admin_staff (citizenid, name, role, granted_by)` substitui `bilto_admin_permissions` (coluna `citzenid` com erro de digitação, JSON de permissões redundante com o cargo, migração legada de `license`).
- Ver "Vindo da versão 1.x" no README.

### Configuração (formato novo)
- `Config.Roles` com `inherits` e `color` por cargo (antes `FrameworkRoles` + `FrameworkHierarchy` separados e cores fixas no código do wall).
- `Config.Webhook.urls` por ação (a mesma URL não precisa mais ser repetida 38 vezes).
- `Config.MoneyTypes[].inTotal` define o que entra no total do dashboard (antes: heurística "a chave contém bank").
- Removidos: `Config.PanelActions` (vazio, camada de customização sem uso), `Config.Security`, `Config.Observability`, `Config.Ui.modalDebug` (substituídos por `Config.Debug`), `Config.Jobs.removeJobTarget` (o rsg-multijob já define "unemployed" ao remover o job ativo), imagens dos cavalos (a NUI nunca as exibia), `Config.Client.wallWeaponState.stateBagKey`.
- Config inválida impede o start com mensagem por erro (cargo herdando o GOD, permissão desconhecida, tipo de dinheiro que não existe no rsg-core, webhook que não é do Discord...).

### NUI
- `script.js` reescrito (6.046 → ~2.300 linhas): um `act()` para todas as ações, uma `confirmAction()` para confirmações, pilha de modais, mapa explícito select → grupo de opções.
- Textos fixos em português no JS (confirmações, categorias de teleporte, rótulos de cargo antigos) foram para o locale.
- Modais de adicionar/editar staff mostram as permissões do cargo escolhido (antes o de edição nunca as renderizava); a coluna "Gerenciar" saiu (só o GOD gerencia, ficou igual à coluna "All").
- `style.css`: 98 regras de seletores sem uso removidas (painel Developer, mapa antigo, chips...), nenhum seletor em uso perdido.

### Locale
- 751 → 561 chaves por idioma (190 mortas removidas), 36 novas, pt-BR e en com o mesmo conjunto (verificado pelo self-check).

### Arquivos removidos
| Arquivo | Motivo |
|---|---|
| `client/wall.lua` | absorvido por `client/tracking.lua` (blips + wall + relato de arma no mesmo módulo) |
| `version.lua` | o version checker só retornava o valor lido, sem efeito |
| `ui/images/.gitkeep` | pasta sem nenhum asset; a entrada `ui/images/*` saiu do manifesto |
| `AUDIT_REPORT.md` | desatualizado (citava tabelas e fluxos inexistentes); o mapa atual está no README |

### Código removido sem perda de funcionalidade
- Painel Developer / busca e deleção de personagem: `findCharacterByCitizenid` e `deleteCharacterByCitizenid` não estavam no mapa de ações (o servidor respondia "ação não suportada") e a NUI não tinha nenhum elemento desse painel (todas as referências eram `null`).
- Normalizadores de config no server, client e noclip (valores padrão escondidos que divergiam do `config.lua`).
- Instrumentação `logModalDebug` (serializava e descartava), funções vazias (`renderMoneyModalInfo`, `renderKickModalInfo`...), `requirePlayerFunction` (busca case-insensitive de funções), `debugLog*` no-op, contadores `collect*KeysLimited` sem uso, fallbacks de clipboard (`navigator.clipboard` + callback Lua de `SetClipboard`, inexistente no RedM), callback `canExecutePanelAction` (as abas já são escondidas pela NUI e os dados/ações validados no servidor), `openInventoryFast`.

## 1.x
Histórico anterior consolidado na 2.0.0.
