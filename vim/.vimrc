if &term == "alacritty"        
  let &term = "xterm-256color"
endif

" ============ "
" ===Basics=== "
" ============ "
syntax on
set noerrorbells 
set belloff=all
set expandtab 
set nu
set nowrap
set smartcase
set noswapfile
set nobackup
set incsearch
set autoindent
set undodir=~/.vim/undodir
set undofile
set background=dark

" Make vertical separator pretty
"highlight VertSplit cterm=NONE
set fillchars+=vert:\▏

" ============= "
" ===Startup=== "
" ============= "
autocmd BufEnter * lcd %:p:h
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescript.tsx
autocmd FileType typescript.tsx :setlocal sw=2 ts=2 sts=2
autocmd FileType html :setlocal sw=2 ts=2 sts=2
autocmd FileType ruby :setlocal sw=2 ts=2 sts=2
autocmd FileType xml :setlocal sw=2 ts=2 sts=2
autocmd VimEnter * source ~/.vimrc
"autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" ============== "
" ===Mappings=== "
" ============== "
let mapleader = " "

" Things I miss from VSCode
noremap <leader>p :Files<CR>
noremap <leader>f :Ag<CR>
noremap <leader>e :NERDTreeToggle<CR>
noremap <leader>b :Buffers<CR>
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>

noremap <leader>c "*yy<cr>
noremap <leader>u :UndotreeShow<CR>
" Source Vim configuration file and install plugins
nnoremap <silent><leader>1 :source ~/.vimrc \| :PlugInstall<CR>
inoremap {<cr> {<cr>}<c-o>O<tab>
inoremap [<cr> [<cr>]<c-o>O<tab>
inoremap (<cr> (<cr>)<c-o>O<tab>

" Show autocomplete when Tab is pressed
inoremap <silent><expr> <Tab> coc#refresh()
" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" ============="
" ===Plugins==="
" ============="
call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-sensible'
Plug 'preservim/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'preservim/nerdcommenter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'mbbill/undotree'
Plug 'w0rp/ale'
Plug 'ayu-theme/ayu-vim'
Plug 'junegunn/fzf.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'pangloss/vim-javascript'    " JavaScript support
Plug 'leafgarland/typescript-vim' " TypeScript syntax
Plug 'maxmellon/vim-jsx-pretty'   " JS and JSX syntaxall
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'neoclide/coc.nvim', {'branch': 'release', 'tag': '*', 'do': { -> coc#util#install()}}
call plug#end()

let g:NERDTreeGitStatusUseNerdFonts = 1 " you should install nerdfonts by yourself. default: 0
let g:NERDTreeGitStatusConcealBrackets = 1 " default: 0
let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0
let g:coc_global_extensions = [ 'coc-tsserver' ]

" Ale
let g:ale_fixers = {}
let g:ale_fixers['javascript'] = ['prettier']
let g:ale_fixers['typescript'] = ['prettier']
let g:ale_fixers['json'] = ['prettier']
let g:ale_fixers['scss'] = ['stylelint', 'prettier']
let g:ale_fix_on_save = 1 " Fix files automatically on save
let g:ale_javascript_prettier_use_local_config = 1
let g:ale_typescript_prettier_use_local_config = 1
let g:ale_linters = {'javascript': ['flow']}
let g:ale_pattern_options = {
      \ '\.min\.js$': {'ale_linters': [], 'ale_fixers': []},
      \ '\.min\.css$': {'ale_linters': [], 'ale_fixers': []},
      \}

let g:ale_sign_error = '•'
let g:ale_sign_warning = '•'



" ============="
" ====Theme===="
" ============="
set termguicolors     " enable true colors support
let ayucolor="mirage" " for mirage version of theme
colorscheme ayu

if exists("g:loaded_webdevicons")
    call webdevicons#refresh()
endif
