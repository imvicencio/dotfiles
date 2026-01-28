#!/bin/bash

# Script para actualizar dotfiles en todas las máquinas
# Sincroniza cambios locales y tira de actualizaciones

DOTFILES_DIR="$HOME/.dotfiles"

if [[ ! -d "$DOTFILES_DIR" ]]; then
    echo "❌ Dotfiles no encontrado en $DOTFILES_DIR"
    exit 1
fi

cd "$DOTFILES_DIR"

echo "🔄 Actualizando dotfiles..."
echo ""

# Mostrar cambios locales
if [[ ! -z $(git status -s) ]]; then
    echo "📝 Cambios locales detectados:"
    git status -s
    echo ""
    echo "¿Deseas confirmar estos cambios? (s/n)"
    read -r response
    
    if [[ "$response" == "s" ]] || [[ "$response" == "yes" ]]; then
        echo "Ingresa un mensaje de commit:"
        read -r commit_msg
        git add .
        git commit -m "$commit_msg"
        git push
        echo "✅ Cambios sincronizados"
    fi
fi

# Descargar cambios remotos
echo "Descargando cambios remotos..."
git pull

# Asegurar que symlinks están correctos
echo "Verificando symlinks..."
bash "$DOTFILES_DIR/install.sh"

echo ""
echo "✨ Dotfiles actualizados completamente"
