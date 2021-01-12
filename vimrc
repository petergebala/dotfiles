let $FZF_DEFAULT_COMMAND = 'ag -g ""'

" Autoload Vim-Plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

filetype off                  " required
call plug#begin('~/.vim/plugged')

" Plugins
Plug 'VundleVim/Vundle.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'tomtom/tcomment_vim'
Plug 'Lokaltog/vim-powerline'
Plug 'tpope/vim-rails'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-endwise'
Plug 'scrooloose/nerdtree'
Plug 'mileszs/ack.vim'
Plug 'ekalinin/Dockerfile.vim'
Plug 'vim-syntastic/syntastic'
Plug 'ludovicchabant/vim-gutentags'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

call plug#end()            " required
filetype plugin indent on    " required!

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
set encoding=utf-8
set fileformat=unix

" Autocomplete - hit enter to pick element
" inoremap <expr> <CR> pumvisible() ? "\<C-Y>" : "\<C-g>u\<CR>"
" open omni completion menu closing previous if open and opening new menu without changing the text
" inoremap <expr> <C-Space> (pumvisible() ? (col('.') > 1 ? '<Esc>i<Right>' : '<Esc>i') : '') .
"             \ '<C-x><C-o><C-r>=pumvisible() ? "\<lt>C-n>\<lt>C-p>\<lt>Down>" : ""<CR>'
" " open user completion menu closing previous if open and opening new menu without changing the text
" inoremap <expr> <S-Space> (pumvisible() ? (col('.') > 1 ? '<Esc>i<Right>' : '<Esc>i') : '') .
"             \ '<C-x><C-u><C-r>=pumvisible() ? "\<lt>C-n>\<lt>C-p>\<lt>Down>" : ""<CR>'

" Help keep lines within 80 columns
set colorcolumn=110

syntax on
filetype on                   " required!

" Display extra whitespace
set list listchars=tab:»·,trail:·

" Use Ack instead of Grep when available
if executable("ack")
  set grepprg=ack\ -H\ --nogroup\ --nocolor
endif

" Use The Silver Searcher instead of Grep when available
if executable('ag')
  let g:ackprg='ag --vimgrep'
endif

" set relativenumber
set number
set numberwidth=4

" Replace double quotes with single quotes
nmap <Leader>' :s/"/'/g<CR>

" Markdown files end in .md
au BufRead,BufNewFile *.md set filetype=markdown
au BufRead,BufNewFile *.md set spell

" Remove whitespaces
autocmd BufWritePre * if !(&filetype == 'markdown') | :%s/\s\+$//e | endif

" Ctrl+Q now is working
silent !stty -ixon > /dev/null 2>/dev/null

set clipboard+=unnamedplus
" " Yank to clipboard
" set clipboard=unnamedplus,unnamed
" noremap <leader>y "+y
" noremap <leader>yy "+Y
"
" " Preserve indentation while pasting text from the OS X clipboard
" noremap <leader>p :set paste<CR>:put  *<CR>:set nopaste<CR>

" Solarized
set background=dark
let g:solarized_termtrans = 1
let g:solarized_termcolors = 256
colorscheme solarized

" FZF config
let g:fzf_preview_window = 'right:60%'
let g:fzf_tags_command = 'ctags -R'

" Nerdtree
map <C-e> :NERDTreeToggle<CR>

" Autocomplete under ctrl+space
set omnifunc=syntaxcomplete#Complete
set completeopt=longest,menuone
inoremap <expr> <C-Space> pumvisible() \|\| &omnifunc == '' ?
      \ "\<lt>C-n>" :
      \ "\<lt>C-x>\<lt>C-o><c-r>=pumvisible() ?" .
      \ "\"\\<lt>c-n>\\<lt>c-p>\\<lt>c-n>\" :" .
      \ "\" \\<lt>bs>\\<lt>C-n>\"\<CR>"
imap <C-@> <C-Space>
inoremap <expr> <Space> pumvisible() ? "\<C-y>" : " "

" Autocomplete movement - jk
inoremap <expr> j ((pumvisible())?("\<C-n>"):("j"))
inoremap <expr> k ((pumvisible())?("\<C-p>"):("k"))

inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a

" automaticly align
function! s:align()
  let p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction

" Syntastic
set statusline=%f%h%w%m%r
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
set statusline+=%=L%l:C%c:P%p " Line no, column no, percentage of the file

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_ruby_checkers = ['rubocop', 'mri']

" let g:syntastic_debug = 3
if has("unix")
  let s:uname = system("echo -n \"$(uname)\"")
  if !v:shell_error && s:uname == "Linux"
    set t_BE=
  endif
endif

" ctags
map <Leader>rt :!ctags --extra=+f --exclude=.git --exclude=log -R * vendor/bundle/*<CR><CR>

nnoremap <Leader>vr :source $MYVIMRC<CR>
