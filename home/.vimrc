set nocompatible

filetype on                          " set filetype stuff to on
filetype plugin on
filetype indent on

set number                              " show line numbers
set ruler                               " show the cursor position all the time
set wrap                     			 		  " wrap lines
set tabstop=2                   		 		" a tab is two spaces
set expandtab                           " insert space characters whenever the tab key is pressed
set backspace=indent,eol,start  		 		" allow backspacing over everything in insert mode
set autoindent                  		 		" always set autoindenting on
set copyindent                  		 		" copy the previous indentation on autoindenting
set shiftwidth=2                		 		" number of spaces to use for autoindenting
set shiftround                  		 		" use multiple of shiftwidth when indenting with '<' and '>'
set showmatch                   		 		" set show matching parenthesis
set foldenable                  		 		" enable folding
set ignorecase                  		 		" ignore case when searching
set smartcase                   		 		" ignore case if search pattern is all lowercase, case-sensitive otherwise
set smarttab                    		 		" insert tabs on the start of a line according to shiftwidth, not tabstop
set scrolloff=2                 		 		" keep 2 lines off the edges of the screen when scrolling
set virtualedit=all             		 		" allow the cursor to go in to "invalid" places
set hlsearch                    		 		" highlight search terms
set incsearch                   		 		" show search matches as you type

autocmd BufWritePre * :%s/\s\+$//e   		" Remove trailing whitespace before saving

" Map <F1> to use FuzzyFinder
map <F1> :FufFile<CR>
imap <F1> <ESC>

" Map <F2> to toggle the NERDTree
map <F2> :NERDTreeToggle<CR>

"Tab switching with <F3> & <F4>
map <F3> :tabp<CR>
map <F4> :tabn<CR>

" No more toolbar
if has("gui_running")
    set guioptions=egmrt
endif

" Define color scheme to use
" colorscheme railscasts
syntax enable
set background=dark
colorscheme solarized


set gfn=Menlo:h12
set shell=/bin/bash



autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS

