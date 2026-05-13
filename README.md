# 🚀 Speckit Starter — Biblioteca Central de Prompts

Este repositório é a **"Fonte Única da Verdade" (SSOT)** para fluxos de trabalho orientados a IA (**Spec-Driven Development — SDD**). Ele contém o DNA de governança, templates e o comando especializado de correção de bugs que garantem consistência técnica em todos os seus projetos.

---

## 🏗️ Estrutura do Repositório

* **`.pi/prompts/`**: Comandos executáveis pelo Pi Agent (ex: `/speckit.plan`, `/speckit.fixbug`).
* **`.specify/memory/`**: Ficheiros de governança (`constitution.md`).
* **`.specify/templates/`**: Moldes para Specs, Planos e Tasks.
* **`install-speckit.sh`**: Script mestre para injetar esta biblioteca em qualquer projeto via links simbólicos.

---

## 🛠️ Instalação em Qualquer Projeto

Para usar estes prompts num novo repositório ou num projeto existente, utilize o script de instalação. **Não copie os ficheiros manualmente**; o script cria links simbólicos para que as atualizações na biblioteca central sejam propagadas automaticamente.

1.  Abra o terminal na pasta do projeto alvo.
2.  Execute o instalador:
    ```bash
    /Users/jader/Projects/pi/speckit-starter/install-speckit.sh
    ```

---

## ⚡ Comandos Disponíveis

| Comando | Função |
| :--- | :--- |
| `/speckit.specify` | Define os requisitos iniciais no `spec.md`. |
| `/speckit.plan` | Cria a arquitetura técnica no `plan.md`. |
| `/speckit.tasks` | Gera o checklist de implementação no `tasks.md`. |
| `/speckit.implement` | (Modo Code) Escreve o código baseado nas tarefas. |
| **`/speckit.fixbug`** | **[CORE]** Fluxo automatizado de correção de erros via SDD. |
| `/speckit.checklist` | Valida a implementação final contra a Spec. |

---

## 🐞 Uso Detalhado: /speckit.fixbug

O comando `/speckit.fixbug` é um "paramédico" de código. Ele garante que nenhum bug seja corrigido "na mão", forçando a atualização da documentação para evitar regressões.

### A. Em Projetos Novos (Com Specs)
Quando um erro ocorre numa funcionalidade já mapeada:
1.  No chat (Modo Arquiteto), digite `/speckit.fixbug`.
2.  Forneça o erro e o local.
3.  **Resultado:** O Agente atualiza a `spec.md` (requisitos), o `plan.md` (solução) e o `tasks.md` (execução) automaticamente.

### B. Em Projetos Existentes (Sem Specs/Legacy)
Ao injetar o Speckit num projeto antigo e encontrar um bug:
1.  Execute `/speckit.fixbug`.
2.  O Agente detetará a falta de estrutura e sugerirá criar uma nova pasta em `specs/` (ex: `specs/002-core-api`) para ancorar a correção.
3.  **Resultado:** Você começa a documentar o seu legado enquanto resolve problemas reais.

### C. Exemplos de Prompts de Entrada
* **Erro de API:** `/speckit.fixbug Erro: 500 Internal Server Error ao filtrar conversas. Local: core/chatwoot_api.py`
* **Erro de UI:** `/speckit.fixbug Sintoma: Botão de salvar não responde após clique. Local: app/views/configuracoes.py`
* **Traceback:** `/speckit.fixbug Log: [Cole aqui o erro do console]. Local: app/services/llm_usage.py`

---

## ⚖️ Constituição e Manutenção

1.  **A Constituição:** O ficheiro `.specify/memory/constitution.md` é lido pelo `/speckit.fixbug`. Se a sua lei diz "Use sempre logs de auditoria", o Agente incluirá logs na correção do bug sem que você precise pedir.
2.  **Atualização Global:** Se você melhorar um prompt em `.pi/prompts/`, todos os projetos que rodaram o `install-speckit.sh` receberão a melhoria instantaneamente.
3.  **Git Flow:** Lembre-se de fazer commit das melhorias na biblioteca central:
    ```bash
    cd /Users/jader/Projects/pi/speckit-starter
    git add .
    git commit -m "feat: melhoria no fluxo de diagnóstico do fixbug"
    git push origin main
    ```

---
