"显示行号
set nu
set number

"去掉提示音
set vb
set noeb

"突出当前行
set cursorline
set cul

"启用鼠标
set mouse=a
set selection=exclusive
set selectmode=mouse,key

set tabstop=4
set shiftwidth=4
set autoindent

set paste

set laststatus=2

set ruler

filetype plugin indent on


map sl :set splitright<C>:vsplit<CR>
map sh :set nosplitright<CR>:vsplit<CR>
map sk :set noplitbelow<CR>:split<CR>
map sj :set splitbelow<CR>:split<CR>



map s <nop>
map S :w!<CR>
map Q :q!<CR>



call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'connorholyday/vim-snazzy'
Plug 'Valloric/YouCompleteMe'
Plug 'w0rp/ale'
Plug 'jiangmiao/auto-pairs'
call plug#end()

" autocmd vimEnter * NERDTree
color snazzy
let g:SnazzyTransparent=1


