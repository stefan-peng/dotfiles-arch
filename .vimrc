call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-sensible'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'junegunn/goyo.vim'
Plug 'altercation/vim-colors-solarized'
call plug#end()

"Basic
set backspace=2   " Backspace deletes like most programs in insert mode
set nobackup
set nowritebackup
set noswapfile    " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set history=50
set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands
set incsearch     " do incremental searching
set laststatus=2  " Always display the status line
set autowrite     " Automatically :write before running commands

"Colors
set background=dark
"colorscheme solarized
syntax on

"Text
set linebreak
set nojoinspaces
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

"Markdown
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_conceal = 0
let g:tex_conceal = ""
let g:vim_markdown_math = 1
let g:vim_markdown_math = 1
let g:vim_markdown_frontmatter = 1

"Bindings
let mapleader = " "
nnoremap <Leader>t :TableFormat<CR>
nnoremap <Leader><Leader> <c-^>
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <Leader>g :Goyo<CR>
nnoremap <Leader>p :!md2report<CR>

"Layout
set splitbelow
set splitright
