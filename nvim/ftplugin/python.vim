" Indentation
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

" Run Python code
nmap <leader>r :!python3 % <CR>


" Disable autocompletion (using deoplete instead)
let g:jedi#completions_enabled          = 0
" Go to definition
let g:jedi#goto_command                 = ',d'
" Find ocurrences
let g:jedi#usages_command               = ',o'
" Find assignments
let g:jedi#goto_assignments_command     = ',a'

" Go to definition in new tab
nmap <leader>D :tab split<CR>:call jedi#goto()<CR>

" clear empty spaces at the end of lines on save
autocmd BufWritePre *.py :%s/\s\+$//e
