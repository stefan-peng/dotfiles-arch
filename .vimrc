if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-sensible'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'junegunn/goyo.vim'
Plug 'w0rp/ale'
Plug 'altercation/vim-colors-solarized'
Plug 'jeffkreeftmeijer/vim-dim'
Plug 'dylanaraps/wal.vim'
Plug 'arcticicestudio/nord-vim'
Plug 'lervag/vimtex'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'vimwiki/vimwiki'
Plug 'JuliaEditorSupport/julia-vim'
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
if !has('gui_running')
"  set t_Co=256
endif
syntax enable
set background=dark
"let g:solarized_termtrans=1
colorscheme nord

"Text
set linebreak
set nojoinspaces
set tabstop=4
set shiftwidth=4
set shiftround
set expandtab

"Markdown
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_conceal = 0
let g:tex_conceal = ""
let g:vim_markdown_math = 1
let g:vim_markdown_math = 1
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_new_list_item_indent = 4

autocmd BufNewFile,BufFilePre,BufRead *.md hi link mkdLineBreak Underlined

"Vimwiki
let g:vimwiki_list = [{'path': '~/OneDrive/Documents/School/HIST202-Notes/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]

"Latex
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=0
let g:tex_conceal='abdmg'

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

"Yank text to the OS X clipboard
noremap <leader>y "*y
noremap <leader>yy "*Y

"Preserve indentation while pasting text from the OS X clipboard
noremap <leader>p :set paste<CR>:put  *<CR>:set nopaste<CR>

"Layout
set splitbelow
set splitright

"Linting
let g:ale_linters = {
\   'javascript': ['standard'],
\}
autocmd bufwritepost *.js silent !standard --fix %
set autoread
let g:jsx_ext_required = 0 " Allow JSX in normal JS files
