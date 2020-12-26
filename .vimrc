" ~/.vimrc

" Plugin manager settings.
call plug#begin('~/.vim/plugged')
Plug 'junegunn/seoul256.vim'
Plug 'itchyny/lightline.vim'
Plug 'yuttie/comfortable-motion.vim'
Plug 'junegunn/goyo.vim'
call plug#end()

" Nice light colorscheme for 256 color terminals.
let g:seoul256_background=256
let g:lightline = {'colorscheme': 'seoul256'}
colorscheme seoul256
set background=light

" Type :help <option> to find purpose of each option.
filetype plugin indent on
set autoindent
set backspace=indent,eol,start
set cmdheight=2
set confirm
set expandtab
set exrc
set hidden
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set mouse=a
set nocompatible
set nostartofline
set notimeout ttimeout ttimeoutlen=200
set number relativenumber
set ruler
set secure
set shiftwidth=2
set showcmd
set smartcase
set softtabstop=2
set wildmenu
syntax on

" Own custom mappings, trying to keep these at minimum.
vnoremap <C-C> "*y
map <C-p> "*p
map Y y$
nnoremap <C-L> :nohl<CR><C-L>
nnoremap <C-X> :%s/\<<C-r><C-w>\>//g<Left><Left>
nnoremap <Tab> <Esc>
vnoremap <Tab> <Esc>gV
onoremap <Tab> <Esc>
cnoremap <Tab> <C-C><Esc>
inoremap <Tab> <Esc>`^
inoremap <Leader><Tab> <Tab>

" Very important.
command D smile

" Remove whitespace from end when saving.
autocmd BufWritePre * %s/\s\+$//e
