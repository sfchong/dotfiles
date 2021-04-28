" Set relative line number
set relativenumber

" Set line number color
highlight LineNr ctermfg=grey

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
