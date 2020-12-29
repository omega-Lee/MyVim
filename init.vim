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
Plug 'mbbill/undotree'
"Theme

"Plug 'vim-config/keymap'

Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'vim-airline/vim-airline-themes'
Plug 'vim-airline/vim-airline' "状态栏
Plug 'w0rp/ale'
Plug 'jiangmiao/auto-pairs'
Plug 'Yggdroot/indentLine'
Plug 'vim-scripts/luainspect.vim'
Plug 'xolox/vim-misc'
Plug 'gcmt/wildfire.vim'
Plug 'tpope/vim-surround'
Plug 'mg979/vim-visual-multi'
Plug 'JamshedVesuna/vim-markdown-preview'
Plug 'suan/vim-instant-markdown'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
if has('nvim')
  Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/defx.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
"Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
call plug#end()

"----------Plug插件管理结束-------

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
	\ 'coc-vimlsp']

set updatetime=100

if has("patch-8.1.1564")
  set signcolumn=number
else
  set signcolumn=yes
endif

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
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-space> coc#refresh()
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

"autopairs
let g:AutoPairsFlyMode = 1
let g:AutoPairsShortcutBackInsert = '<M-b>'
"autopairs

let g:rainbow_active = 1 " 彩虹括号, 0代表关闭

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
let g:airline_theme='bubblegum'
"let g:airline_theme='material'
"-airline_theme set 

"Theme setting 


"wildfiel setting begin

"leader+fs:快速选择
nmap <leader>fs <Plug>(wildfire-quick-select)
"map <leader>ss <Plug>(wildfire-fule)
"vmap <leader>f<Plug>(wildfire-water)
let g:wildfie_objects = ["i'", 'i"', "i)", "i]", "i}", "ip", "it","i<","i/*"]
"wildfiel setting end 

"auto-pairs begin
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

