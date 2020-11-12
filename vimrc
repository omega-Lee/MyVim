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

"		(nothing) In a function: local to a function; otherwise: global 

"buffer-variable    b:     Local to the current buffer.                          
"window-variable    w:     Local to the current window.                          
"tabpage-variable   t:     Local to the current tab page.                        
"lobal-variable    	g:     Global.                                               
"local-variable     l:     Local to a function.                                  
"script-variable    s:     Local to a :source'ed Vim script.                     
"function-argument  a:     Function argument (only inside a function).           
"vim-variable       v:     Global, predefined by Vim.

"----------Notes End----------

"----------键位配置内容开始----------
"enable folding
set foldmethod=indent
"折叠等级
set foldlevel=99

"enable folding with the spacbar
nnoremap fo za
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

set listchars+=tab:>-
set list
set nolist
"在vim下分屏
map sl :set splitright<CR>:vsplit<CR>
map sh :set nosplitright<CR>:vsplit<CR>
map sk :set nosplitbelow<CR>:split<CR>
map sj :set splitbelow<CR>:split<CR>

map <C-z> <nop>
"取消s键 S:保存 Q:退出
map s <nop>
map S :w!<CR>
map Q :q!<CR>

"在vim里面打开终端
map tm :term<CR>

"在vim里面打开lazygit
map lg :tabe<cr>:-tabmove<cr>:term lazygit<cr>

"leader:<space>
nnoremap <SPACE> <Nop>

let mapleader="\<SPACE>"

map <leader>s :w!<CR>
map <leader>q :q!<CR>
map <leader>sq :wq!<CR>

" 映射插入模式下的 jj 为 ESC 键
inoremap jk <ESC>


"----------键位配置内容结束----------

"----------Plug插件管理开始----------
call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'connorholyday/vim-snazzy'
Plug 'Valloric/YouCompleteMe'
Plug 'w0rp/ale'
Plug 'jiangmiao/auto-pairs'
Plug 'Yggdroot/indentLine'
Plug 'vim-scripts/luainspect.vim'
Plug 'xolox/vim-misc'
Plug 'gcmt/wildfire.vim'
Plug 'tpope/vim-surround'
Plug 'mg979/vim-visual-multi'
call plug#end()
"----------Plug插件管理结束-------

"wildfiel setting begin
"leader+fs:快速选择
nmap <leader>fs <Plug>(wildfire-quick-select)
"map <leader>ss <Plug>(wildfire-fule)
"vmap <leader>f<Plug>(wildfire-water)
let g:wildfie_objects = ["i'", 'i"', "i)", "i]", "i}", "ip", "it","i<","i/*"]
"测试部分( *AAAAAtest code* )
"测试部分( *AAAAAtest code* )
"测试部分( *AAAAAtest code* )
"测试部分( *AAAAAtest code* )
"测试部分( *AAAAA* )
"wildfiel setting end 


"auto-pairs begin
let g:AutoPairs ={'(':')', '[':']', '{':'}',"'":"'",'"':'"', "`":"`", '```':'```', '"""':'"""', "'''":"'''"} 
let g:AutoPairsShortcutToggle = '<leader>p'
"auto-pairs end


"snazzy setting began
color snazzy
let g:SnazzyTransparent=1
"snazzy setting end

"nerdtree setting began
"显示行号
let NERDTreeShowLineNumbers=1
"auto running nerdtree
autocmd vimEnter * NERDTree
"use double leader key to open or close nerdtree 
map <leader><leader> :NERDTreeToggle<CR>
"nerdtree setting end

"f5 自动执行代码
map <F5> :call CompileRunGcc()<CR>

func! CompileRunGcc()
        exec "w"
        if &filetype == 'c'
                exec "!gcc % -o %<"
                exec "!time ./%<"
        elseif &filetype == 'cpp'
                exec "!g++ % -o %<"
                exec "!time ./%<"
        elseif &filetype == 'java'
                exec "!javac %"
                exec "!time java %<"
        elseif &filetype == 'sh'
                :!time bash %
        elseif &filetype == 'python'
                exec "!clear"
                exec "!time python3 %"
        elseif &filetype == 'html'
                exec "!firefox % &"
        elseif &filetype == 'go'
                " exec "!go build %<"
                exec "!time go run %"
        elseif &filetype == 'mkd'
                exec "!~/.vim/markdown.pl % > %.html &"
                exec "!firefox %.html &"
		elseif &filetype == 'lua'
                exec "!lua %"
        endif
endfunc
"f5 自动执行代码

map <F5> :call CompileRunGcc()<CR>
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8
