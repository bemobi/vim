"------------------------------------------------------------------------------
" Plug 'Shougo/deoplete.vim'
"------------------------------------------------------------------------------

 " Disable AutoComplPop.
 let g:acp_enableAtStartup = 0

" Use deoplete.
let g:deoplete#enable_at_startup = 1

" Use smartcase.
let g:deoplete#enable_smart_case = 1

" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> deoplete#close_popup()."\<C-h>"
inoremap <expr><BS>  deoplete#close_popup()."\<C-h>"

" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return pumvisible() ? deoplete#mappings#close_popup() : "\n"
endfunction

" Disable the preview window
set completeopt-=preview

" Auto select
set completeopt+=noinsert
