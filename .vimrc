set nocompatible

" Load plugin
call plug#begin()
Plug 'sheerun/vim-polyglot'
Plug 'gruvbox-community/gruvbox'
call plug#end()

" Set colorscheme
colorscheme gruvbox

set background=dark

" Set relative line number
set number relativenumber

" Copy to system clipboard
set clipboard+=unnamed

" Autoindent
set autoindent

" Search non-case sensitive, unless type capital letter
set ignorecase
set smartcase

" Highlight searc
set hlsearch

" Word Wrap
set wrap

" Set title
set title

" Map kj to escape key
inoremap kj <esc>

" Syntax highlight
syntax on

" Disable backup and swap file
set nobackup
set noswapfile

" Always show statusline
set laststatus=2

" Auto scroll when close to top/end
set scrolloff=8

" Status line
set statusline=%f      " path to the file
set statusline+=\ -\   " seperator (<space>-<space>)
set statusline+=%y     " filetype
set statusline+=%=     " switch to the right side
set statusline+=%l     " current line number
set statusline+=/      " seperator
set statusline+=%L     " total lines

" Set tab to space
set ts=4 sw=4 sts=4 et
