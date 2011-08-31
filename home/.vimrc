set nocompatible

set number
set ruler
syntax on

" Map LEADER key to ,
let mapleader = ','

" Set encoding
set encoding=utf-8

" Whitespace stuff
set nowrap
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set list listchars=tab:\ \ ,trail:·

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

" Use modeline overrides
set modeline
set modelines=10

" Default color scheme
syntax enable
set background=dark
colorscheme solarized

" Window Size
set lines=55
set columns=95

" Define FONT
set guifont=Mensch:h12

" Show (partial) command in the status line
set showcmd

" Pathogen
call pathogen#infect()

" Directories for swp files
function! InitializeDirectories()
  let separator = "."
  let parent = "/tmp/"
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


" Include user's local vim config
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif

