" General settings
set nocompatible    " Use Vim settings, rather then Vi settings
set nobackup
set nowritebackup
set noswapfile
set history=50
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

" Autocomplete - hit enter to pick element
" inoremap <expr> <CR> pumvisible() ? "\<C-Y>" : "\<C-g>u\<CR>"
" open omni completion menu closing previous if open and opening new menu without changing the text
" inoremap <expr> <C-Space> (pumvisible() ? (col('.') > 1 ? '<Esc>i<Right>' : '<Esc>i') : '') .
"             \ '<C-x><C-o><C-r>=pumvisible() ? "\<lt>C-n>\<lt>C-p>\<lt>Down>" : ""<CR>'
" " open user completion menu closing previous if open and opening new menu without changing the text
" inoremap <expr> <S-Space> (pumvisible() ? (col('.') > 1 ? '<Esc>i<Right>' : '<Esc>i') : '') .
"             \ '<C-x><C-u><C-r>=pumvisible() ? "\<lt>C-n>\<lt>C-p>\<lt>Down>" : ""<CR>'

" Help keep lines within 80 columns
set colorcolumn=80

syntax on
filetype off                   " required!

" Display extra whitespace
set list listchars=tab:»·,trail:·

" Use Ack instead of Grep when available
if executable("ack")
  set grepprg=ack\ -H\ --nogroup\ --nocolor
endif

" Use The Silver Searcher instead of Grep when available
if executable("ag")
  set grepprg=ag\ --nogroup\ --nocolor
endif

" set relativenumber
set number
set numberwidth=4

" Cucumber navigation commands
autocmd User Rails Rnavcommand step features/step_definitions -glob=**/* -suffix=_steps.rb
autocmd User Rails Rnavcommand config config -glob=**/* -suffix=.rb -default=routes

" :Cuc my text (no quotes) -> runs cucumber scenarios containing "my text"
command! -nargs=+ Cuc :!ack --no-heading --no-break <q-args> | cut -d':' -f1,2 | xargs bundle exec cucumber --no-color

" Replace double quotes with single quotes
nmap <Leader>' :s/"/'/g<CR>

" Markdown files end in .md
au BufRead,BufNewFile *.md set filetype=markdown
au BufRead,BufNewFile *.md set spell

" Remove whitespaces
autocmd BufWritePre *.rb :%s/\s\+$//e

" Ctrl+Q now is working
silent !stty -ixon > /dev/null 2>/dev/null

" Yank to clipboard
set clipboard=unnamedplus
noremap <leader>y "+y
noremap <leader>yy "+Y

" Preserve indentation while pasting text from the OS X clipboard
noremap <leader>p :set paste<CR>:put  *<CR>:set nopaste<CR>

" Vundle configrauton
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Bundled plugins
Bundle 'altercation/vim-colors-solarized'
Bundle 'tomtom/tcomment_vim'
Bundle 'Lokaltog/vim-powerline'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-bundler'
Bundle 'tpope/vim-sensible'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-endwise'
Bundle 'slim-template/vim-slim'
Bundle 'kchmck/vim-coffee-script'
Bundle 'scrooloose/nerdtree'
Bundle 'mileszs/ack.vim'
Bundle 'msanders/snipmate.vim'
Bundle 'kien/ctrlp.vim'
Bundle 'godlygeek/tabular'
Bundle 'ekalinin/Dockerfile.vim'

filetype plugin indent on     " required!

" Solarized
set background=dark
let g:solarized_termtrans = 1
let g:solarized_termcolors = 256

" Map CtrlP
let g:ctrlp_map = '<c-P>'

colorscheme solarized

" Nerdtree
map <C-e> :NERDTreeToggle<CR>
