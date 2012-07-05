" map leader (defaults to \)
" let mapleader = ','

" set colorscheme
if (&term == 'xterm' || &term =~? '^screen')
        " On my machine, I use Konsole with 256 color support
        set t_Co=256
        let g:CSApprox_konsole = 1
endif

if &t_Co >= 256 || has('gui_running')
  colorscheme molokai
endif

" pathogen is a plugin for managing plugins as bundles
filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()  " generate helptag documentation for any existing bundles

" enable filetype and plugins
filetype on
filetype indent on
filetype plugin on

" set options here
set ai           " auto indend
set si           " smart indent
set ff=unix      " file format unix dammit
set nocompatible " nocompatible mode
set ruler        " ruler the bottom

set expandtab     " expand tabs to spaces
set tabstop=2     " define what our tabs are
set softtabstop=2 " soft tabstop
set shiftwidth=2  " # of spaces for auto indent
set smarttab      " smart tab (shiftwidth v tabstop)
set tw=0          " no textwidth set by default
set modeline      " enable modelines
set modelines=3   " number of modelines to read
set tildeop       " case change with movement rather than single char

set showmatch       " show matching brackets
set matchtime=5     " how many tenths of a second to blink matching brackets for

set hlsearch    " highlight search on by default

set noincsearch   " move curser as you type search terms
set autoread            " auto read in files that have changed underneath
set shellcmdflag=-lc  " set the ! shell to be a login shell to get at functions and aliases

" settings requiring the latest vim
if version >= 703
  set colorcolumn=80    " highlight the 80th column
  set listchars=nbsp:¶,eol:¬,tab:>-,extends:»,precedes:«,trail:. " characters to use for 'specical' characters and non-printables
endif
