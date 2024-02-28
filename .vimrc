set nocompatible
filetype off
set pastetoggle=<F2>
set autoindent
set smartindent
set tabstop=4
set showmatch
set guioptions-=T
set vb t_vb=
set ruler
set nohls
set incsearch
set virtualedit=all
set bs=2
set laststatus=2



" highlighting
set cpoptions+=n
set numberwidth=3
syntax on
set background=dark
set cursorline
set hlsearch

" tabbing
set expandtab
set shiftwidth=4
set softtabstop=2

" folding settings
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=1


colorscheme desert
nmap <silent> // :nohlsearch<CR>

set smartcase
