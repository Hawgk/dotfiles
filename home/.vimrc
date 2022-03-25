set nocompatible
set number
set ruler
set linebreak
set showbreak=+++
set textwidth=100
set showmatch
set visualbell

filetype plugin on
syntax on
set clipboard=unnamedplus
set mouse=a

map <F1> :NERDTreeToggle<CR>
map <F2> :TagbarToggle<CR>

" Elixir Tagbar Configuration
let g:tagbar_type_elixir = {
    \ 'ctagstype' : 'elixir',
    \ 'kinds' : [
        \ 'f:functions',
        \ 'functions:functions',
        \ 'c:callbacks',
        \ 'd:delegates',
        \ 'e:exceptions',
        \ 'i:implementations',
        \ 'a:macros',
        \ 'o:operators',
        \ 'm:modules',
        \ 'p:protocols',
        \ 'r:records',
        \ 't:tests'
    \ ]
    \ }

let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }
let g:fzf_layout = { 'down': '~40%' }
let g:fzf_history_dir = '~/.local/share/fzf-history'

" Syntastic Configuration
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1

set hlsearch
set smartcase
set ignorecase
set incsearch

set autoindent
set cindent
set shiftwidth=4
set smartindent
set smarttab
set softtabstop=4

set undolevels=1000
set backspace=indent,eol,start

set t_Co=256

set shortmess+=A

let g:airline_powerline_fonts = 1
let g:airline_theme='base16color'

map q :q<cr>
map s :w<cr>
map ss :w !sudo tee %<cr>  
