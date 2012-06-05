" vimrc
" Author: Bertrand Cachet <bertrand.cachet@gmail.com>
" Source: http://github.com/bcachet/dotfiles
"

" Plugins {{{
" Plugins > Vundle {{{
set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
" }}}


" Use ack-grep instead of grep
Bundle 'mileszs/ack.vim'
" Display tags in a window, ordered by class
Bundle 'majutsushi/tagbar' 
 " Align comments, declarations, statements
Bundle 'tsaleh/vim-align'
" Git support
Bundle 'tpope/vim-fugitive' 
" Quoting/parenthesing made simple
Bundle 'tpope/vim-surround'
" Indent code (usefull for python)
Bundle 'michaeljsmith/vim-indent-object'
" Comment/Uncomment code
Bundle 'scrooloose/nerdcommenter' 
" Tree explorer plugin
Bundle 'scrooloose/nerdtree' 
" Syntax checking
" Bundle 'scrooloose/syntastic' 
" Powered status line
Bundle 'Lokaltog/vim-powerline' 
" Snippets
Bundle 'msanders/snipmate.vim' 
" Three way merges
Bundle 'sjl/splice.vim' 
" Visual Undo
Bundle 'sjl/gundo.vim' 
" File/buffer/mru/tag finder
Bundle 'kien/ctrlp.vim' 
" Completion with Tab
Bundle 'ervandew/supertab' 
" Source code browser based on CTags
Bundle 'taglist.vim'
" Generate HTML from Markup language
Bundle 'zaiste/hammer.vim'
" C/C++ auto completion based on CLang
Bundle 'clang-complete'
" Latex plugin
Bundle 'vimlatex'
" Colorschemes {{{
Bundle 'sjl/badwolf'
Bundle 'altercation/vim-colors-solarized'
Bundle 'tomasr/molokai'
" }}}

" Plugins > Vundle {{{
filetype plugin indent on
" }}}

" }}}

" General {{{
" General > Display {{{
syntax enable
set background=dark
colorscheme molokai
colorscheme badwolf
" Window Size
set columns=95
set t_Co=256
" Define FONT
set guifont=MenloForPowerline:h12

" EOL and Tabulation are displayed like TextMate
:set listchars=tab:➜\ ,eol:¬

" Highlight VCS conflict markers
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'
" }}}


" General > Mapping
let mapleader = ","
let maplocalleader = "\\"
" }}}

" Mappings {{{

nmap <silent> <leader>h :set invhlsearch<CR>
nmap <silent> <leader>l :set invlist<CR>
nmap <silent> <leader>n :set invnumber<CR>
nmap <silent> <leader>p :set invpaste<CR>
nmap <silent> <leader>i :set invrelativenumber<CR>

nmap ; :<CR>

" }}}

" Abbrevs {{{
"
iabbrev b@ bertrand.cachet@gmail.com

" . }}}

" Settings {{{
set autoread 
set backspace=indent,eol,start
set binary
set cinoptions=:0,(s,u0,U1,g0,t0
" Complete options (disable preview scratch window)
set completeopt=menu,menuone,longest
" close it on movement in insert mode or when leaving
" insert mode
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
set pumheight=15
set hidden 
set history=1000
set incsearch 
set laststatus=2 
set list

set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮
set showbreak=↪

set notimeout
set ttimeout
set ttimeoutlen=10

" _ backups {{{ 
" set undodir=/tmp/vim/undo/     " undo files
" set backupdir=/tmp/vim/backup/ " backups
" set directory=/tmp/vim/swap/   " swap files
" set backup
" set noswapfile
" _ }}}

set modelines=0 
set noeol
" set relativenumber
set number
set numberwidth=5
set ruler 
set shell=/bin/zsh 
set showcmd 

set matchtime=2

set completeopt=longest,menuone,preview

" White characters {{{
set autoindent
set tabstop=4 
set textwidth=80
set shiftwidth=4 
set softtabstop=4
set expandtab
set wrap 
set formatoptions=qrn1
" }}}

set visualbell 

set wildignore=.svn,CVS,.git,.hg,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,.DS_Store,*.aux,*.out,*.toc
set wildmenu 

set dictionary=/usr/share/dict/words
" }}}

" Filetype/Extension association {{{

" wiki files are in fact creole
autocmd BufEnter *.wiki set filetype=creole

autocmd BufEnter README set filetype=rst
" }}}

" TABS/SPACES for different filetype {{{
"set sw=2
"set st=2
"set ts=2
"set expandtab

" Makefile {{{
autocmd FileType make setlocal noexpandtab
" }}}
" Python {{{
autocmd BufEnter *.py set ai sw=4 ts=4 sta et fo=croql
" }}}
" C/CPP/Objective-C/Java/Javascript {{{
autocmd FileType c,cpp,objc,java,php,javascript
    \ setlocal formatoptions=croql cindent
    \ comments=sr:/*,mb:*,ex:*/,://
    \ shiftwidth=2
    \ tabstop=2
    \ softtabstop=2
    \ textwidth=80
    \ wrap
    \ expandtab
    \ cindent
    \ cinoptions=h1,l1,g1,t0,i4,+4,(0,w1,W4
" }}}
" Ruby {{{
autocmd FileType ruby
    \ setlocal expandtab
    \ shiftwidth=2
    \ tabstop=2
    \ softtabstop=2
" }}}
" YML {{{
autocmd BufEnter *.yml
    \ setlocal expandtab
    \ shiftwidth=2
    \ tabstop=2
    \ softtabstop=2
" }}}
" XML {{{
autocmd FileType xml
    \ setlocal expandtab
    \ shiftwidth=4
    \ tabstop=4
    \ softtabstop=4
" }}}
" HTML {{{
autocmd FileType html
    \ setlocal expandtab
    \ shiftwidth=4
    \ tabstop=4
    \ softtabstop=4
" }}}
" CSS {{{  
autocmd BufEnter *.css
    \ setlocal expandtab
    \ shiftwidth=4
    \ tabstop=4
    \ softtabstop=4
" }}}
" }}}

" Triggers {{{
" Save when losing focus
au FocusLost    * :silent! wall
" }}}

" Cursorline {{{
" Only show cursorline in the current window and in normal mode.
augroup cline
    au!
    au WinLeave * set nocursorline
    au WinEnter * set cursorline
    au InsertEnter * set nocursorline
    au InsertLeave * set cursorline
augroup END
" }}}

" Trailing whitespace {{{
" Only shown when not in insert mode so I don't go insane.
augroup trailing
    au!
    au InsertEnter * :set listchars-=trail:⌴
    au InsertLeave * :set listchars+=trail:⌴
augroup END
" }}}

" searching {{{

" sane regexes
nnoremap / /\v
vnoremap / /\v

set ignorecase 
set smartcase
set showmatch 
set gdefault
set hlsearch

" clear search matching
noremap <leader><space> :noh<cr>:call clearmatches()<cr>

" Don't jump when using * for search 
nnoremap * *<c-o>

" Keep search matches in the middle of the window.
nnoremap n nzzzv
nnoremap N Nzzzv

" Same when jumping around
nnoremap g; g;zz
nnoremap g, g,zz

" Open a Quickfix window for the last search.
nnoremap <silent> <leader>? :execute 'vimgrep /'.@/.'/g %'<CR>:copen<CR>

" Begining & End of line in Normal mode 
noremap H ^
noremap L g_

" Easy buffer navigation
noremap <C-h>  <C-w>h
noremap <C-j>  <C-w>j
noremap <C-k>  <C-w>k
noremap <C-l>  <C-w>l

" Splits ,v and ,h to open new splits (vertical and horizontal)
nnoremap <leader>v <C-w>v<C-w>l
nnoremap <leader>s <C-w>s<C-w>j

" Reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv

" Highlight word {{{

nnoremap <silent> <leader>hh :execute 'match InterestingWord1 /\<<c-r><c-w>\>/'<cr>
nnoremap <silent> <leader>h1 :execute 'match InterestingWord1 /\<<c-r><c-w>\>/'<cr>
nnoremap <silent> <leader>h2 :execute '2match InterestingWord2 /\<<c-r><c-w>\>/'<cr>
nnoremap <silent> <leader>h3 :execute '3match InterestingWord3 /\<<c-r><c-w>\>/'<cr>
" }}}
" }}}

" folding {{{

set foldlevelstart=0

" Space to toggle folds.
nnoremap <Enter> za
vnoremap <Enter> za

" Make zO recursively open whatever top level fold we're in, no matter where the
" cursor happens to be.
nnoremap zO zCzO

" Use ,z to "focus" the current fold.
nnoremap <leader>z zMzvzz

function! MyFoldText() " {{{
    let line = getline(v:foldstart)

    let nucolwidth = &fdc + &number * &numberwidth
    let windowwidth = winwidth(0) - nucolwidth - 3
    let foldedlinecount = v:foldend - v:foldstart

    " expand tabs into spaces
    let onetab = strpart('          ', 0, &tabstop)
    let line = substitute(line, '\t', onetab, 'g')

    let line = strpart(line, 0, windowwidth - 2 -len(foldedlinecount))
    let fillcharcount = windowwidth - len(line) - len(foldedlinecount)
    return line . '…' . repeat(" ",fillcharcount) . foldedlinecount . '…' . ' '
endfunction " }}}
set foldtext=MyFoldText()

" _ Vim {{{
augroup ft_vim
    au!

    au FileType vim setlocal foldmethod=marker
    au FileType help setlocal textwidth=78
    au BufWinEnter *.txt if &ft == 'help' | wincmd L | endif
augroup END
" }}}

" }}}
"
" Quick editing {{{

nnoremap <leader>ev <C-w>s<C-w>j:e $MYVIMRC<cr>
nnoremap <leader>es <C-w>s<C-w>j:e ~/.vim/snippets/<cr>
nnoremap <leader>eg <C-w>s<C-w>j:e ~/.gitconfig<cr>
nnoremap <leader>ez <C-w>s<C-w>j:e ~/.zshrc<cr>
nnoremap <leader>et <C-w>s<C-w>j:e ~/.tmux.conf<cr>

" }}}

" PLUGINS {{{

" _ Ack {{{
nnoremap <leader>a :Ack!<space>
" }}}

" _ Powerline {{{
let g:Powerline_symbols = 'fancy'
let g:Powerline_cache_enabled = 1
" }}}

" syntastic {{{
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=1
" }}}

" nerdtree {{{
nmap <C-u> :NERDTreeToggle<CR>
" }}}

" CtrlP {{{
let g:ctrlp_map = '<c-p>'
nnoremap <C-F> :CtrlPCurFile<CR>
" the nearest ancestor that contains one of these directories or files: .git,
" .hg, .bzr, _darcs, root.dir
let g:ctrlp_working_path_mode = 0
" We want to exclude directories or files from the search
let g:ctrlp_custom_ignore = {
  \ 'dir': '\.git$\|\.hg$\|\.svn$\|build$\|\.sass-cache$\|toolchains\|vendor$',
  \ 'file': '\.gitignore\|\.DS_Store' }
"set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/build/* " for Linux/MacOSX
" }}}

" nerdcommenter {{{
nmap <leader># :call NERDComment(0, "invert")<cr>
vmap <leader># :call NERDComment(0, "invert")<cr>
" }}}

" ,t to show tags window {{{
nmap <leader>t :TagbarToggle<CR>
" }}}

" vim-indentobject {{{
let g:indentobject_meaningful_indentation = ["haml", "sass", "python", "yaml", "markdown"]
" }}}

" Hammer {{{
nmap <leader>p :Hammer<cr>
" }}}

" SuperTab {{{
" SuperTab option for context aware completion
 let g:SuperTabDefaultCompletionType = "context"
" }}}

" Clang-complete {{{
" Disable auto popup, use <Tab> to autocomplete
 let g:clang_complete_auto = 0
 " Show clang errors in the quickfix window
 let g:clang_complete_copen = 0
" }}}
"
" }}}

" Extensions {{{

" }}}


