" ~/.vimrc

" vim-plug settings
call plug#begin('~/.vim/plugged')
Plug 'vim-latex/vim-latex'
Plug 'yuttie/comfortable-motion.vim'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/goyo.vim'
Plug 'kjssad/quantum.vim'
call plug#end()

set nocompatible
filetype plugin indent on
set background=light
set termguicolors
colo quantum
syntax on
hi Normal guibg=NONE 

set hidden
set wildmenu
set showcmd
set hlsearch
set ignorecase
set smartcase
set backspace=indent,eol,start
set autoindent
set nostartofline
set ruler
set laststatus=2
set confirm
set visualbell
set t_vb=
set mouse=a
set cmdheight=2
set number relativenumber
set notimeout ttimeout ttimeoutlen=200
set incsearch
set shiftwidth=4
set softtabstop=4
set expandtab
set spelllang=en

" mappings
vnoremap <C-C> "*y
map <C-p> "*p
map Y y$
nnoremap <C-L> :nohl<CR><C-L>
nnoremap <C-W> :%s/\<<C-r><C-w>\>//g<Left><Left>
nnoremap <F5> :buffers<CR>:buffer<Space>
command D smile     "Very important

" plugin settings
let g:lightline = {
  \ 'colorscheme': 'quantum'
  \ }

" map Caps Lock to Esc
au VimEnter * !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
au VimLeave * !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Caps_Lock'
