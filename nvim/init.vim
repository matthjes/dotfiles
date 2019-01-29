" Specify a directory for plugins
call plug#begin('~/.config/nvim/plugged')

Plug 'bling/vim-airline'
Plug 'morhetz/gruvbox'

" CtrlP
Plug 'ctrlpvim/ctrlp.vim'

" Completion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-go'

" Rainbow Parentheses
Plug 'luochen1990/rainbow'

" Auto Pairs
Plug 'jiangmiao/auto-pairs'

" Tabline
Plug 'mkitt/tabline.vim'

" Tables
Plug 'dhruvasagar/vim-table-mode'

" fugitive diff tool
Plug 'tpope/vim-fugitive'

" Initialize plugin system
call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General options

syntax on
set laststatus=2                 " always show status line
set tabstop=2                    " number of spaces of tab character
set shiftwidth=2                 " number of spaces to (auto)indent
set scrolloff=3                  " number of context lines above and below the cursor
set showcmd                      " show (partial) command in the last line of the screen
set hlsearch                     " highlight searches
set incsearch                    " do incremental searching
set ruler                        " show the cursor position at all time
set visualbell t_vb=             " turn off error beep / flash
set novisualbell                 " turn off visual bell
set nobackup                     " do not keep a backup file
set writebackup                  " create backup file before writing
set number                       " show line numbers
set ignorecase                   " ignore case when searching
set title                        " show title in console title bar
set ttyfast                      " fast terminal connection
set modeline                     " last lines in document set vim mode
set modelines=3                  " number of lines checked for vim modi
set shortmess=atIT               " abbreviation messages: a = many default abbr.;
                                 " t = truncate file message at start if it is too long to
                                 " fit on the command line; I = no intro message;
                                 " T = truncate long messages
set nostartofline                " don't jump to first character for certain move commands
set whichwrap=b,s,h,l,<,>,[,]    " move freely between lines
set hidden                       " allows to change buffer w/o saving current buffer
set backspace=indent,eol,start   " backspace deletes over line breaks
set autoindent                   " always set autoindent on
set expandtab                    " use number of spaces to insert tab
set showmatch                    " show matching braces
set nowrap                       " do not wrap lines
set colorcolumn=79               " highlight column 79
set textwidth=0                  " do not break lines
set formatoptions+=l             " do not break long lines in insert mode
set numberwidth=5                " minimal number of columns used for line number
set completeopt+=longest,menuone " completion option: insert longest common text,
                                 " use popup menu if there is only one match
set completeopt-=preview
set foldmethod=syntax
set foldlevel=99

" do not show files with certain extensions (binary files)
set wildignore+=*.o,*.obj,.git,.svn,*.mexa64,*.pdf,*.jpg,*.png,*.gif,*.eps,*.svg,*.pyc
set wildignore+=*/node_modules/*,*/bower_components/*,*/.git/*

let mapleader = ","              " set leader to comma
set cmdheight=2

let g:deoplete#enable_at_startup = 1

set background=dark
colorscheme gruvbox

autocmd BufEnter *.txt call SetTxtOptions()

function SetTxtOptions()
  setlocal textwidth=79
  setlocal linebreak
  setlocal wrap
endfunction

source ~/.config/nvim/user/functions.vim
source ~/.config/nvim/user/keys.vim
source ~/.config/nvim/user/plugins.vim
source ~/.config/nvim/user/vimwiki.vim
