set clipboard=unnamed
set nocompatible               " be iMproved
set encoding=utf8
set hlsearch

runtime macros/matchit.vim

"filetype off
" Change cursor shape between insert and normal mode in iTerm2.app
"if $TERM_PRO"GRAM =~ "iTerm"
  "let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
  "let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
"endif

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



"use leader for window operation
let mapleader=  " "
nmap <leader>j  <c-d>
nmap <leader>k  <c-u>
nmap <leader>w  <c-w>

"scroll  related window
nmap ∆ <c-w>p<c-e><c-w>p
nmap ˚ <c-w>p<c-y><c-w>p

" Complete English word
setlocal dictionary+=~/.vim/dict/english.dict



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

colorscheme zenburn

if has("gui_running")
  syntax enable
  colorscheme desert
  set bs=2
  set ruler
  set gfn=Monaco:h14
  set shell=/bin/bash
endif

" git
Plugin 'tpope/vim-fugitive'

" 中文输入法问题
" http://www.jianshu.com/p/4d81b7e32bff
"Plugin 'CodeFalling/fcitx-vim-osx'

" Plugin 'hongqn/vim-osx-ime'

" Support Ruby
Plugin 'vim-ruby/vim-ruby'
" To use var vir to select Ruby code black
Plugin 'kana/vim-textobj-user'
Plugin 'nelstrom/vim-textobj-rubyblock'

" ruby command for rvm
Plugin 'tpope/vim-rvm'
" quickly move cursor, try ,,w
Plugin 'Lokaltog/vim-easymotion'

" quickly write HTML, just like zencoding but simple engough
"Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
"let g:sparkupNextMapping= "<c-m>"

Plugin 'mattn/emmet-vim'
let g:user_emmet_leader_key = '<C-i>'
let g:user_emmet_install_global = 1
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
"Plugin 'valloric/youcompleteme'
"youcompleteme  默认tab  s-tab 和 ultisnips 冲突
let g:ycm_key_list_select_completion = ['<Down>']
let g:ycm_key_list_previous_completion = ['<Up>']
" 括号补齐
Plugin 'raimondi/delimitmate'
Plugin 'pangloss/vim-javascript'

" add end in ruby code
Plugin 'tpope/vim-endwise'


" 代码段
"Plugin 'sirver/ultisnips'
" 别人收集的片段
"Plugin 'honza/vim-snippets'

" 颜色主题
Plugin 'chriskempson/base16-vim'
Plugin 'tomasr/molokai'
" 换颜色
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-colorscheme-switcher'



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
