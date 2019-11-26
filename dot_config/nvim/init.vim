set nocompatible
filetype off

let s:plugin_dir = '~/.vim/plugged'
if $OFFLINE
  let s:plugin_dir = '~/.vim-plugins'
elseif has('nvim')
  let s:plugin_dir = stdpath('data') . '/plugged'
endif

call plug#begin(s:plugin_dir)
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'mattn/emmet-vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'majutsushi/tagbar'
Plug 'godlygeek/tabular'
Plug 'sheerun/vim-polyglot'
Plug 'junegunn/fzf.vim'
Plug 'dracula/vim'
call plug#end()

let mapleader = ","
let g:mapleader = ","

set encoding=utf8
set ffs=unix,dos,mac

set rtp+=~/.fzf
set hidden

set backspace=eol,start,indent
set whichwrap+=<,>,h,l
set listchars=tab:>.,trail:.,extends:#,nbsp:.,eol:$

set relativenumber
set ruler

set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set nocindent
set autoindent
set smartindent
set nowrap

set tw=79
set cc=+1

if has('signcolumn')
  set signcolumn=yes
endif

set history=700
set scrolloff=3
set cmdheight=2
set laststatus=2
set updatetime=300
set shortmess+=c

set splitbelow
set splitright

set wildmenu
set wildmode=list:longest
set wildignore=*.o,*~,*.pyc,node_modules/

set magic
set showmatch
set ignorecase
set smartcase
set hlsearch
set incsearch

set noerrorbells
set novisualbell
set t_vb=
set tm=500

set nobackup
set nowritebackup
set nowb
set noswapfile

if has("termguicolors")
  set termguicolors
endif

set background=dark
colorscheme dracula

autocmd FileType ruby,javascript setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
autocmd FileType java,python setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab
autocmd FileType javscript,typescript,json setlocal tw=120
autocmd BufNewFile,BufRead *.handlebars,*.html.erb setlocal filetype=html
autocmd BufNewFile,BufRead *.ino setlocal filetype=c

nmap <silent> <leader>n :nohlsearch<cr>
nmap <silent> <leader>s :set list!<cr>

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
