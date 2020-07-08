" Description {{{
" ===========
" Fisa-nvim-config
" http://nvim.fisadev.com
" version: 10.0
" ============================================================================
" }}}

" Vim-plug initialization {{{
" Avoid modify this section, unless you are very sure of what you are doing

let vim_plug_just_installed = 0
let vim_plug_path = expand('~/.config/nvim/autoload/plug.vim')
if !filereadable(vim_plug_path)
    echo "Installing Vim-plug..."
    echo ""
    silent !mkdir -p ~/.config/nvim/autoload
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    let vim_plug_just_installed = 1
endif

" manually load vim-plug the first time
if vim_plug_just_installed
    :execute 'source '.fnameescape(vim_plug_path)
endif

" ============================================================================
" }}}

" Active plugins {{{

" this needs to be here, so vim-plug knows we are declaring the plugins we
" want to use
call plug#begin('~/.config/nvim/plugged')

"
" ============== Basic plugins ====================
"

" Terminal Vim with 256 colors colorscheme
Plug 'fisadev/fisa-vim-colorscheme'

" Molokai colorscheme 
Plug 'fatih/molokai'

" Base16 colorscheme
Plug 'chriskempson/base16-vim'

" Tmux Vim-like navigation
Plug 'christoomey/vim-tmux-navigator'

" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Better file browser
Plug 'scrooloose/nerdtree'

" Search results counter
Plug 'vim-scripts/IndexedSearch'

" Window chooser
Plug 't9md/vim-choosewin'

" Asynchronously run programs
Plug 'neomake/neomake'

" Relative numbering of lines (0 is the current line)
Plug 'myusuf3/numbers.vim'

" Find differences between directories
Plug 'will133/vim-dirdiff'

"
" ============== Coding plugins ====================
"

" Asynchronous Lint Engine - lint code on the fly
Plug 'dense-analysis/ale'

" Async autocompletion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" Surround
Plug 'tpope/vim-surround'

" Show func/class structure of file
Plug 'majutsushi/tagbar'

" Indent text object
Plug 'michaeljsmith/vim-indent-object'

" Indentation based movements
Plug 'jeetsukumaran/vim-indentwise'

" Better language packs
Plug 'sheerun/vim-polyglot'

" Code commenter
Plug 'scrooloose/nerdcommenter'

" Automatically close parenthesis, etc
Plug 'jiangmiao/auto-pairs'

" Completion from other opened files
Plug 'Shougo/context_filetype.vim'

" Git integration
Plug 'tpope/vim-fugitive'

" Git/mercurial/others diff icons on the side of the file lines
Plug 'mhinz/vim-signify'

" Yank history navigation
Plug 'vim-scripts/YankRing.vim'

"
" ============== Python plugins ====================
"

" Python autocompletion
Plug 'zchee/deoplete-jedi', { 'do': ':UpdateRemotePlugins' }

" Python go-to-definition and similar features
Plug 'davidhalter/jedi-vim'

" Python syntax colors
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}

" Automatically sort python imports
Plug 'fisadev/vim-isort'

" Python folding
Plug 'tmhedberg/SimpylFold'

"
" ============== Go plugins ====================
"

" Main
Plug 'fatih/vim-go'
Plug 'stamblerre/gocode'

" Go snippets
Plug 'SirVer/ultisnips'

" Deoplete for Go
Plug 'deoplete-plugins/deoplete-go', { 'do': 'make'}

"
" ============== HTML/CSS plugins ====================
"

" Highlight matching html tags
Plug 'valloric/MatchTagAlways'

" Generate html in a simple way
Plug 'mattn/emmet-vim'

" Paint css colors with the real color
Plug 'lilydjwg/colorizer'

" Tell vim-plug we finished declaring plugins, so it can load them
call plug#end()

" ============================================================================
" }}}

" Install Plugin Initialization {{{

if vim_plug_just_installed
    echo "Installing Bundles, please ignore key map error messages"
    :PlugInstall
endif

" ============================================================================
" }}}

" Plugins settings and mappings {{{

" Tagbar -----------------------------

" toggle tagbar display
map <F4> :TagbarToggle<CR>
" autofocus on tagbar open
let g:tagbar_autofocus = 1

" NERDTree -----------------------------

" toggle nerdtree display
map <F3> :NERDTreeToggle<CR>
" open nerdtree with the current file selected
nmap ,t :NERDTreeFind<CR>
" don;t show these file types
let NERDTreeIgnore = ['\.pyc$', '\.pyo$']

" Neomake ------------------------------

" Run linter on write
autocmd! BufWritePost * Neomake


" Deoplete -----------------------------

" Use deoplete.
let g:deoplete#enable_at_startup            = 1
let g:deoplete#enable_ignore_case           = 1

" complete with words from any opened file
let g:context_filetype#same_filetypes       = {}
let g:context_filetype#same_filetypes._     = '_'

" needed so deoplete can auto select the first suggestion
set completeopt+=noinsert
" comment this line to enable autocompletion doc in preview window
"set completeopt-=preview

" Window Chooser ------------------------------

" mapping
nmap  -  <Plug>(choosewin)
" show big letters
let g:choosewin_overlay_enable = 1


" Signify ------------------------------

" this first setting decides in which order try to guess your current vcs
" UPDATE it to reflect your preferences, it will speed up opening files
let g:signify_vcs_list = [ 'git', 'hg' ]
" mappings to jump to changed blocks
nmap ,sn <plug>(signify-next-hunk)
nmap ,sp <plug>(signify-prev-hunk)

" Autoclose ------------------------------

" Fix to let ESC work as espected with Autoclose plugin
" (without this, when showing an autocompletion window, ESC won't leave insert
"  mode)
let g:AutoClosePumvisible = {"ENTER": "\<C-Y>", "ESC": "\<ESC>"}

" Yankring -------------------------------

" Fix for yankring and neovim problem when system has non-text things copied
" in clipboard
let g:yankring_clipboard_monitor = 0
let g:yankring_history_dir = '~/.config/nvim/'
set clipboard+=unnamed,unnamedplus

" Airline ------------------------------

let g:airline_powerline_fonts = 1
let g:airline_theme = 'wombat'
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#tabline#enabled = 1

" to use fancy symbols for airline, uncomment the following lines and use a
" patched font (more info on docs/fancy_symbols.rst)
if !exists('g:airline_symbols')
   let g:airline_symbols = {}
endif
let g:airline_left_sep = '⮀'
let g:airline_left_alt_sep = '⮁'
let g:airline_right_sep = '⮂'
let g:airline_right_alt_sep = '⮃'
let g:airline_symbols.branch = '⭠'
let g:airline_symbols.readonly = '⭤'
let g:airline_symbols.linenr = '⭡'

" }}}

" Vim settings and mappings {{{

" Mapping for <leader>
let mapleader = ","

" Paste and yank to + buffer
map <Leader>p "+p
map <Leader>y "+y

" Quick exit
nmap <leader>e :exit <CR>
" Quick write and exit
nmap <leader>w :wg <CR>
" Quick write with sudo
nmap <leader>W :execute ':silent w !sudo tee % > /dev/null' | :edit!
" save as sudo
ca w!! w !sudo tee "%"

" tabs and spaces handling
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

" show line numbers
set nu

" remove ugly vertical lines on window division
set fillchars+=vert:\ 

" Access colors present in 256 colorspace
let base16colorspace=256  

" colorscheme
let g:rehash256 = 1
let g:molokai_original = 1
colorscheme molokai

" autocompletion of files and commands behaves like shell
" (complete only the common part, list the options that match)
set wildmode=list:longest

" tab navigation mappings
nnoremap th  :tabfirst<CR>
nnoremap tk  :tabnext<CR>
nnoremap tj  :tabprev<CR>
nnoremap tl  :tablast<CR>
nnoremap tt  :tabedit<Space>
nnoremap tn  :tabnext<Space>
nnoremap tm  :tabm<Space>
nnoremap td  :tabclose<CR>

" when scrolling, keep cursor 3 lines away from screen border
set scrolloff=3

" clear search results
nnoremap <silent> // :noh<CR>


" fix problems with uncommon shells (fish, xonsh) and plugins running commands
" (neomake, ...)
set shell=/bin/bash 

" Move naturally between splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Set foldmethod
set foldmethod=marker

" Remember folds throughout opening files
augroup remember_folds
  autocmd!
  autocmd BufWinLeave * mkview
  autocmd BufWinEnter * silent! loadview
augroup END

" Fold with spacebar in normal mode
nnoremap <space> za

" better backup, swap and undos storage -----

" directory to place swap files in
set directory=~/.config/nvim/dirs/tmp
" make backup files
set backup       
" where to put backup files
set backupdir=~/.config/nvim/dirs/backups
" persistent undos - undo after you re-open the file
set undofile                      
set undodir=~/.config/nvim/dirs/undos
set viminfo+=n~/.config/nvim/dirs/viminfo

" create needed directories if they don't exist
if !isdirectory(&backupdir)
    call mkdir(&backupdir, "p")
endif
if !isdirectory(&directory)
    call mkdir(&directory, "p")
endif
if !isdirectory(&undodir)
    call mkdir(&undodir, "p")
endif

" don't use swapfile
set noswapfile
" ============================================================================
" }}}

" Highlights - colors customization {{{
highlight DiffAdd           cterm=bold ctermbg=none ctermfg=119
highlight DiffDelete        cterm=bold ctermbg=none ctermfg=167
highlight DiffChange        cterm=bold ctermbg=none ctermfg=227
highlight SpellBad          cterm=underline ctermbg=none ctermfg=167
highlight SpellCap          cterm=underline ctermbg=none ctermfg=167
highlight Error             cterm=bold ctermbg=none ctermfg=167
highlight CursorColumn      ctermbg=none
highlight SignifySignAdd    cterm=bold ctermbg=none  ctermfg=119
highlight SignifySignDelete cterm=bold ctermbg=none  ctermfg=167
highlight SignifySignChange cterm=bold ctermbg=none  ctermfg=227
highlight ErrorMsg          cterm=bold ctermbg=none ctermfg=167
highlight MatchParen        cterm=bold ctermbg=none ctermfg=202
highlight SpellLocal        cterm=none ctermbg=none ctermfg=227
highlight Search            cterm=bold ctermbg=none ctermfg=119
highlight Visual            cterm=reverse ctermbg=none
highlight SignColumn        ctermbg=none
highlight Folded            ctermbg=none ctermfg=blue
highlight Pmenu             ctermbg=8 ctermfg=7
highlight PmenuSel          cterm=bold ctermbg=7 ctermfg=8
highlight VertSplit         cterm=none ctermbg=none ctermfg=none
"}}}

