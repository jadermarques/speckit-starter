# AGENTS.md

## DIRETRIZES DE GOVERNANÇA
1. Você deve operar em conformidade total com as leis descritas em `constitution.md`.
2. Antes de qualquer `/plan`, verifique se a solução proposta respeita as ADRs (Architectural Decision Records) da Constituição.

3. Em caso de conflito entre uma sugestão de código e a Constituição, a Constituição prevalece.



## Objetivo

Este arquivo define as regras gerais e portaveis de uso de agentes no Galo Manager.

O objetivo e reduzir regressao, proteger areas sensiveis e evitar desperdicio de contexto e tokens.

## Regra de ouro

Nenhuma mudanca sensivel deve ser implementada diretamente sem antes existir entendimento do objetivo, analise de impacto e plano minimo.

Para toda mudanca sensivel, a spec curta em `docs/specs/` passa a ser obrigatoria antes da implementacao.

Depois de implementar, toda mudanca deve ser revisada contra regressao e escopo.

## Dois trilhos

### Trilha completa

Usar para mudancas em:

- autenticacao, autorizacao, sessao e permissao
- integracoes Chatwoot
- exportacoes e relatorios sensiveis
- banco local e persistencia
- seguranca e auditoria
- LLM gateway e custos de uso
- rotinas em lote
- Google Ads e Meta Ads
- regras de negocio
- alteracoes que cruzem camadas

Fluxo:

1. definir a ideia
2. criar spec curta
3. analisar impacto e plano
4. implementar por etapa pequena
5. validar localmente
6. revisar regressao
7. abrir PR pequeno

### Trilha leve

Usar para mudancas em:

- texto e conteudo visual
- layout local de paginas
- bugs pequenos e isolados
- ajustes internos sem impacto contratual
- documentacao nao normativa

Fluxo:

1. entender o objetivo
2. implementar a menor mudanca possivel
3. validar localmente
4. revisar regressao
5. abrir PR pequeno

## Areas com processo obrigatorio

Use sempre a trilha completa se a mudanca tocar qualquer um dos itens abaixo:

- `main.py`
- `core/chatwoot_api.py`
- `core/security.py`
- `core/llm_gateway.py`
- `app/db.py`
- `app/services/chatwoot_exports.py`
- `.env.example`
- permissoes, auth, sessao, exportacao sensivel, rotina em lote, API externa ou regra comercial

Nesses casos, abrir e salvar uma spec curta em `docs/specs/` e parte obrigatoria do processo.

## Politica de contexto e tokens

1. nao pedir leitura do projeto inteiro como comportamento padrao
2. consultar a documentacao por ordem dirigida
3. usar o PRD como fonte principal de produto
4. abrir spec tematica apenas quando a tarefa tocar o dominio correspondente
5. abrir `docs/ARCHITECTURE.md` apenas para mudancas cross-layer
6. nao usar personas por padrao
7. preferir prompts curtos e reutilizaveis

## Ordem recomendada de consulta

1. baseline do repositorio
2. `docs/DOCUMENTATION_INDEX.md`
3. `docs/PRD - product requirements document.md`
4. spec tematica relevante
5. `docs/ARCHITECTURE.md` apenas se necessario

## Regras de implementacao

1. alterar apenas arquivos necessarios
2. nao misturar refatoracao com nova funcionalidade sem pedido explicito
3. nao mudar comportamento externo sem apontar impacto
4. validar localmente sempre que houver check viavel
5. manter PRs pequenos

## Regras de revisao

Toda mudanca deve ser revisada pelo menos contra:

1. escopo
2. regressao
3. seguranca, se tocar area sensivel
4. alteracoes acidentais fora do plano

---

# Reversa

> Framework de Engenharia Reversa instalado neste projeto.

## Como usar

Digite `reversa` para ativar o Reversa e iniciar ou retomar a análise do projeto.

## Comportamento ao ativar

Quando o usuário digitar `reversa` sozinho em uma mensagem:

1. Ative o skill `reversa` disponível em `.agents/skills/reversa/SKILL.md`
2. Leia o SKILL.md na íntegra e siga exatamente as instruções do Reversa

## Regras de Comportamento por Comando Spec-Kit

Quando o usuário iniciar a mensagem com um comando específico, assuma OBRIGATORIAMENTE a seguinte postura, independentemente do seu nível de raciocínio atual:

- **Se o comando for `/specify`, `/plan` ou `/tasks`:** Atue como Arquiteto Sênior. Analise profundamente as regras de negócio, preveja erros (edge cases) e foque 100% na estrutura e no design da solução. Não gere código executável.
- **Se o comando for `/implement`:** Atue como um Executor Disciplinado. DESLIGUE sua criatividade arquitetural. Siga as etapas do `tasks.md` de forma cega e literal. Não questione a arquitetura, não tente refatorar arquivos fora do escopo e responda apenas com o código exato solicitado.



## Regra não-negociável

Nunca apague, modifique ou sobrescreva arquivos pré-existentes do projeto legado.
O Reversa escreve **apenas** em `.reversa/` e `_reversa_sdd/`.

<!-- SPECKIT START -->
For additional context about technologies to be used, project structure,
shell commands, and other important information, read the current plan:
specs/009-correcao-em-lote/plan.md
<!-- SPECKIT END -->
