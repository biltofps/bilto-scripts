# Validação

Ordem: testes automáticos → checklist em jogo. Marque cada item; qualquer falha bloqueia o deploy.

## 1. Automáticos

### 1.1 Self-check do servidor
No console: `bilto_admin_selfcheck`. Esperado: `selfcheck ok (N checks passed, 0 issue(s))`.

Cobre: dependências iniciadas; validação completa da config; exports externos usados (`rsg-multijob`, `rsg-bossmenu`, `rsg-inventory`); toda ação com chave de permissão; toda URL de webhook ligada a uma ação real; store de permissões carregado e cada cargo com permissões; paridade de chaves pt-BR/en; toda chave de locale citada no código (Lua, JS, HTML, prefixos dinâmicos) existe; todo `byId()` da NUI existe no HTML; toda aba tem painel; testes de `Admin.text/key/int/num`, interpolação com `%`, rótulo de ban permanente, `parsePermissionSet`, source inválida sem acesso, `runAction` rejeitando payload ruim.

### 1.2 Fluxo da NUI
Na pasta do recurso: `node tests/nui_flow.test.js .` (sem Node: `set ELECTRON_RUN_AS_NODE=1` e use o `Code.exe` do VS Code no lugar de `node`). Esperado: `flow: ALL OK`.

Cobre: init com o locale real, estado completo, todos os modais e confirmações, 38 das 39 ações com o payload enviado ao servidor, pilha de modais/ESC, toast, fechar e reabrir sem catálogo; falha em qualquer exceção ou chave de locale ausente em runtime.

## 2. Em jogo

Prepare: um admin GOD (ACE `rsgcore.god`), um jogador sem cargo, um jogador alvo.

### Acesso
- [ ] Sem cargo: `/admin` e PGDN mostram "sem permissão"; `/nc` mostra "sem permissão para noclip".
- [ ] GOD: painel abre com Dashboard; PGDN fecha; ESC fecha; reabrir não reenvia catálogos (debug mostra só `state`).
- [ ] Dar cargo `helper` ao jogador pela aba Permissões → ele abre o painel, só vê as abas/botões de helper, ganha `rsgcore.helper` (testar um comando rsg-core de helper) e perde ao remover o cargo.
- [ ] Editar o cargo `helper` (desmarcar `goto`) → o botão some para o helper após atualizar; chamar a ação mesmo assim (devtools) → "Sem permissão".
- [ ] Reiniciar o recurso: cargos e permissões editadas continuam; ACEs reaplicados aos online.

### Dashboard / Players
- [ ] Métricas, total de dinheiro (só tipos `inTotal`), top 10 e jobs por duty corretos.
- [ ] Busca por nome, id, citizenid e job; Ir até / Trazer na linha.

### Suporte (alvo online)
- [ ] goto, bring, revive, heal (vida/fome/sede/stamina), raio, freeze/unfreeze (toast no alvo), spectate liga/desliga e restaura posição.
- [ ] Abrir inventário: painel fecha e o inventário do alvo abre; mover itens só funciona perto do alvo.
- [ ] Setar job (grade válida) → job muda e aparece na multijob; Salvar na Multijob com e sem "ativo"; limite de jobs → mensagem de limite.
- [ ] Remover job: job da multijob some; remover o job ativo deixa "unemployed".
- [ ] Itens: fila, quantidades, peso insuficiente bloqueia, envio adiciona e notifica o alvo; item sem slot → mensagem de slot.
- [ ] Dinheiro: adicionar/remover por tipo; remover acima do saldo → erro com saldo atual; total do dashboard atualiza.
- [ ] Peso/slots: adicionar/remover; remover abaixo do usado → mensagem com o máximo removível.
- [ ] Renomear e altura: alvo avisado, kick após `Config.RelogKickSeconds`, valor persiste no relog.
- [ ] Limpar inventário.

### Moderação
- [ ] Mensagem privada aparece no alvo com título de mensagem do administrador.
- [ ] Kick com e sem motivo.
- [ ] Ban por dias e permanente → aparece na lista (com license); editar prolonga; remover tira da lista; o banido não entra.

### Utilidades / Teleportes
- [ ] Copiar coordenadas (cada formato vai para a área de transferência).
- [ ] Blips e wall ligam/desligam repetidas vezes; wall mostra cargo colorido, CID, ID, nome, vida e arma (sacar/guardar arma reflete em ~0,5s).
- [ ] Noclip pelo botão e por `/nc`; velocidades; desligar devolve colisão/visibilidade.
- [ ] Cavalo admin; baú de empresa (jobs de `Config.CompanyStashes`) abre o mesmo conteúdo que o chefe vê no rsg-bossmenu e o painel fecha.
- [ ] Teleportar para cidade, para coordenadas, adicionar local (com "usar localização atual"), remover local.

### Robustez
- [ ] Clicar rápido duas vezes em uma ação → "Aguarde a ação anterior".
- [ ] Payload malicioso via devtools da NUI (`performAction` com `targetSource: -1`, `amount: 1e309`, `moneyType: "x'; --"`, `items: "x"`, `presetKey: "god"`) → todos recusados com mensagem.
- [ ] Alvo sai durante spectate/freeze → admin sai do spectate; estado limpo.
- [ ] `restart bilto_admin` com painel aberto, wall, blips, noclip, freeze e spectate ativos → foco liberado, tudo desligado, ACEs da staff removidos e reaplicados no start.
- [ ] `Config.Debug = true`: ações aparecem no console; uma chave de locale removida aparece como aviso e no self-check.
