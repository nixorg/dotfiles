set hlsearch
syntax enable
set tabstop=4
set shiftwidth=4
set expandtab
set nu rnu "relative number
set clipboard+=unnamedplus
set ignorecase
set smartcase
set incsearch
set shell=zsh

" Plugins
call plug#begin()
Plug 'cocopon/iceberg.vim'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'

" Plug 'Xuyuanp/nerdtree-git-plugin'
" Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

set background=dark
colorscheme iceberg
set termguicolors

" Keys maping
let mapleader=" "
nnoremap , <C-w>w
nnoremap <C-g> :AgWithPreview<Cr>
nnoremap <C-p> :FilesWithPreview<Cr>
nnoremap <tab> za

" leader maping
nnoremap <Leader>s :split<CR>
nnoremap <Leader>v :vsplit<CR>
nnoremap <Leader>f :Buffers<CR>
nnoremap <Leader>g :BLines<CR>
nnoremap <Leader>p :GFilesWithPreview<CR>
nnoremap <Leader>a :Commands<CR>
nnoremap <Leader>h :Helptags<CR>

nnoremap <Leader>] :source ~/.config/nvim/init.vim <CR>

nnoremap <Leader>o :on<CR>
nnoremap <Leader>' :close<CR>

nnoremap <Leader>m :NERDTreeToggle<CR>

" sync open file with NERDTree
" " Check if NERDTree is open or active
function! IsNERDTreeOpen()        
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

" Call NERDTreeFind iff NERDTree is active, current window contains a modifiable
" file, and we're not in vimdiff
function! SyncTree()
  if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
    NERDTreeFind
    wincmd p
  endif
endfunction

" Highlight currently open buffer in NERDTree
autocmd BufEnter * call SyncTree()

" ctrlp
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" coc config
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-eslint', 
  \ 'coc-prettier', 
  \ 'coc-json', 
  \ ]

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

command! -bang -nargs=? -complete=dir FilesWithPreview
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

command! -bang -nargs=? -complete=dir GFilesWithPreview
    \ call fzf#vim#gitfiles(<q-args>, fzf#vim#with_preview(), <bang>0)

command! -bang -nargs=? -complete=dir AgWithPreview
    \ call fzf#vim#ag(<q-args>, fzf#vim#with_preview(), <bang>0)

autocmd TermOpen * setlocal nonumber norelativenumber

