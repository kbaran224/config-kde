setlocal foldmethod=syntax

" Indentation
set noexpandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4

" Run 'go run' with a shortcut
nmap <leader>r :GoRun <CR>

" Disable :GoDoc running from K - we'll use CoC
let g:go_doc_keywordprg_enabled = 0

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


" Show variable type on airline
let g:go_auto_type_info                 = 1

" Add struct tags
nmap gtj :CocCommand go.tags.add json<cr>
nmap gty :CocCommand go.tags.add yaml<cr>
nmap gtx :CocCommand go.tags.clear<cr>

" Organize code on write 
autocmd BufWritePre *.go :call CocAction('runCommand', 'editor.action.organizeImport')

" Move to next placeholder with Tab
let g:coc_snippet_next = '<tab>'

" Use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

" Finish completion with Enter
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Move through options with Tab and S-Tab
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<C-j>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<C-k>"
