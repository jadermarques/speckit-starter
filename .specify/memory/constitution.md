# Constituição Técnica — Galo Manager

Este documento contém as leis inegociáveis de engenharia e arquitetura do projeto. O Agente de IA deve consultar este arquivo antes de qualquer comando `/plan` ou `/implement`.

## I. Governança e Processo (Spec-Kit)
1. **SDD Obrigatório:** Nenhuma mudança sensível (Auth, Chatwoot, DB, LLM Gateway, Rotinas em Lote) pode ser implementada sem o fluxo: `specify -> plan -> tasks -> implement`.
2. **Atômico e Pequeno:** Favoreça "PRs" pequenos. Menos contexto gigante, mais instruções persistentes.
3. **Trilha Completa:** Áreas sensíveis exigem Spec detalhada e análise de impacto antes da execução.

## II. Leis de Arquitetura (ADRs)
1. **Persistência Local:** O sistema utiliza SQLite (`data/database.db`) para auditoria e cadastros auxiliares. O Chatwoot é a fonte da verdade operacional.
2. **Branch by Abstraction:** A migração do legado (`views/`) para a nova arquitetura (`app/`) é incremental. Novas lógicas de negócio DEVEM ir para `app/services/`.
3. **Gateway de LLM:** Todo despacho para IAs (OpenAI, Anthropic, Gemini) deve passar obrigatoriamente por `app/llm_gateway/gateway.py` para sanitização PII e controle de custos.
4. **Segurança de Segredos:** Credenciais nunca são salvas no banco ou hardcoded. Use estritamente variáveis de ambiente (`.env`).
5. **Concorrência:** Use `ThreadPoolExecutor` apenas para tarefas I/O Bound (exportações e rotinas de rede) para não bloquear a UI do Streamlit.

## III. Padrões de Código
1. **Linguagem:** Python 3.13+.
2. **Interface:** Streamlit ≥ 1.37 utilizando `st.Page()` para navegação.
3. **ORM:** SQLAlchemy 2.x com tipagem forte.
4. **Auditoria:** Toda ação destrutiva ou de escrita em lote deve gerar um log via `app.services.audit_logs`.