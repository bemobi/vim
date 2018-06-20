"------------------------------------------------------------------------------
" Plug 'w0rp/ale'
"------------------------------------------------------------------------------

let g:ale_sign_error = '❗' " Less aggressive than the default '>>'
let g:ale_sign_warning = '⚠️'
let g:ale_lint_on_enter = 0 " Less distracting when opening a new file

let g:ale_fixers = {
    \   'javascript': ['prettier', 'eslint'],
    \   'javascript.jsx': ['prettier', 'eslint'],
    \}

let g:ale_fix_on_save = 1
let g:ale_completion_enabled = 1
let g:ale_sign_column_always = 1
let g:airline#extensions#ale#enabled = 1
let g:ale_javascript_eslint_suppress_missing_config = 1

let g:ale_javascript_prettier_options = '--parser=babylon --print-width=120 --tab-width=2 --no-semi --use-tabs'
let g:ale_javascript_prettier_use_local_config = 1
