"------------------------------------------------------------------------------
" Moving around
"------------------------------------------------------------------------------

" Make sure that coursor is always vertically centered on j/k moves
set so=999

" Keep your cursor centered vertically on the screen
augroup VCenterCursor
  au!
  au BufEnter,WinEnter,WinNew,VimResized *,*.*
        \ let &scrolloff=winheight(win_getid())/2
augroup END

" Treat long lines as break lines 
" (useful when moving around in them)
map j gj
map k gk

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" This is totally awesome - remap jj to escape in insert mode. 
" You'll never type jj anyway, so it's great!
inoremap jj <esc>
nnoremap JJJJ <nop>

" Center the line when when moving up and down
noremap <C-d> <C-d>zz
noremap <C-u> <C-u>zz
