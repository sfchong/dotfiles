" Set relative line number
set relativenumber

" Autoindent
set autoindent

" Search non-case sensitive, unless type capital letter
set smartcase

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

" Status line
set statusline=%f      " path to the file
set statusline+=\ -\   " seperator (<space>-<space>)
set statusline+=%y     " filetype
set statusline+=%=     " switch to the right side
set statusline+=%l     " current line number
set statusline+=/      " seperator
set statusline+=%L     " total lines

"test symb link comment
