"""""""""""" setting
set cursorline
set tabstop=2
set shiftwidth=4
set autoindent
set list "show space char,like space tab
"set scrolloff=4
"set wrap
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
set number
let g:vimspector_enable_mappings = 'HUMAN'

""""""""""""plugin
call plug#begin('C:\Neovim\share\nvim\plugin')



Plug 'preservim/nerdtree'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
Plug 'flazz/vim-colorschemes'
Plug 'KabbAmine/vCoolor.vim'
Plug 'jaxbot/semantic-highlight.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'Chiel92/vim-autoformat'
Plug 'puremourning/vimspector'


call plug#end()

filetype plugin indent on


""""""""""""key map
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
nmap gd :vs<CR><Plug>(coc-definition)
nmap gi <Plug>(coc-implementation)
nmap gr <Plug>(coc-references)
nmap gt <Plug>(coc-type-definition)
nmap rn <Plug>(coc-rename) 
nmap gl <Plug>(coc-openlink) 
nnoremap ec :vs C:\Neovim\share\nvim\sysinit.vim<CR>
nnoremap rc :source C:\Neovim\share\nvim\sysinit.vim<CR>


""""""""""some function useful
function! s:check_back_space() abort
		let col = col('.') - 1
		return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <expr> <TAB>
		  \ pumvisible() ? "\<C-n>" :
		  \ <SID>check_back_space() ? "\<TAB>" :
		  \ coc#refresh()


function ClosePair(char)
	if getline('.')[col('.') - 1] == a:char
		return "\<Right>"
	else
		return a:char
	endif
endfunction
func SetTitle()
		 call setline(1, "/*************************************************************************") 
		 call append(line("."), "	> File Name: ".expand("%")) 
		 call append(line(".")+1, "	> Author: spectre") 
		 call append(line(".")+2, "	> Mail: zhang192831@gmail.com ") 
		 call append(line(".")+3, "	> Created Time: ".strftime("%c")) 
		 call append(line(".")+4, " ************************************************************************/") 
		 call append(line(".")+5, "")
		 autocmd BufNewFile * normal G
endfunction

"""""""""""" pre run
autocmd BufNewFile *.cpp,*.h,*.[ch],*.sh,*.java,*.py exec ":call SetTitle()"

