#!/bin/bash

# Localiza onde o script está guardado (Independente de SO)
SOURCE_BASE_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

SRC_PROMPTS="$SOURCE_BASE_DIR/.pi/prompts"
SRC_MEMORY="$SOURCE_BASE_DIR/.specify/memory"
SRC_TEMPLATES="$SOURCE_BASE_DIR/.specify/templates"

DEST_PI=".pi/prompts"
DEST_SPECIFY=".specify"

# Deteta o Sistema Operativo
OS_TYPE="$(uname)"

echo "📦 Sistema detetado: $OS_TYPE"
mkdir -p "$DEST_PI" "$DEST_SPECIFY"

if [[ "$OS_TYPE" == "Linux" || "$OS_TYPE" == "Darwin" ]]; then
    # --- FLUXO UNIX (Mac e Linux) ---
    echo "🔗 A criar links simbólicos Unix..."
    
    for file in "$SRC_PROMPTS"/*.md; do
        ln -sf "$file" "$DEST_PI/$(basename "$file")"
    done
    
    ln -sfn "$SRC_MEMORY" "$DEST_SPECIFY/memory"
    ln -sfn "$SRC_TEMPLATES" "$DEST_SPECIFY/templates"

elif [[ "$OS_TYPE" == *"MINGW"* || "$OS_TYPE" == *"MSYS"* ]]; then
    # --- FLUXO WINDOWS (Git Bash) ---
    echo "🪟 A criar links simbólicos Windows..."
    
    for file in "$SRC_PROMPTS"/*.md; do
        # O Windows precisa de caminhos específicos para o mklink
        win_src=$(cygpath -w "$file")
        win_dest=$(cygpath -w "$DEST_PI/$(basename "$file")")
        cmd //c "mklink \"$win_dest\" \"$win_src\""
    done
    
    cmd //c "mklink /D \"$(cygpath -w "$DEST_SPECIFY/memory")\" \"$(cygpath -w "$SRC_MEMORY")\""
    cmd //c "mklink /D \"$(cygpath -w "$DEST_SPECIFY/templates")\" \"$(cygpath -w "$SRC_TEMPLATES")\""
fi


# ... (início do script igual)

# 1. HARD LINKS para os Prompts (Arquivos)
# Hard links fazem o arquivo parecer real para o Pi Agent
for file in "$SRC_PROMPTS"/*.md; do
    filename=$(basename "$file")
    rm -f "$DEST_PI/$filename" # Remove o link antigo se existir
    ln "$file" "$DEST_PI/$filename"
done

# 2. Links Simbólicos para as Pastas (Diretórios não aceitam Hard Links)
ln -sfn "$SRC_MEMORY" "$DEST_SPECIFY/memory"
ln -sfn "$SRC_TEMPLATES" "$DEST_SPECIFY/templates"

echo "🚀 Speckit injetado com Hard Links! (Compatibilidade máxima)"
