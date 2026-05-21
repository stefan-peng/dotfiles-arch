set encoding=utf-8

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
"Plug 'dylanaraps/wal.vim'
"Plug 'arcticicestudio/nord-vim'
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
set modelines=0   " Disable modelines as a security precaution
set nomodeline
set mouse+=a

" Autoread files
set autoread
au FocusGained,BufEnter * :silent! checktime

" When the type of shell script is /bin/sh, assume a POSIX-compatible
" shell for syntax highlighting purposes.
let g:is_posix = 1

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
endif

filetype plugin indent on

"Colors
if !has('gui_running')
"  set t_Co=256
endif
set background=dark
let g:solarized_termtrans=1
set notermguicolors
highlight Search ctermfg=0
colorscheme dim

augroup vimrcEx
  autocmd!

  " When editing a file, always jump to the last known cursor position.
  " Don't do it for commit messages, when the position is invalid, or when
  " inside an event handler (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  " Set syntax highlighting for specific file types
  autocmd BufRead,BufNewFile *.md set filetype=markdown
  autocmd BufRead,BufNewFile .{jscs,jshint,eslint}rc set filetype=json
  autocmd BufRead,BufNewFile
    \ aliases.local,
    \zshenv.local,zlogin.local,zlogout.local,zshrc.local,zprofile.local,
    \*/zsh/configs/*
    \ set filetype=sh
  autocmd BufRead,BufNewFile gitconfig.local set filetype=gitconfig
  autocmd BufRead,BufNewFile tmux.conf.local set filetype=tmux
  autocmd BufRead,BufNewFile vimrc.local set filetype=vim
augroup END

"Text
set linebreak
set nojoinspaces
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·

" Make it obvious where 80 characters is
"set textwidth=80
set colorcolumn=+1

" Numbers
set number
set numberwidth=5
set relativenumber

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

" Tab completion
" will insert tab at beginning of line,
" will use completion if not at beginning
set wildmode=list:longest,list:full
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<Tab>"
    else
        return "\<C-p>"
    endif
endfunction
inoremap <Tab> <C-r>=InsertTabWrapper()<CR>
inoremap <S-Tab> <C-n>

" Switch between the last two files
nnoremap <Leader><Leader> <C-^>

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

" Move between linting errors
nnoremap ]r :ALENextWrap<CR>
nnoremap [r :ALEPreviousWrap<CR>

"Yank text to the OS X clipboard
noremap <leader>y "*y
noremap <leader>yy "*Y

"Preserve indentation while pasting text from the OS X clipboard
noremap <leader>p :set paste<CR>:put  *<CR>:set nopaste<CR>

" Run commands that require an interactive shell
nnoremap <Leader>r :RunInInteractiveShell<Space>

"Layout
set splitbelow
set splitright

"Linting
let g:ale_linters = {
\   'javascript': ['standard'],
\}
autocmd bufwritepost *.js silent !standard --fix %
let g:jsx_ext_required = 0 " Allow JSX in normal JS files

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

set spellfile=$HOME/.vim-spell-en.utf-8.add

" Autocomplete with dictionary words when spell check is on
set complete+=kspell

" Always use vertical diffs
set diffopt+=vertical
