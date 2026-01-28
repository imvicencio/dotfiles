" ===== Config básica para servidores =====

set nocompatible        " Usar Vim moderno
syntax on               " Colores
set number              " Números de línea
set relativenumber      " Líneas relativas (muy útil)
set ruler               " Posición del cursor

set tabstop=2
set shiftwidth=2
set expandtab           " Tabs como espacios
set smartindent

set backspace=indent,eol,start
set nowrap              " No cortar líneas
set showcmd             " Mostrar comandos
set wildmenu            " Autocompletado en comandos

set ignorecase
set smartcase
set incsearch
set hlsearch

set mouse=              " Desactivar mouse (servidores SSH)

set nobackup
set nowritebackup
set noswapfile          " Sin archivos swap raros

set encoding=utf-8
set fileencoding=utf-8

" ===== Atajos útiles =====
nnoremap <F2> :set nonumber! relativenumber!<CR>
nnoremap <F3> :set list!<CR>

" Mostrar espacios y tabs
set listchars=tab:→\ ,trail:·
