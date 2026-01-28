#!/bin/bash

# Script de instalación para dotfiles
# Crea symlinks a los archivos de configuración

set -e

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Detectar SO (solo informativo)
if [[ "$OSTYPE" == "darwin"* ]]; then
    OS="macOS 🍎"
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    OS="Linux 🐧"
else
    OS="$OSTYPE"
fi

echo "🔧 Instalando dotfiles en $OS"
echo "📂 Directorio: $DOTFILES_DIR"
echo ""

# Función para crear symlink
create_symlink() {
    local source="$1"
    local target="$2"
    
    if [[ -e "$target" ]] && [[ ! -L "$target" ]]; then
        echo "⚠️  $target ya existe. Haciendo backup..."
        mv "$target" "${target}.backup.$(date +%s)"
    fi
    
    if [[ -L "$target" ]]; then
        rm "$target"
    fi
    
    mkdir -p "$(dirname "$target")"
    ln -s "$source" "$target"
    echo "✅ $target -> $source"
}

# Crear symlinks para Vim
create_symlink "$DOTFILES_DIR/vim/.vimrc" "$HOME/.vimrc"

# Crear symlinks para Zsh
create_symlink "$DOTFILES_DIR/zsh/.zshrc" "$HOME/.zshrc"

# Crear symlinks para Git
create_symlink "$DOTFILES_DIR/git/.gitconfig" "$HOME/.gitconfig"

echo ""
echo "✨ ¡Dotfiles instalados exitosamente!"
echo ""
echo "Próximos pasos:"
echo "1. Abre una nueva terminal o ejecuta: source ~/.zshrc"
echo "2. Edita los archivos según necesites"
echo "3. Sincroniza cambios: git add . && git commit -m 'mensaje' && git push"
