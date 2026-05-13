#!/bin/bash

# Descobre o caminho absoluto de onde este script está guardado
# Isso permite que ele funcione não importa onde a pasta speckit-starter esteja
SOURCE_BASE_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

LIBRARY_DIR="$SOURCE_BASE_DIR/.pi/prompts"
MEMORY_DIR="$SOURCE_BASE_DIR/.specify"

# O DESTINO: onde você rodar o script (o seu novo projeto)
DEST_PI=".pi/prompts"
DEST_SPECIFY=".specify"

echo "📦 Instalando Speckit a partir de: $SOURCE_BASE_DIR"

# Criar pastas de destino no projeto novo
mkdir -p "$DEST_PI"
mkdir -p "$DEST_SPECIFY"

# Link simbólico dos Prompts
for prompt in "$LIBRARY_DIR"/*.md; do
    if [ -e "$prompt" ]; then
        ln -sf "$prompt" "$DEST_PI/$(basename "$prompt")"
    fi
done

# Link simbólico da estrutura .specify (Templates e Constitution)
# Usando cp -rs para criar links simbólicos de toda a árvore de subpastas
cp -rs "$MEMORY_DIR/"* "$DEST_SPECIFY/" 2>/dev/null || ln -sf "$MEMORY_DIR/"* "$DEST_SPECIFY/"

echo "🚀 Speckit injetado com sucesso! Links criados para os prompts globais."
