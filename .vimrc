call plug#begin('~/.vim/plugged')
Plug 'jremmen/vim-ripgrep'
Plug 'leafgarland/typescript-vim'
Plug 'kien/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'Valloric/YouCompleteMe'
Plug 'w0rp/ale'
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

" ALE config
let g:ale_lint_on_save = 1
let g:ale_fix_on_save = 1

" Typescript-vim settings
let g:typescript_indent_disable = 1
au FileType typescript setl sw=2 sts=2 et

" Allow opening of new tabs in Ripgrep
autocmd FileType qf nnoremap <buffer> <C-T> <C-W><Enter><C-W>T

" LEADERS
:let mapleader = " "

" Open Nerdtree
nnoremap <leader>r :NERDTreeFind<CR>

" ERB tags
nnoremap <leader>w i<%  %><Esc>hhha
nnoremap <leader>e i<%=  %><Esc>F=la
