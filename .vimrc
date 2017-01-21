set clipboard=unnamed
set nocompatible               " be iMproved
set encoding=utf8
set hlsearch
"filetype off


"chenxi customized keymap:
"simulate emeacs keys:
imap <C-d> <DELETE>
imap <C-a> <HOME>
imap <C-e> <END>
imap <C-b> <LEFT>
imap <C-f> <RIGHT>

imap <C-h> <LEFT>
imap <C-l> <RIGHT>
imap <C-j> <DOWN>
imap <C-k> <UP>

"


"use leader for window operation
let mapleader=  " "
nmap <leader>j  <c-d>
nmap <leader>k  <c-u>
nmap <leader>w  <c-w>
"scroll  related window
nmap ∆ <c-w>p<c-e><c-w>p
nmap ˚ <c-w>p<c-y><c-w>p


set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Plugin manage Vundle
" required!
Plugin 'gmarik/Vundle.vim'

" 1 tab to 2 space for ruby
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
" number line show
set nu

" input source improve for gui vim
if has("gui_running")
  set noimdisable
  set imi=2
  set ims=2
endif

set noswapfile
"in order to switch between buffers with unsaved change
set hidden

" hightlight col and line
set cursorline
"set cursorcolumn

colorscheme desert

if has("gui_running")
  syntax enable
  colorscheme desert
  set bs=2
  set ruler
  set gfn=Monaco:h14
  set shell=/bin/bash
endif

" EasyMotion_leader_key .
" Plugin Plugin here for Ruby on Rails
" git
Plugin 'tpope/vim-fugitive'
" 中文输入法问题
" Plugin 'hongqn/vim-osx-ime'
" ruby command for rvm
Plugin 'tpope/vim-rvm'
" quickly move cursor, try ,,w
Plugin 'Lokaltog/vim-easymotion'
" quickly write HTML, just like zencoding but simple engough
"Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
"let g:sparkupNextMapping= "<c-m>"
Plugin 'mattn/emmet-vim'
let g:user_emmet_install_global = 1
let g:user_emmet_mode='inv'
let g:user_emmet_expandabbr_key= '<C-z>'
let g:user_emmet_expandabbr_key = '<C-z>,'
let g:user_emmet_expandword_key = '<C-z>;'
let g:user_emmet_update_tag = '<C-z>u'
let g:user_emmet_balancetaginward_key = '<C-z>d'
let g:user_emmet_balancetagoutward_key = '<C-z>D'
let g:user_emmet_next_key = '<C-z>n'
let g:user_emmet_prev_key = '<C-z>N'
let g:user_emmet_imagesize_key = '<C-z>i'
let g:user_emmet_togglecomment_key = '<C-z>/'
let g:user_emmet_splitjointag_key = '<C-z>j'
let g:user_emmet_removetag_key = '<C-z>k'
let g:user_emmet_anchorizeurl_key = '<C-z>a'
let g:user_emmet_anchorizesummary_key = '<C-z>A'
let g:user_emmet_mergelines_key = '<C-z>m'
let g:user_emmet_codepretty_key = '<C-z>c'

autocmd FileType html,css,eruby EmmetInstall
" power vim plugin for rails
Plugin 'tpope/vim-rails.git'
" vim rails syntax complete, try ctrl+x ctrl+u
set completefunc=syntaxcomplete#Complete
" quickly comment your code, try ,cc on selected line
Plugin 'vim-scripts/The-NERD-Commenter'


" indent guides
let g:indent_guides_guide_size = 1
Plugin 'nathanaelkane/vim-indent-guides'
" indent guides shortcut
map <silent><F7>  <leader>ig

" markdown support
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
let g:vim_markdown_folding_disabled = 1

" file tree like something called IDE
Plugin 'scrooloose/nerdtree'
map <silent><F8> :NERDTree<CR>
nmap <leader>f :NERDTreeToggle <CR>

" coffeescript
Plugin 'kchmck/vim-coffee-script'
autocmd BufNewFile,BufRead *.coffee set filetype=coffee


" basic dependence
Plugin 'L9'

" slim template support
Plugin 'slim-template/vim-slim.git'

" hack filetype for slim
autocmd BufNewFile,BufRead *.slim set filetype=slim

" quickly search file(s), use ctrl+p, F5 refresh
Plugin 'kien/ctrlp.vim'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip

"let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = '\v[\/]\.(DS_Store|git|hg|svn)|(optimized|compiled|node_modules)$'
map <c-o> :CtrlPBuffer<CR>
filetype plugin indent on     " required!
syntax on

" sass highlight
Plugin 'JulesWang/css.vim'
Plugin 'cakebaker/scss-syntax.vim'

" Gundo
Plugin 'vim-scripts/Gundo'
nnoremap U :GundoToggle<CR>

" dbext
Plugin 'vim-scripts/dbext.vim'

" surround
Plugin 'tpope/vim-surround'

" ormode
Plugin 'jceb/vim-orgmode'


" syntax check;
Plugin 'scrooloose/syntastic'
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


" auto ctags for rails project
Plugin 'szw/vim-tags'
" search in other files
Plugin 'mileszs/ack.vim'
" status bar
Plugin 'vim-airline/vim-airline'

" taglist
Plugin 'majutsushi/tagbar'
nmap <leader>t :Tagbar <CR>

" code completion
" Plugin 'valloric/youcompleteme'



Plugin 'pangloss/vim-javascript'

call vundle#end()
" support css word with -
autocmd FileType css,scss,slim,html,eruby,coffee,javascript setlocal iskeyword+=-
autocmd Filetype python setlocal tabstop=4 shiftwidth=4 softtabstop=4

" vim 7.4 backspace fix
set backspace=indent,eol,start
set t_Co=256
" colorscheme, read here: http://vim.wikia.com/wiki/Change_the_color_scheme
" colorscheme molokai
" clear trailing spaces when u save
autocmd BufWritePre * :%s/\s\+$//e
" asdfasdf
