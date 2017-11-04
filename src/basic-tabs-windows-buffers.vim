"------------------------------------------------------------------------------
" Tabs, windows and buffers
"------------------------------------------------------------------------------

" Specify the behavior when switching between buffers
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

" wrap long lines in quickfix
augroup quickfix
    autocmd!
    autocmd FileType qf setlocal wrap
augroup END

" Remove 'set hidden'
set nohidden
