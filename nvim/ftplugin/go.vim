" Indentation
set noexpandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4

" Fold code depending on syntax
set foldmethod=syntax

" Run 'go run' with a shortcut
nmap <leader>r :GoRun <CR>

" Open docs for text under cursor
nmap K :GoDoc <CR>


" Don't close folds automatically
let g:go_fmt_experimental               = 1

" Highlighting
let g:go_highlight_build_constraints    = 1
let g:go_highlight_extra_types          = 1
let g:go_highlight_fields               = 1
let g:go_highlight_function_calls       = 1
let g:go_highlight_functions            = 1
let g:go_highlight_methods              = 1
let g:go_highlight_operators            = 1
let g:go_highlight_structs              = 1
let g:go_highlight_types                = 1
let g:go_auto_sameids                   = 1

" Automatically add imports on save
let g:go_fmt_command                    = "goimports"

" Linting
" Error and warning signs.
let g:ale_sign_error                    = '⤫'
let g:ale_sign_warning                  = '⚠'
" Enable integration with airline.
let g:airline#extensions#ale#enabled    = 1

" Show variable type on airline
let g:go_auto_type_info                 = 1

" Add JSON tags to structs
let g:go_addtags_transform              = "snakecase"

" Deoplete-go settings
let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'
let g:deoplete#sources#go#sort_class    = ['package', 'func', 'type', 'var', 'const']
