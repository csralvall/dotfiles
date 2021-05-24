" Cesar Alvarez Vallero

" Based on:
" https://github.com/JJGO/dotfiles/blob/master/vim/.vimrc
" https://dougblack.io/words/a-good-vimrc.html

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" General
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible						" disable vi compatibility: better safe than sorry
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Colors 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if (has("termguicolors"))		" use 'true colors' if possible
    set termguicolors
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif
syntax enable								" enable syntax processing
let g:molokai_original=1    " original molokai background color
colorscheme molokai					" molokai colorscheme
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Copy & Paste
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set pastetoggle=<F12>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Buffers, Windows & Tabs 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set hidden
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 
" Spaces & Tabs 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set tabstop=2						" number of visual spaces per TAB
set softtabstop=2				" number of spaces in tab when editing
set shiftwidth=2		    " number of spaces inserted for identation
set expandtab						" tabs are spaces
set autoindent			    " turn on autoidentation
set smartindent         " do smart autoindenting when starting a new line
" turnoff expandtab for editing makefiles
autocmd FileType make setlocal noexpandtab
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 
" UI config 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set number								" show line numbers
set relativenumber		    " show relative numbering
augroup numbertoggle	    " hybrid line numbers
	autocmd!
	" turn off relativenumber
	autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
	" turn on relativenumber
	autocmd BufLeave,FocusLost,InsertEnter	 * set norelativenumber
augroup END
set showcmd               " show command in bottombar
set cursorline		        " highlight current line
set wildmenu							" visual autocomplete for command menu
set showmatch							" highlight matching [{()}]
set laststatus=2	        " show status line at the bottom
set mouse+=a							" mouse support
set colorcolumn=80        " visual support for text length
filetype plugin indent on	" load filetype-specfic indent and plugin files
" set lazyredraw					" redraw only when we need to
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 
" Searching 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set incsearch							" search as characters are entered
set hlsearch							" highlight matches
set ignorecase						" ignore case in searches by default
set smartcase							" case sensitive if an uppercase is entered
" turn off search highlight
vnoremap <C-h> :nohlsearch<CR>
nnoremap <C-h> :nohlsearch<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 
" Folding 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set foldmethod=indent	  " fold based on indent level
set foldnestmax=10		  " 10 nested fold max
set nofoldenable				" don't fold files by default on open
nnoremap <space> za     " space open/closes folds
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 
" Lose bad habits 
" http://vimcasts.org/blog/2013/02/habit-breaking-habit-making/
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remove newbie crutches in Command Mode
" cnoremap <Down> <Nop>
" cnoremap <Left> <Nop>
" cnoremap <Right> <Nop>
" cnoremap <Up> <Nop>

" Remove newbie crutches in Insert Mode
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>
inoremap <Up> <Nop>

" Remove newbie crutches in Normal Mode
nnoremap <Down> <Nop>
nnoremap <Left> <Nop>
nnoremap <Right> <Nop>
nnoremap <Up> <Nop>

" Remove newbie crutches in Visual Mode
vnoremap <Down> <Nop>
vnoremap <Left> <Nop>
vnoremap <Right> <Nop>
vnoremap <Up> <Nop>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" vim-airline 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline_powerline_fonts=1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" NERDTree
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd VimEnter * NERDTree	" Start NERDTree and leave the cursor in it.
" Start NERDTree and put the cursor back in the other window.
autocmd VimEnter * NERDTree | wincmd p
" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" ALE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ale_fixers = {
\   'javascript': ['eslint'],
\		'json': ['fixjson'],
\}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Helptags
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " Plugins need to be added to runtimepath before helptags can be generated.
packloadall								" Load all plugins now.
" Load all of helptags now, after plugins have been loaded.
silent! helptags ALL			" All messages and errors will be ignored
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

