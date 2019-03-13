call plug#begin('~/.vim/plugged')
Plug 'jremmen/vim-ripgrep'
Plug 'leafgarland/typescript-vim'
Plug 'kien/ctrlp.vim'
call plug#end()

" Add fuzzy find to runtime path
set runtimepath^=~/.vim/plugged/ctrlp.vim
 
" Ignore files and folders in Ctrl+P
:set wildignore+=*/tmp/*,*/node_modules/*,*.so,*.swp,*.zip

" Use ripgrep for CtrlP fuzzy fine
if executable('rg')
  set grepprg=rg\ --color=never
  let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
  let g:ctrlp_use_caching = 0
endif

" Add numbers to left on startup
set number

" Make tree look nicer
let g:netrw_banner = 0
let g:netrw_liststyle = 3

" Typescript-vim settings
let g:typescript_indent_disable = 1
au FileType typescript setl sw=2 sts=2 et

" Allow opening of new tabs in Ripgrep
autocmd FileType qf nnoremap <buffer> <C-T> <C-W><Enter><C-W>T

" Leaders
:let mapleader = " "
:nnoremap <leader>r :Vex 25<CR> " Open tree

" ERB tags
nnoremap <leader>w i<%  %><Esc>hhha
nnoremap <leader>e i<%=  %><Esc>F=la
