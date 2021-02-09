" Autoload Vim-Plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

filetype off                  " required
call plug#begin('~/.vim/plugged')

" Plugins
Plug 'lifepillar/vim-solarized8'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-rails'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-endwise'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'dense-analysis/ale'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
call plug#end()            " required

filetype plugin indent on    " required!

" General settings
set nocompatible    " Use Vim settings, rather then Vi settings
set nobackup
set nowritebackup
set noswapfile
set history=50
set signcolumn=yes  " shows column with errors icons
set ruler           " show the cursor position all the time
set showcmd         " display incomplete commands
set incsearch       " do incremental searching
set laststatus=2    " Always display the status line
set modelines=5     " Debian likes to disable this
set showmatch       " Show matching brackets.
set tabstop=2
set shiftwidth=2
set expandtab
set backupdir=~/.backup
set undodir=~/.backup
set cursorline
set wildignorecase
set hidden
set ignorecase
set ttyfast
set lazyredraw
set tags=./tags;
set completeopt=longest,menuone
set encoding=utf-8
set fileformat=unix

" Reloads vim config
nnoremap confr :source $MYVIMRC<CR>

" FZF config
let $FZF_DEFAULT_COMMAND = 'ag -g ""'

" Help keep lines within 110 columns
set colorcolumn=110

syntax on
filetype on                   " required!

" Display extra whitespace
set list listchars=tab:»·,trail:·

" Use Ack instead of Grep when available
if executable("ack")
  set grepprg=ack\ -H\ --nogroup\ --nocolor
endif

" set relativenumber
set number
set numberwidth=4

" Markdown files end in .md
au BufRead,BufNewFile *.md set filetype=markdown
au BufRead,BufNewFile *.md set spell

" Remove whitespaces
autocmd BufWritePre * if !(&filetype == 'markdown') | :%s/\s\+$//e | endif

" Clipboard settings
set clipboard=unnamed
" set clipboard+=unnamedplus
" noremap <leader>y "+y
" noremap <leader>yy "+Y
"
" " Preserve indentation while pasting text from the OS X clipboard
" noremap <leader>p :set paste<CR>:put  *<CR>:set nopaste<CR>
" noremap y "*y
" noremap yy "*yy
" noremap Y "*y$
" noremap x "*x
" noremap dd "*dd
" noremap D "*D

" Solarized Theme
set termguicolors
set background=dark
colorscheme solarized8

" Airline (statsline) configuration
let g:airline_theme='solarized'
let g:airline_solarized_bg='dark'

" Ale linting
set omnifunc=ale#completion#OmniFunc
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
let g:ale_open_list = 1
let g:ale_keep_list_window_open = 0
let g:ale_completion_enabled = 0
let g:ale_linters = {
        \ 'ruby': ['ruby', 'solargraph', 'rubocop']
        \}
let g:ale_fixers = {
        \ '*': ['remove_trailing_lines', 'trim_whitespace'],
        \ 'ruby': ['rubocop']
        \}
highlight link qfError debug
highlight link ALEErrorSign debug

" FZF config
let g:fzf_preview_window = 'right:60%'
let g:fzf_tags_command = 'ctags -R'

" Nerdtree
map <C-e> :NERDTreeToggle<CR>

" LanguageClient
let g:LanguageClient_serverCommands = {
    \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
    \ 'javascript': ['/usr/local/bin/javascript-typescript-stdio'],
    \ 'javascript.jsx': ['tcp://127.0.0.1:2089'],
    \ 'python': ['/usr/local/bin/pyls'],
    \ 'ruby': ['solargraph', 'stdio']
    \ }

nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

" Autocomplete under ctrl+space
inoremap <expr> <C-Space> pumvisible() \|\| &omnifunc == '' ?
      \ "\<lt>C-n>" :
      \ "\<lt>C-x>\<lt>C-o><c-r>=pumvisible() ?" .
      \ "\"\\<lt>c-n>\\<lt>c-p>\\<lt>c-n>\" :" .
      \ "\" \\<lt>bs>\\<lt>C-n>\"\<CR>"

" Select element from list by pressing space
inoremap <expr> <Space> pumvisible() ? "\<C-y>" : " "

" Autocomplete movement - jk
inoremap <expr> j ((pumvisible())?("\<C-n>"):("j"))
inoremap <expr> k ((pumvisible())?("\<C-p>"):("k"))

if has("unix")
  let s:uname = system("echo -n \"$(uname)\"")
  if !v:shell_error && s:uname == "Linux"
    set t_BE=
  endif
endif

" ctags
map <Leader>rt :!ctags --extra=+f --exclude=.git --exclude=log -R * vendor/bundle/*<CR><CR>

nnoremap <Leader>vr :source $MYVIMRC<CR>
