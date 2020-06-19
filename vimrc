"显示行号
set nu
set number

"显示光标所在的当前行的行号，其他行都为相对于该行的相对行号。
set relativenumber

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

" 映射插入模式下的 大写键为 ESC 键，按ctrl+u，将你刚刚输入的那个单词变成大写。
inoremap UI <esc>

" 插件管理
call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'connorholyday/vim-snazzy'
Plug 'Valloric/YouCompleteMe'
Plug 'w0rp/ale'
Plug 'jiangmiao/auto-pairs'
call plug#end()

autocmd vimEnter * NERDTree
color snazzy
let g:SnazzyTransparent=1


