#!/bin/bash

# Descobre o caminho absoluto de onde este script está guardado
SOURCE_BASE_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Define as origens
SRC_PROMPTS="$SOURCE_BASE_DIR/.pi/prompts"
SRC_MEMORY="$SOURCE_BASE_DIR/.specify/memory"
SRC_TEMPLATES="$SOURCE_BASE_DIR/.specify/templates"

# Define os destinos (onde você está rodando o script)
DEST_PI=".pi/prompts"
DEST_SPECIFY=".specify"

echo "📦 Vinculando Speckit a partir de: $SOURCE_BASE_DIR"

# 1. Garante que as pastas de destino existem
mkdir -p "$DEST_PI"
mkdir -p "$DEST_SPECIFY"

# 2. Link simbólico dos Prompts (Um por um para garantir)
echo "🔗 Vinculando comandos (.pi/prompts)..."
for file in "$SRC_PROMPTS"/*.md; do
    filename=$(basename "$file")
    ln -sf "$file" "$DEST_PI/$filename"
done

# 3. Link simbólico das subpastas da .specify (Memory e Templates)
# No macOS, usamos -sfn para forçar o link de diretórios
echo "⚖️ Vinculando governança (.specify)..."
ln -sfn "$SRC_MEMORY" "$DEST_SPECIFY/memory"
ln -sfn "$SRC_TEMPLATES" "$DEST_SPECIFY/templates"

echo "🚀 Speckit injetado com sucesso no projeto!"
