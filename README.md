# dotfiles

Configuraciones personales sincronizadas entre máquinas (Ubuntu 🐧 y macOS 🍎).

## Descripción

Este repositorio contiene mis archivos de configuración (dotfiles) que se pueden sincronizar entre diferentes máquinas usando Git. Incluye configuraciones para:

- **Vim** - Editor de texto avanzado
- **Zsh** - Shell interactivo mejorado
- **Git** - Control de versiones

El script de instalación detecta automáticamente tu sistema operativo y configura los symlinks correctos.

## Estructura

```
dotfiles/
├── vim/              # Configuración de Vim
│   └── .vimrc
├── zsh/              # Configuración de Zsh
│   └── .zshrc
├── git/              # Configuración de Git
│   └── .gitconfig
├── bin/              # Scripts personalizados (opcional)
├── install.sh        # Script de instalación automática
└── README.md
```

## 🚀 Instalación rápida

### Primera vez (clonar repositorio)

```bash
# Clonar en la ubicación estándar
git clone <tu-repo-url> ~/.dotfiles
cd ~/.dotfiles

# Ejecutar instalador
bash install.sh
```

### En otra máquina

```bash
# Igual que arriba, el script detectará el SO automáticamente
git clone <tu-repo-url> ~/.dotfiles
cd ~/.dotfiles
bash install.sh
```

### Actualizar después de cambios

```bash
cd ~/.dotfiles
git pull
bash install.sh  # Verifica que todo esté correctamente vinculado
```

## 📝 Editar configuraciones

Después de instalar, puedes editar los archivos directamente:

```bash
# Editar Vim
vim ~/.vimrc

# Editar Zsh
code ~/.zshrc

# Editar Git
cat ~/.gitconfig
```

## 💾 Sincronizar cambios

Después de hacer cambios locales:

```bash
cd ~/.dotfiles

# Ver qué cambió
git status

# Agregar cambios
git add .

# Confirmar cambios
git commit -m "Descripción del cambio"

# Enviar a repositorio remoto
git push
```

Luego en otra máquina:

```bash
cd ~/.dotfiles
git pull
bash install.sh  # Para actualizar symlinks si es necesario
```

## 🔍 Qué hace el instalador

1. **Detecta tu sistema**: macOS o Linux
2. **Crea backups**: Si existen archivos de configuración antiguos, los respalda con timestamp
3. **Crea symlinks**: Vincula los archivos del repositorio a tu directorio home
4. **Verifica instalación**: Muestra qué se instaló correctamente

## 📋 Archivos incluidos

### vim/.vimrc
Configuración optimizada para Vim con:
- Colores y números de línea
- Indentación inteligente (2 espacios)
- Búsqueda con resaltado
- Atajos personalizados

### zsh/.zshrc
Configuración de Zsh con:
- Oh-My-Zsh framework
- Aliases útiles
- Integración con NVM, SDKMAN, Pyenv
- Syntax highlighting
- Compatible con macOS y Linux

### git/.gitconfig
Configuración de Git con:
- Información de usuario
- Colores para mejor visualización
- Aliases útiles (st, co, pl, etc.)

## 🛠️ Personalización

### Agregar nuevas configuraciones

1. Crea una carpeta en dotfiles:
```bash
mkdir -p ~/.dotfiles/tmux
cp ~/.tmuxrc ~/.dotfiles/tmux/.tmuxrc
```

2. Actualiza `install.sh` con una nueva línea:
```bash
create_symlink "$DOTFILES_DIR/tmux/.tmuxrc" "$HOME/.tmuxrc"
```

3. Confirma y sincroniza:
```bash
cd ~/.dotfiles
git add .
git commit -m "Agregar configuración de Tmux"
git push
```

## 🔒 Privacidad

**Importante**: No subas información sensible (contraseñas, tokens, claves privadas) a este repositorio. Si necesitas información privada en archivos de configuración:

1. Crea archivos locales no versionados:
```bash
# Agregar a .gitignore
echo ".zshrc.local" >> ~/.dotfiles/.gitignore
```

2. Sourcea esos archivos desde tu configuración:
```bash
# Al final de .zshrc
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local
```

## 📚 Recursos

- [Vim docs](https://www.vim.org/docs.php)
- [Zsh docs](http://zsh.sourceforge.net/Doc/)
- [Oh-My-Zsh](https://ohmyz.sh/)
- [Git documentation](https://git-scm.com/doc)

## ⚙️ Requisitos

- **Git** - Para clonar y sincronizar
- **Bash** - Para ejecutar el script (viene por defecto)
- **Vim** - Para usar configuración de Vim
- **Zsh** - Para usar configuración de Zsh (instalable en ambos SOs)

## 📄 Licencia

Estos dotfiles son personales. Siéntete libre de adaptarlos a tus necesidades.
