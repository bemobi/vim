"------------------------------------------------------------------------------
" Plug 'scrooloose/syntastic'
"------------------------------------------------------------------------------

let g:syntastic_aggregate_errors = 1
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_jump=0
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_signs=1
let g:syntastic_error_symbol='✗'
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }
let g:syntastic_python_checkers=['flake8']
let g:syntastic_python_flake8_post_args='--ignore=E501,E128,E225'
let g:syntastic_stl_format = '[%E{Err: %fe #%e}%B{, }%W{Warn: %fw #%w}]'
let g:syntastic_style_error_symbol = '✗'
let g:syntastic_style_warning_symbol = '⚠'
let g:syntastic_warning_symbol='⚠'

let g:syntastic_javascript_checkers = ['eslint']

let g:syntastic_html_tidy_ignore_errors = ["proprietary attribute \"ng-"]
let g:syntastic_html_tidy_ignore_errors += ["trimming empty "]
let g:syntastic_html_tidy_ignore_errors += [
      \ "<ng-",
      \ "discarding unexpected </ng-",
      \ "<am-",
      \ "discarding unexpected </am-"]
let g:syntastic_html_tidy_ignore_errors += [
      \ "<svg",
      \ "discarding unexpected /svg>",
      \ "<defs",
      \ "discarding unexpected /defs>",
      \ "<path",
      \ "discarding unexpected /path>",
      \ "<polygon",
      \ "discarding unexpected /polygon>",
      \ "<g",
      \ "discarding unexpected /g>",
      \ "<text",
      \ "discarding unexpected /text>"]
let g:syntastic_quiet_messages = {'level': 'warnings'}
