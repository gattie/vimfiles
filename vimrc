set backspace=indent,eol,start

" set colorscheme
if (&term == 'xterm' || &term =~? '^screen')
  " On my machine, I use Konsole with 256 color support
  set t_Co=256
  let g:CSApprox_konsole = 1
endif

" set syntax highlighting if we have color or gui
if &t_Co >= 256 || has('gui_running')
  syntax on
  colorscheme molokai
endif

" pathogen is a plugin for managing plugins as bundles
filetype off
call pathogen#runtime_append_all_bundles()
" generate helptag documentation for any existing bundles
call pathogen#helptags()

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

"====[ Make the 81st column"standout"]==========================================
highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%81v', 100)

"====[ Make tabs, trailing whitespace, and non-breaking spaces visible"]========
exec "set listchars=tab:\uBB\uBB,trail:\uB7,nbsp:~"
set list

"====[ Highlight the entire line when jumping through matches"]=================
nnoremap <silent> n   n:call HLNext(0.1)<cr>
nnoremap <silent> N   N:call HLNext(0.1)<cr>

function! HLNext (blinktime)
  set invcursorline
  redraw
  exec 'sleep ' . float2nr(a:blinktime * 1000) . 'm'
  set invcursorline
  redraw
endfunction

"====[ Swap v and CTRL-V, because Block mode is more useful that Visual mode"]==
nnoremap    v   <C-V>
nnoremap <C-V>     v

vnoremap    v   <C-V>
vnoremap <C-V>     v
