"====================
" Display 
"====================
" syntax highlight 
syntax on
syntax enable

" set 256 colors
set t_Co=256

" color theme
color railscasts
set background=light
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

" map leader to space 
let mapleader=" "

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
" Custom Binding 
"====================
" "Aliases" for commonly used commands+lazy shift finger:
command! -bar -nargs=* -complete=file -range=% -bang W <line1>,<line2>write<bang> <args>
command! -bar -nargs=* -complete=file -range=% -bang Write <line1>,<line2>write<bang> <args>
command! -bar -nargs=* -complete=file -range=% -bang Wq <line1>,<line2>wq<bang> <args>
command! -bar                                  -bang Wqall wqa<bang>
command! -bar -nargs=* -complete=file -range=% -bang We <line1>,<line2>w<bang> | e <args>
command! -bar -nargs=* -complete=file -count   -bang Wnext <count>wnext<bang> <args>
command! -bar -nargs=* -complete=file -count   -bang Wprevious <count>wprevious<bang> <args>
command! -bar -nargs=* -complete=file          -bang E edit<bang> <args>
command! -bar -nargs=* -complete=file          -bang Edit edit<bang> <args>
command! -bar                                  -bang Q quit<bang>
command! -bar                                  -bang Quit quit<bang>
command! -bar                                  -bang Qall qall<bang>
command! -bar -nargs=? -complete=option              Set       set <args>
command! -bar -nargs=? -complete=help                Help      help <args>
command! -bar -nargs=* -complete=file          -bang Make make<bang> <args>
command! -bar -nargs=* -complete=buffer        -bang Bdel bdel<bang> <args>
command! -bar -nargs=* -complete=buffer        -bang Bwipe bwipe<bang> <args>
command! -bar -nargs=* -complete=file          -bang Mksession mksession<bang> <args>
command! -bar -nargs=* -complete=dir           -bang Cd cd<bang> <args>
command! -bar                                        Messages messages
command! -bar -nargs=+ -complete=file          -bang Source source<bang> <args>

" split windows 
nnoremap <leader>\ :vs<CR>
nnoremap <leader>- :sp<CR>

" center the window 
nnoremap g; g;zz
nnoremap g, g,zz

" Control+s to save files
nmap <c-s> :w<cr>
imap <c-s> <esc>:w<cr>a

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
" Plug 'w0rp/ale' " syntax and semantical error reporter
Plug 'tpope/vim-fugitive'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim' 
Plug 'terryma/vim-smooth-scroll' " creates nice srolling effect
Plug 'scrooloose/nerdtree' " file system explorer 
Plug 'Xuyuanp/nerdtree-git-plugin' " git status display in nerdtree 
Plug 'benmills/vimux' " integrate vim with tmux
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
" let g:ale_set_highlights=1 

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


" NERDTree Git status 


let g:NERDTreeIndicatorMapCustom = {
      \ "Modified"  : "✹",
      \ "Staged"    : "✚",
      \ "Untracked" : "✭",
      \ "Renamed"   : "➜",
      \ "Unmerged"  : "═",
      \ "Deleted"   : "✖",
      \ "Dirty"     : "✗",
      \ "Clean"     : "✔︎",
      \ 'Ignored'   : '☒',
      \ "Unknown"   : "?"
      \}

" prompt for command to run by pressing ,-vp
map <Leader>vp :VimuxPromptCommand<CR> 
" run last command executed by VimuxCommand
map <Leader>vr :VimuxRunLastCommand<CR>
" inspect runner pane
map <Leader>vi :VimuxInspectRunner<CR>

" Tabularize 
" let g:haskell_tabular=1
vmap a= :Tabularize /=<CR>  " align by =
vmap a; :Tabularize /::<CR> " align by ::
vmap a- :Tabularize /-><CR> " align by -> 

" Fzf
nnoremap <silent> <Leader>f :Files<CR>    " ",f" to find files  
nnoremap <silent> <Leader>b :Buffers<CR>  " ",b" to search buffers


