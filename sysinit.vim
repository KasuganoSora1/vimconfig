set number
set cursorline
set tabstop=2
set shiftwidth=4
set autoindent
"set list 将空字符以特殊形式显示出来
"set scrolloff=4 光标默认位置
"set wrap 自动折行
set foldmethod=indent
set foldlevel=99
set foldenable
set splitright
set splitbelow
set showcmd
set wildmenu
set ignorecase
set nocompatible
set foldenable
set foldmethod=indent
"let g:python3_host_prog=/path/to/python/executable/
let g:vimspector_enable_mappings = 'HUMAN'
filetype off



call plug#begin('D:\\soft\\Neovim\\share\\nvim\\plugin')
Plug 'preservim/nerdtree'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
Plug 'flazz/vim-colorschemes'
Plug 'KabbAmine/vCoolor.vim'
Plug 'jaxbot/semantic-highlight.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'Chiel92/vim-autoformat'
Plug 'puremourning/vimspector'
"Plug 'skywind3000/vim-quickui'
call plug#end()



autocmd FileType cpp :SemanticHighlight
autocmd FileType md :SemanticHighlight
autocmd FileType h :SemanticHighlight
autocmd FileType cs :SemanticHighlight
autocmd FileType py :SemanticHighlight

inoremap ( ()<ESC>i
inoremap ) <c-r>=ClosePair(')')<CR>
inoremap { {<CR>}<ESC>O
inoremap } <c-r>=ClosePair('}')<CR>
inoremap [ []<ESC>i
inoremap ] <c-r>=ClosePair(']')<CR>
inoremap " ""<ESC>i
inoremap ' ''<ESC>i
nnoremap <F2> :NERDTree<CR>
nnoremap <LEFT> :vertical res -5<CR>
nnoremap <RIGHT> :vertical res +5<CR>
nnoremap <UP> :res +5<CR>
nnoremap <DOWN> :res -5<CR>
nmap gd <Plug>(coc-definition)


function ClosePair(char)
	if getline('.')[col('.') - 1] == a:char
		return "\<Right>"
	else
		return a:char
	endif
endfunction

filetype plugin indent on 
