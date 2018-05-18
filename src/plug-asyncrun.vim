"------------------------------------------------------------------------------
" Plug 'skywind3000/asyncrun.vim'
"------------------------------------------------------------------------------
let g:airline#extensions#ale#enabled = 1

" F4 open quickfix window
nmap <F4> :copen 10<CR>

autocmd BufWritePost *.js AsyncRun -post=checktime eslint --fix %

