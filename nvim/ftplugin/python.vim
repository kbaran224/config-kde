" Run Python code
nmap <leader>r :!python3 % <CR>

" Check code as python3
let g:neomake_python_python_maker       = neomake#makers#ft#python#python()
let g:neomake_python_flake8_maker       = neomake#makers#ft#python#flake8()
let g:neomake_python_python_maker.exe   = 'python3 -m py_compile'
let g:neomake_python_flake8_maker.exe   = 'python3 -m flake8'


" Jedi-vim

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
