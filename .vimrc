"====================
" Display 
"====================
" syntax highlight 
syntax on
syntax enable

" set 256 colors
set t_Co=256

" color theme
colo railscasts
set background=dark
colorscheme solarized

" if the file is changed outside vim, then read the file 
set autoread 

" display cursor position 
set ruler 

" display options 
set number " display line number
set nowrap " wrap off lines
set sidescroll=10 " automatically scroll when the cursor moves to bottom

" display the last command 
set showcmd


"====================
" Key bindings 
"====================

" map leader to ','
let mapleader=","

"====================
" Editing
"====================

" indent based on the type of file 
filetype indent plugin on 

" indent of the previous line for a newly created line
set autoindent
set smartindent 


" no tabs in source file; 4 space characters for tab
set expandtab
set shiftwidth=4 
set tabstop=4 

" text width at each line 
set textwidth=72

" encoding scheme 
set encoding=utf8

" spelling check 
set spell

"====================
" Movement 
"====================
" adjust the screen when jumping to bottom section
map G Gzz5<C-y>

"====================
" Search 
"====================
set ignorecase " turn off case-sensetive search
set incsearch " search while typing 
set nowrapscan " stop search at the end of file 


" turn off search highlight with ,-<space>
nnoremap <leader>n :noh<CR>

"====================
" Plugins
"====================

filetype plugin indent on 

" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
call plug#begin('~/.vim/plugged')

"Plug 'jpo/vim-railscasts-theme'  
Plug 'junegunn/vim-easy-align'
Plug 'altercation/vim-colors-solarized' " color theme 
Plug 'haya14busa/incsearch.vim' " search plugin
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'w0rp/ale' " syntax and semantical error reporter
Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf' " fuzzy finding 
Plug 'terryma/vim-smooth-scroll' " creates nice srolling effect
Plug 'scrooloose/nerdtree' " file system explorer 
Plug 'benmills/vimux' " integrate vim with tmux
Plug 'eagletmt/ghcmod-vim' " Haskell integration
Plug 'godlygeek/tabular' " auto alignment
Plug 'scrooloose/nerdcommenter' " comment
Plug 'ervandew/supertab' " perform insert mode completions
Plug 'garbas/vim-snipmate' " insert snippets
Plug 'MarcWeber/vim-addon-mw-utils' " dependency for snipmate
Plug 'tomtom/tlib_vim' " dependency fro snipmate

" Initialize plugin system
call plug#end()


"====================
" Plugin settings
"====================

" use ctrl + h/j/k/l for moving between windows
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Easy-align plugin setting 
xmap ga  <Plug>(EasyAlign)
nmap ga  <Plug>(EasyAligh)
xmap gai <Plug>(LiveEasyAlign)
nmap gai <Plug>(LiveEasyAlign)
" format = ['x %d', '⚠ %d', '⬥ ok']

" Ale 
let g:ale_set_highlights=1 

" Airline
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enable=1
let g:airline#extensions#tabline#show_buffers=0
let g:airline#extensions#tabline#show_close_button=0

let g:airline_theme='molokai'

" Vim-smooth-scroll plugin setting 
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 50, 3)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 50, 3)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 50, 5)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 50, 5)<CR>

" NERDTree plugin setting 
map <Leader>n :NERDTreeToggle<CR>
" autocmd StdinReadPre * let s:std_in=1
" autocmd vimenter * NERDTree
" autocmd vimenter * wincmd p 
" let NERDTreeQuitOnOpen = 1
" let NERDTreeAutoDeleteBuffer = 1 
" nnoremap <C-W-W> <C-W><C-W>

" Vimux setting 
" prompt for command to run by pressing ,-vp
map <Leader>vp :VimuxPromptCommand<CR> 
" run last command executed by VimuxCommand
map <Leader>vr :VimuxRunLastCommand<CR>
" inspect runner pane
map <Leader>vi :VimuxInspectRunner<CR>

" Tabularize 
let g:haskell_tabular=1
vmap a= :Tabularize /=<CR>  " align by =
vmap a; :Tabularize /::<CR> " align by ::
vmap a- :Tabularize /-><CR> " align by -> 

