call plug#begin('~/.vim/plugged')
Plug 'jremmen/vim-ripgrep'
Plug 'kien/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'sheerun/vim-polyglot'
Plug 'w0rp/ale'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround' " Quoting/parenthesizing
Plug 'tpope/vim-commentary' " Comment out things
Plug 'mattn/emmet-vim'
Plug 'editorconfig/editorconfig-vim' " Read and adhere to .editorconf files
function FixupBase16(info)
    !sed -i '/Base16hi/\! s/a:\(attr\|guisp\)/l:\1/g' ~/.vim/plugged/base16-vim/colors/*.vim
endfunction
Plug 'chriskempson/base16-vim', { 'do': function('FixupBase16') }
call plug#end()

" Add fuzzy find to runtime path
set runtimepath^=~/.vim/plugged/ctrlp.vim

" Ignore files and folders in Ctrl+P
set wildignore+=*/tmp/*,*/node_modules/*,*.so,*.swp,*.zip

" Set diff vertical
set diffopt+=vertical

" Set default fold levels
" set foldmethod=indent
" set foldlevel=1

" Change default formatting options
au BufEnter * set fo=tq " don't start new line with comment when pressing 'o'

" vim-jsx-pretty settings
let g:polyglot_disabled = ['jsx', 'tsx']

" Only use HTML/CSS for Emmet
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

" Use ripgrep for CtrlP fuzzy fine
if executable('rg')
  set grepprg=rg\ --color=never
  let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
  let g:ctrlp_use_caching = 0
endif

" Base16 colors
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

set number " Add numbers to left on startup
set incsearch " Find in file as you type
set bs=2 " allow backspace
set tabstop=2 shiftwidth=2 expandtab " make tabs two spaces

" ALE config
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_save = 1
let g:ale_fix_on_save = 1
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['eslint', 'prettier'],
\   'typescript': ['tslint', 'prettier'],
\   'ruby': ['prettier'],
\}

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

" console.log
nnoremap <leader>c iconsole.log()<Esc>ha

" COCKVIM STUFF BELOW
" if hidden is not set, TextEdit might fail.
set hidden

" Some server have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> for trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> for confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[c` and `]c` for navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K for show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Disable bleep noises everwhere
set visualbell t_vb=
if has("autocmd") && has("gui")
    au GUIEnter * set t_vb=
endif
