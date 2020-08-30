" ~/.vimrc

" vim-plug settings
call plug#begin('~/.vim/plugged')
Plug 'kjssad/quantum.vim'
Plug 'yuttie/comfortable-motion.vim'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/goyo.vim'
call plug#end()

filetype plugin indent on
syntax on
colo quantum

set termguicolors
set nocompatible
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
set mouse=a
set cmdheight=2
set number relativenumber
set notimeout ttimeout ttimeoutlen=200
set incsearch
set shiftwidth=2
set softtabstop=2
set expandtab
set exrc
set secure

" mappings
vnoremap <C-C> "*y
map <C-p> "*p
map Y y$
nnoremap <C-L> :nohl<CR><C-L>
nnoremap <C-W> :%s/\<<C-r><C-w>\>//g<Left><Left>
inoremap (<CR> (<CR>)<C-c>O
inoremap {<CR> {<CR>}<C-c>O
inoremap [<CR> [<CR>]<C-c>O

command D smile     "Very important

" remove whitespace from end when saving
autocmd BufWritePre * %s/\s\+$//e

" plugin settings
let g:lightline = {
  \ 'colorscheme': 'quantum'
  \ }

" map Caps Lock to Esc
au VimEnter * !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
au VimLeave * !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Caps_Lock'
