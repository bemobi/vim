"------------------------------------------------------------------------------
" Plug 'scrooloose/nerdtree'
"------------------------------------------------------------------------------

" General properties
let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__']
let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'
let g:NERDTreeShowBookmarks=1
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeWinSize = 31
let g:nerdtree_tabs_focus_on_files=1

" Open NERDTree on startup, when no file has been specified
autocmd VimEnter * if !argc() | NERDTree | endif

" F2 toogles TabBar
nmap <F2> :NERDTreeToggle<CR>

" LF finds the current file in the tree
nmap LF :NERDTreeFind<CR>
