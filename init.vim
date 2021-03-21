"vim script test


"vim script test


"----------键位配置内容开始----------
"渐进式搜索
set incsearch
"高亮
"set hlsearch
"关闭高亮
map nl :set nohlsearch<CR>
" 开启大小写不敏感（默认值）
set ignorecase
" 开启智能推测
set smartcase

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
map <C-f> :/

nnoremap <SPACE> <Nop>

let mapleader="\<SPACE>"

map <leader>s :w!<CR>
map <leader>q :q!<CR>
map <leader>sq :wq!<CR>

" 映射插入模式下的 jj 为 ESC 键
inoremap jk <ESC>

map PI :PlugInstall<CR>
map <c-5>:source init.vim<CR>
map CI 	:CocInstall 
map tt	:CocCommand explorer<CR>
"----------键位配置内容结束----------

"----------Plug插件管理开始----------
call plug#begin('~/.vim/plugged')

"Theme
Plug 'kaicataldo/material.vim', { 'branch': 'main' }
Plug 'hzchirs/vim-material'
Plug 'jacoborus/tender.vim'
Plug 'connorholyday/vim-snazzy'
Plug 'dunstontc/vim-vscode-theme'
Plug 'blueshirts/darcula'
Plug 'dracula/vim'
Plug 'junegunn/seoul256.vim'
Plug 'karoliskoncevicius/sacredforest-vim'
Plug 'arcticicestudio/nord-vim'
Plug 'rakr/vim-one'
Plug 'hzchirs/vim-material'
"Theme

Plug 'skywind3000/vim-auto-popmenu' "代码补全
Plug 'skywind3000/vim-dict' "字典
Plug 'Raimondi/delimitMate'

Plug 'junegunn/vim-easy-align'   " 代码格式化

"Plug 'ryanoasis/vim-devicons' "图标 需要powerline字体
"set encoding=UTF-8

Plug 'RRethy/vim-hexokinase', { 'do': 'make hexokinase' }  "异步显示文件颜色代码
Plug 'RRethy/vim-illuminate'
let g:Hexokinase_highlighters = ['virtual']
let g:Illuminate_delay = 150
hi illuminatedWord cterm=undercurl gui=undercurl

Plug 'mbbill/undotree' "撤销树
Plug 'preservim/nerdtree' "目录树
Plug 'scrooloose/nerdcommenter' "快速注释
Plug 'mhinz/vim-signify' "git修改提醒
Plug 'Xuyuanp/nerdtree-git-plugin' "目录树
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'vim-airline/vim-airline-themes'
Plug 'vim-airline/vim-airline' "状态栏
Plug 'w0rp/ale'	"语法检查
Plug 'jiangmiao/auto-pairs' "括号补全
Plug 'Yggdroot/indentLine' "缩进线
Plug 'vim-scripts/luainspect.vim'	"lua插件
Plug 'xolox/vim-misc' "lua插件
Plug 'gcmt/wildfire.vim'
Plug 'tpope/vim-surround'
Plug 'mg979/vim-visual-multi'
Plug 'luochen1990/rainbow'
Plug 'JamshedVesuna/vim-markdown-preview' "markdown 可视化插件
Plug 'suan/vim-instant-markdown' "markdown 可视化插件
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } "vim fzf 插件
Plug 'junegunn/fzf.vim' "vim fzf 插件

"vim-auto-popmenu
" 设定需要生效的文件类型，如果是 "*" 的话，代表所有类型
"let g:apc_enable_ft = {'*':1}
let g:apc_enable_ft = {'c':1,'cpp':1,'go':1,'py':1}
" 设定从字典文件以及当前打开的文件里收集补全单词，详情看 ':help cpt'
set cpt=.,k,w,b
" 不要自动选中第一个选项。
set completeopt=menu,menuone,noselect
" 禁止在下方显示一些啰嗦的提示
set shortmess+=c


if has('nvim')
else

endif

"Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
call plug#end()

"----------Plug插件管理结束-------

"indentLine
let g:indentLine_char='|'
let g:indentLine_enabled = 1

"vim-signify
set updatetime=100

"vim surround use
"1．ds-删除字串的包裹符号"aaa"---ds"---aaa
"2．cs-替换字串的包裹符号"aaa"---cs"]---[aaa]
"3．ys-添加字串的包裹符号aaa---ysw]---[aaa]
"4.我们可以选中一个字串，然后使用Ｓ＋符号的方法来添加包裹符号
"hello
"vim surround use 

"ale setting begin
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}\ %{ALEGetStatusLine()}
"始终开启标志列
let g:ale_sign_column_always = 1
let g:ale_set_highlights = 0
"自定义error和warning图标
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚡'
"在vim自带的状态栏中整合ale
let g:ale_statusline_format = ['✗ %d', '⚡ %d', '✔ OK']
"显示Linter名称,出错或警告等相关信息
let g:ale_echo_msg_error_str = '✗' 
let g:ale_echo_msg_warning_str = '⚡'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
"普通模式下，sp前往上一个错误或警告，sn前往下一个错误或警告
nmap sp <Plug>(ale_previous_wrap)
nmap sn <Plug>(ale_next_wrap)
""<Leader>s触发/关闭语法检查
"nmap <Leader>s :ALEToggle<CR>
""<Leader>d查看错误或警告的详细信息
"nmap <Leader>d :ALEDetail<CR>
"ale setting end 

let g:NERDTreeGitStatusIndicatorMapCustom = {
			\ 'Modified'  :'M',
			\ 'Staged'    :'✚',
			\ 'Untracked' :'✭',
			\ 'Renamed'   :'➜',
			\ 'Unmerged'  :'═',
			\ 'Deleted'   :'✖',
			\ 'Dirty'     :'✗',
			\ 'Ignored'   :'☒',
			\ 'Clean'     :'✔︎',
			\ 'Unknown'   :'?',
			\ }

if has('nvim')
"coc config  
let g:coc_global_extensions = [
			\ 'coc-actions',
			\ 'coc-diagnostic',
			\ 'coc-explorer',
			\ 'coc-gitignore',
			\ 'coc-json',
			\ 'coc-lists',
			\ 'coc-prettier',
			\ 'coc-python',
			\ 'coc-snippets',
			\ 'coc-sourcekit',
			\ 'coc-syntax',
			\ 'coc-tasks',
			\ 'coc-todolist',
			\ 'coc-tslint-plugin',
			\ 'coc-tsserver',
			\ 'coc-vimlsp',
			\ 'coc-pairs']

set updatetime=100

set signcolumn=yes

set shortmess+=c

inoremap <silent><expr> <TAB>
			\ pumvisible() ? "\<C-n>" :
			\ <SID>check_back_space() ? "\<TAB>" :
			\ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction

if has('nvim')
	inoremap <silent><expr> <c-o> coc#refresh()
else
	inoremap <silent><expr> <c-o> coc#refresh()
endif

nmap <silent> <c--> <Plug>(coc-diagnostic-prev)
nmap <silent> <c-+> <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

"coc config


"rainbow
let g:rainbow_active = 1

let g:rainbow_conf = {
\   'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
\   'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
\   'operators': '_,_',
\   'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
\   'separately': {
\       '*': {},
\       'tex': {
\           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
\       },
\       'lisp': {
\           'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
\       },
\       'vim': {
\           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
\       },
\       'html': {
\           'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
\       },
\       'css': 0,
\   }
\}

endif
"Theme setting 
syntax enable

"-material
if (has('nvim'))
	let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
endif

if (has('termguicolors'))
	set termguicolors
endif
"let g:material_theme_style = 'default'
"let g:material_theme_style = 'darker-community'
"let g:material_theme_style = 'palenight'
"let g:material_theme_style = 'ocean'
let g:material_theme_style = 'darker'
"let g:material_theme_style = 'palenight-community'
"let g:material_theme_style = 'ocean-community'

let g:material_terminal_italics = 1

colorscheme material
"-material

"-one
"if (empty($TMUX))
"	if (has("nvim"))
"  		let $NVIM_TUI_ENABLE_TRUE_COLOR=1
"	endif
"  
"	if (has("termguicolors"))
"    	set termguicolors
"	endif
"endif
"
"set background=dark 
"colorscheme one
"-one

"colorscheme nord

"-vim-material
"set background=dark
"
"let g:material_style='palenight'
"set background=dark
"
"let g:material_style='oceanic'
"set background=dark
"
"colorscheme vim-material
"-vim-material

"colorscheme sacredforest
"set termguicolors

"color seoul256
"set background=dark

"if (has("termguicolors"))
" set termguicolors
"endif
"colorscheme tender

"color snazzy
"let g:SnazzyTransparent=1
"colorscheme snazzy

"-airline_theme set 
"let g:airline_theme='one'
let g:airline_theme='material'
"-airline_theme set 

"Theme setting 


"wildfiel setting begin

"leader+fs:快速选择
nmap <leader>fs <Plug>(wildfire-quick-select)
"map <leader>ss <Plug>(wildfire-fule)
"vmap <leader>f<Plug>(wildfire-water)
let g:wildfie_objects = ["i'", 'i"', "i)", "i]", "i}", "ip", "it","i>","i/*"]
"wildfiel setting end 

set tabstop=4

inoremap " ""<ESC>i    

inoremap ( ()<ESC>i

inoremap { {<CR>}<ESC>O<TAB>




"auto-pairs begin

let g:AutoPairsFlyMode = 1
let g:AutoPairsShortcutBackInsert = '<c-b>'

let g:AutoPairs ={'(':')', '[':']', '{':'}',"'":"'",'"':'"', "`":"`", '```':'```', '"""':'"""', "'''":"'''"} 
let g:AutoPairsShortcutToggle = '<leader>p'

"auto-pairs end


"nerdtree setting began
"显示行号
let NERDTreeShowLineNumbers=1
"auto running nerdtree
"autocmd vimEnter * NERDTree
"use double leader key to open or close nerdtree 
map <leader><leader> :NERDTreeToggle<CR>
"nerdtree setting end

"undotree setting
map <leader>ud :UndotreeToggle<CR>
"undotree setting
"undotree test
"this is a undotree test 
"this is a undotree test 
"this is a undotree test 
"undotree test

"f5 自动执行代码
map <F5> :call CompileRunGcc()<CR>
map CI :CocInstall
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

