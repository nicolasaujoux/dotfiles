""""""""""""""""""""""" PLUGINS
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'matchit.zip'
Bundle 'The-NERD-Commenter'
Bundle 'Lokaltog/vim-powerline'
Bundle 'Command-T'
Bundle 'kien/ctrlp.vim'
Bundle 'ervandew/supertab'
" Bundle 'msanders/snipmate'
Bundle 'sjl/gundo.vim'

set nocompatible

set number
set ruler
syntax on

"""""""""""""""""""" GLOBAL
let mapleader=","
colorscheme molokai
set gfn=terminus
set go=

syntax on
filetype plugin indent on
set encoding=utf-8
set hidden
set showcmd
set nowrap
set backspace=indent,eol,start
set autoindent
set copyindent
set number
set shiftround
set ignorecase
set smartcase
set hlsearch
set incsearch
set history=1000
set undolevels=1000
set wildignore=*.swp,*.bak
set title
set visualbell
set noerrorbells
set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.
set ttyfast
set mouse=
set nocompatible
set backup
set backupdir=~/.vim_backup
set noswapfile
set fileformats=unix,dos,mac
set laststatus=2
set expandtab
set softtabstop=2 tabstop=2 shiftwidth=2
set ruler


syntax enable
set background=dark
" colorscheme solarized
" colorscheme Tomorrow-Night
colorscheme molokai

" Window Size
" set lines=55
set columns=95

" Define FONT
"set guifont=Mensch:h12
set guifont=Inconsolata:h12

" Command-T
set wildignore+=*.o,*.obj,.git,*.pyc
let g:CommandTMaxHeight = 15

" Line Width
autocmd FileType rst,txt,md setlocal tw=79


" TABS/SPACES for different filetype
set sw=4
set st=4
set ts=4
set noexpandtab

" Do not touch tabs in Makefile
autocmd FileType make setlocal noexpandtab

autocmd BufEnter *.py set ai sw=4 ts=4 sta et fo=croql

autocmd FileType c,cpp,objc,java,php,javascript
    \    setlocal formatoptions=croql cindent
    \    comments=sr:/*,mb:*,ex:*/,://
    \    shiftwidth=4
    \    tabstop=4
    \    softtabstop=4

autocmd FileType ruby
    \    setlocal expandtab
    \    shiftwidth=2
    \    tabstop=2
    \    softtabstop=2
    
    autocmd BufEnter *.yml
    \    setlocal expandtab
    \    shiftwidth=2
    \    tabstop=2
    \    softtabstop=2
    
    autocmd FileType xml
    \    setlocal expandtab
    \    shiftwidth=4
    \    tabstop=4
    \    softtabstop=4
    
    autocmd FileType html
    \    setlocal expandtab
    \    shiftwidth=4
    \    tabstop=4
    \    softtabstop=4
    
    autocmd BufEnter *.css
    \    setlocal expandtab
    \    shiftwidth=4
    \    tabstop=4
    \    softtabstop=4

" Gundo mapping
nnoremap <F5> :GundoToggle<CR>


" Directories for swp files
function! InitializeDirectories()
  let separator = "."
  let parent = "/tmp"
  let prefix = 'vim'
  let dir_list = { 
			  \ 'backup': 'backupdir', 
			  \ 'views': 'viewdir', 
			  \ 'swap': 'directory' }

  for [dirname, settingname] in items(dir_list)
	  let directory = parent . '/' . prefix . dirname . "/"
	  if exists("*mkdir")
		  if !isdirectory(directory)
			  call mkdir(directory)
		  endif
	  endif
	  if !isdirectory(directory)
		  echo "Warning: Unable to create backup directory: " . directory
		  echo "Try: mkdir -p " . directory
	  else  
          let directory = substitute(directory, " ", "\\\\ ", "")
          exec "set " . settingname . "=" . directory
	  endif
  endfor
endfunction
call InitializeDirectories()

" MacVIM shift+arrow-keys behavior (required in .vimrc)
let macvim_hig_shift_movement = 1
command W w !sudo tee % > /dev/null

" Include user's local vim config
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif

