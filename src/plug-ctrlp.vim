"------------------------------------------------------------------------------
" Plug 'ctrlpvim/ctrlp.vim'
"------------------------------------------------------------------------------

let g:ctrlp_buftag_types = {'go' : '--language-force=go --golang-types=ftv'}
let g:ctrlp_cache_dir = $HOME.'/.cache/ctrlp'
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_cmd = 'CtrlPMRU'
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn|tox)$'
let g:ctrlp_match_window = 'bottom,order:btt,max:10,results:10'
let g:ctrlp_max_files=0     " do not limit the number of searchable files
let g:ctrlp_mruf_max=450    " number of recently opened files
let g:ctrlp_switch_buffer = 'et'  " jump to a file if it's open already
let g:ctrlp_use_caching = 1
let g:ctrlp_user_command = "find %s -type f | grep -Ev '"+ g:ctrlp_custom_ignore +"'"
let g:ctrlp_working_path_mode = 'ra'
