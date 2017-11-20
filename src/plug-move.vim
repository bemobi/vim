"------------------------------------------------------------------------------
" Plug 'matze/vim-move'
"------------------------------------------------------------------------------

let g:move_map_keys = 0

vmap <C-k> <Plug>MoveBlockUp
vmap <C-j> <Plug>MoveBlockDown

nmap mj <Plug>MoveLineDown
nmap mk <Plug>MoveLineUp
