"------------------------------------------------------------------------------
" Plug 'fatih/vim-go', { 'tag': '*' }
"------------------------------------------------------------------------------

let g:go_auto_type_info = 0
let g:go_autodetect_gopath = 1
let g:go_def_mode = "guru"
let g:go_echo_command_info = 1
let g:go_fmt_command = "goimports"
let g:go_fmt_fail_silently = 0
let g:go_gocode_autobuild = 1
let g:go_gocode_unimported_packages = 1
let g:go_highlight_array_whitespace_error = 0
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 0
let g:go_highlight_space_tab_error = 0
let g:go_highlight_trailing_whitespace_error = 0
let g:go_highlight_types = 0
let g:go_info_mode = "gocode"
let g:go_list_type = ""
let g:go_modifytags_transform = 'camelcase'

" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

augroup go
  autocmd!

  autocmd FileType go nmap <silent> <Leader>a <Plug>(go-alternate-edit)
  autocmd FileType go nmap <silent> <Leader>c <Plug>(go-coverage-toggle)
  autocmd FileType go nmap <silent> <Leader>i <Plug>(go-info)
  autocmd FileType go nmap <silent> <Leader>l <Plug>(go-metalinter)
  autocmd FileType go nmap <silent> <Leader>s <Plug>(go-def-split)
  autocmd FileType go nmap <silent> <Leader>v <Plug>(go-def-vertical)
  autocmd FileType go nmap <silent> <Leader>x <Plug>(go-doc-vertical)
  autocmd FileType go nmap <silent> <leader>b :<C-u>call <SID>build_go_files()<CR>
  autocmd FileType go nmap <silent> <leader>e  <Plug>(go-rename)
  autocmd FileType go nmap <silent> <leader>r  <Plug>(go-run)
  autocmd FileType go nmap <silent> <leader>t  <Plug>(go-test)
augroup END
