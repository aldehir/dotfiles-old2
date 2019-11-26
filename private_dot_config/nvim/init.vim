set nocompatible
filetype off

call plug#begin('~/.local/share/nvim/plugged')
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'mattn/emmet-vim'
Plug 'christoomey/vim-tmux-navigator'
"Plug 'airblade/vim-gitgutter'
Plug 'majutsushi/tagbar'
Plug 'elixir-lang/vim-elixir'
Plug 'ledger/vim-ledger'
Plug 'godlygeek/tabular'
Plug 'sheerun/vim-polyglot'
Plug 'dracula/vim'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf.vim'
Plug 'francoiscabrol/ranger.vim'
Plug 'rbgrouleff/bclose.vim'
call plug#end()

filetype plugin indent on

" Custom fzf installation
set rtp+=~/.fzf

" Increase history
set history=700

" Set map leader
let mapleader = ","
let g:mapleader = ","

" Configure backspace so it acts normally
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Use buffers
set hidden

" Relative numbering
set relativenumber

" Use ruler
set ruler

" Indentation
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2

"set smarttab

" Linebreak on 500 characters
"set lbr
"set tw=500
set tw=79
set cc=+1

set noci " Disable C indent
set ai " Auto indent
set si " Smart indent
"set wrap " Wrap lines
set nowrap

" Settings for specific file types
autocmd FileType ruby,javascript setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
autocmd FileType java,python setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab
autocmd FileType javscript,typescript,json setlocal tw=120

" Set some filetypes for rails
autocmd BufNewFile,BufRead *.handlebars,*.html.erb setlocal filetype=html

" ino files are C
autocmd BufNewFile,BufRead *.ino setlocal filetype=c

" Set 3 lines to the cursor when moving using j/k
set so=3

" Wild menu
set wildmenu
set wildmode=list:longest

" Ignore compiled files
set wildignore=*.o,*~,*.pyc,node_modules/

" Search settings
set ignorecase
set smartcase
set hlsearch
set incsearch

" Magic!?
set magic

" Show matching brackets
set showmatch

" Remove annoying sounds
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Enable syntax highlighting
syntax on

if has("termguicolors")
  set termguicolors
endif

" Theme
set background=dark
colorscheme dracula


" Default to UTF8 encoding
set encoding=utf8

" Use Unix as the default file type
set ffs=unix,dos,mac

" Turn backups and swapfiles off, version control exists for that
set nobackup
set nowritebackup
set nowb
set noswapfile

" Some quality-of-life settings
set cmdheight=2
set updatetime=300
set shortmess+=c

if has('signcolumn')
  set signcolumn=yes
endif

" Disable highlighting with <leader>n
nmap <silent> <leader>n :nohlsearch<cr>

" Show whitespace with ,s
nmap <silent> <leader>s :set list!<cr>

set splitbelow
set splitright

" Change whitespace characters
set listchars=tab:>.,trail:.,extends:#,nbsp:.,eol:$

" Increase size of status bar
set laststatus=2

" Airline Settings
let g:airline_theme = 'dracula'
let g:airline_powerline_fonts = 1

" Use Ctrl-P for FZF
nnoremap <C-p> :Files<CR>
inoremap <C-p> <ESC>:Files<CR>

" coc.nvim settings
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)
nmap <silent> <leader>gd <Plug>(coc-definition)
nmap <silent> <leader>gtd <Plug>(coc-type-definition)
nmap <silent> <leader>gi <Plug>(coc-implentation)
nmap <silent> <leader>gr <Plug>(coc-references)

nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim', 'help'], &filetype) >= 0)
    execute 'h ' . expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

autocmd CursorHold * silent call CocActionAsync('highlight')

nmap <leader>rn <Plug>(coc-rename)

xmap <leader>rf <Plug>(coc-format-selected)
nmap <leader>rf <Plug>(coc-format-selected)
