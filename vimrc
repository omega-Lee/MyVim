"----------Notes: 特殊键位和map类型----------
"<k0>-<k9>       小键盘数字0到9
"<S-x>           大写S配合x，意味着shift+x组合键
"<C-x>           大写C配合x，意味着ctrl+x组合键
"<A-x>           大写A配合x，意味着alt+x组合键
"<ESC>           ESC键
"<BS>            backspace退格键
"<CR>            ENTER回车键
"<Space>         空格键
"<Shift>         shift键
"<Ctrl>          ctrl键
"<Alt>           alt键
"<F1>-<F12>      F1到F12功能键
"<S-...> Shift＋键 *shift* *<S-* 
"<C-...> Control＋键 *control* *ctrl* *<C-* 
"<M-...> Alt＋键 或 meta＋键 *meta* *alt* *<M-* 
"<A-...> 同 <m-...> *<A-* 
"nore前缀： 非递归
"n前缀：    在普通模式下生效
"v前缀：    在可视模式下生效
"i前缀：    在插入模式下生效
"c前缀：    在EX命令模式下生效
"----------Notes End----------

"----------键位配置内容开始----------
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

"启用粘贴
set paste

set laststatus=2

set ruler

filetype plugin indent on

"在vim下分屏
map sl :set splitright<CR>:vsplit<CR>
map sh :set nosplitright<CR>:vsplit<CR>
map sk :set nosplitbelow<CR>:split<CR>
map sj :set splitbelow<CR>:split<CR>

"取消s键 S:保存 Q:退出
map s <nop>
map S :w!<CR>
map Q :q!<CR>

"leader:<space>
let mapleader = "\<space>"
map <leader>s:w!<CR>
map <leader>q:q!<CR>
map <leader>sq:wq!<CR>

" 映射插入模式下的 jj 为 ESC 键
imap jj <ESC>
"----------键位配置内容结束----------

" ----------Plug插件管理开始----------
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
" ----------Plug插件管理结束-------

