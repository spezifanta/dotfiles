" We don't need vi compatibility
set nocompatible

" Optimize for fast terminal connections and smoothness
set ttyfast

" Always show the name of the file being edited.
set laststatus=2

" Autosave existing files as soon as vim's windows loses focus. This way no
" manually saving is necessary. Untitled files will get ignored.
" @url http://vim.wikia.com/wiki/Auto_save_files_when_focus_is_lost
autocmd FocusLost * silent! wa

" Theme
colorscheme wombat256

" Turn on syntax highlighting
syntax on

" Highlight searches
set hlsearch

" Default encoding
set encoding=utf-8

" Number of spaces that a <Tab> in a file counts for
set tabstop=4

" Number of spaces for each step of (auto)indent
set shiftwidth=2

" Insert spaces when hitting <Tab>
set expandtab

" But not in Makefiles. We NEED tabs there.
autocmd BufRead,BufNewFile Makefile set noexpandtab

" Automatic indenting
set autoindent

" Limit lines to 80 chars
"set textwidth=80

" Set line numbers
set number

" Enable mouse support for all modes (cheating)
set mouse=a

" Show current mode (insert, replace, visual, etc.)
set showmode

" Show matching brackets
set showmatch
