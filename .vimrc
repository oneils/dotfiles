" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tomasiser/vim-code-dark'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes' " other themes https://github.com/vim-airline/vim-airline/wiki/Screenshots
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-fugitive' " Plugin page: https://github.com/tpope/vim-fugitive
Plug 'airblade/vim-gitgutter'
Plug 'kien/ctrlp.vim'
Plug 'easymotion/vim-easymotion'
Plug 'junegunn/fzf.vim'

Plug 'sbdchd/neoformat'
Plug 'vim-scripts/Arduino-syntax-file'
Plug 'vim-syntastic/syntastic'
Plug 'shime/vim-livedown'
Plug 'vim-airline/vim-airline'
Plug 'stephpy/vim-yaml'
Plug 'morhetz/gruvbox'
call plug#end()

" END  OF vim-plug configuration

syntax on
let g:mapleader=','
colorscheme gruvbox
let g:gruvbox__contrast = 'hard'
" colorscheme codedark " https://github.com/tomasiser/vim-code-dark#installation

set number
set cursorline

set expandtab  "Always uses spaces instead of tabs

set softtabstop=4 "Insert 4 spaces when tab is pressed
set shiftwidth=4 "An indent is 4 spaces

set hlsearch
set incsearch

" Key mappings

map <C-n> :NERDTreeToggle<CR>
map <Leader> <Plug>(easymotion-prefix)

" Mepping for working with windows
map <silent> <C-h> :call WinMove('h')<CR>
map <silent> <C-j> :call WinMove('j')<CR>
map <silent> <C-k> :call WinMove('k')<CR>
map <silent> <C-k> :call WinMove('k')<CR>


function! WinMove(key)
    let t:curwin = winnr()
    exec "wincmd ".a:key
    if(t:curwin == winnr())
        if (match(a:key, '[jk]'))
          wincmd v
        else
          wincmd s
        endif
        exec "wincmd ".a:key
    endif
endfunction

