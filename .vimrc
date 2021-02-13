set number
set nocompatible
set mouse=a
set numberwidth=2
set clipboard=unnamed
syntax enable
set showcmd
set encoding=utf-8
set showmatch
set sw=2
set relativenumber
set cursorline
set noshowmode
set cmdheight=1
set hidden
call plug#begin('~/.vim/plugged')

" Colorschemes
Plug 'morhetz/gruvbox'
Plug 'crusoexia/vim-monokai'
Plug 'dracula/vim', { 'as': 'dracula' } 
" IDE-like

Plug 'easymotion/vim-easymotion'
Plug 'scrooloose/nerdtree'
Plug 'christoomey/vim-tmux-navigator'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
Plug 'tpope/vim-surround'
Plug 'mcchrish/nnn.vim'
Plug 'rakr/vim-one'
Plug 'connorholyday/vim-snazzy'

call plug#end()

" Config nerd tree
let NERDTreeQuitOnOpen=1
let mapleader=" "

" Set colorscheme
" set t_Co=256
colorscheme gruvbox
" set background=dark
let g:gruvbox_contrast_dark = "soft"

" --------------- " 
" Config airline  "
" --------------- "
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = ''

" 
" Enable powerline fonts
"
let g:airline_powerline_fonts = 1
let g:airline_left_sep = ''
let g:airline_right_sep = ''

"
" Set theme
"
let g:airline_theme='gruvbox'

"
" Always show tabs
"
set showtabline=2

" ---------------------- "
" End of airline config  "
" ---------------------- "


nmap <Leader>s <Plug>(easymotion-s2)
nmap <Leader>nt :NERDTreeFind<CR>

nmap <Leader>w :w<CR>
nmap <Leader>q :q<CR>
