" Vim configuration file

" DEFAULT OPTIONS
set nocompatible			" make Vim default to nicer options

" READING OPTIONS
set modeline modelines=1	" use settings from file being edited

" INPUT OPTIONS
" set mouse=a				" use the mouse

" DISPLAY OPTIONS
set number					" show line numbers
set ruler					" show line and column information
set notitle					" don't set change terminal's title
set backspace=2		    	" backspaces can go over lines
set tabstop=4				" tabs are every 4 columns
set shiftwidth=4
set shiftround              "sr:    rounds indent to a multiple of shiftwidth
:if version >= 600
  set listchars=eol:$,tab:>-,trail:-,extends:>,precedes:<
:elseif version >= 500
  set listchars=eol:$,tab:>-,trail:-,extends:+
:endif
set laststatus=2			" always show status line
set showmode				" always show command or insert mode
set shortmess=lnrxI			" brief messages, don't show intro
set showcmd					" show partial commands
set more					" use a pager for long listings
set wrap					" wrap long lines
syntax on					" use syntax highlighting
syntax enable
filetype plugin on
filetype plugin indent on
set wildmenu

" SAVING OPTIONS
set noexpandtab				" don't change tabs into spaces
set backupext=~				" backup files end in ~
set nobackup
set noswapfile
set nowritebackup

" EDITING OPTIONS
set autoindent				" keep indenting at same level
set noerrorbells visualbell	" flash screen instead of ringing bell
if !has('nvim')
	set esckeys					" allow arrow keys in insert mode
endif
set showmatch				" show matching brackets

" SEARCH OPTIONS
" set nohlsearch				" don't highlight search patterns
set hlsearch
set incsearch				" search while typing
set ignorecase				" make searches case-insensitive
" clean results
" nmap <silent> <C-C> :silent noh<CR>
nmap <silent> <C-C> :set hlsearch!<CR>

" MISCELLANEOUS OPTIONS
set dictionary=/usr/share/dict/words	" get words from system dictionary
set magic								" regexp chars have special meaning

" =================================
" Keyboard
" push 
nnoremap <leader><Up>   d1dkP
nnoremap <leader><Down> d1djP
" =================================

" use system clipboard
" set clipboard=unnamedplus
set clipboard=unnamed
 
if has("gui_running")    
	colorscheme solarized
	" disable menus
	set guioptions=m
	" use system clipboard for pasting
	"set clipboard=unnamed  
	"set clipboard=unnamedplus
	" set guioptions=r
	" set guioptions=T	
	" set guifont=Consolas:h12	
	if  has("gui_win32")
		set guifont=Consolas:h10	
	elseif has("gui_macvim")	
		"set guifont=Anonymous\ Pro:h12
		set guifont=Menlo:h12
	end	
	set cul                     " highlight current line
	set background=dark
else
	set background=light    	" better colors for white terminals
	set t_Co=256            	" 256 colors mode 
endif

" -------------------------
augroup md
  au!
  autocmd BufNewFile,BufRead *.md   TableModeEnable
augroup END
" ===================================

" Auto download plug plugin manager if it doesn't exist
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" ===================================
" plugin manager vim-plug
" https://github.com/junegunn/vim-plug
" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
" Make sure you use single quotes
call plug#begin('~/.vim/plugged')

" airline https://github.com/vim-airline/vim-airline
Plug 'https://github.com/vim-airline/vim-airline'

" auto-pairs
Plug 'https://github.com/jiangmiao/auto-pairs'

" ctrlp.vim
Plug 'https://github.com/ctrlpvim/ctrlp.vim'

" NERDTree
Plug 'https://github.com/scrooloose/nerdtree'

" Syntastic
Plug 'https://github.com/vim-syntastic/syntastic'

" fugitive git
Plug 'https://github.com/tpope/vim-fugitive'
"
" Deoplete https://github.com/Shougo/deoplete.nvim
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
let g:deoplete#enable_at_startup = 1

" browserlink
Plug 'https://github.com/jaxbot/browserlink.vim'

" buffer explorer
Plug 'https://github.com/jlanzarotta/bufexplorer'
" Buffers - explore/next/previous: Alt-F12, F12, Shift-F12.
nnoremap <silent> <M-F12> :BufExplorer<CR>
nnoremap <silent> <F12> :bn<CR>
nnoremap <silent> <S-F12> :bp<CR>
set hidden " https://stackoverflow.com/questions/2414626/unsaved-buffer-warning-when-switching-files-buffers

" macro manager
"<F2>            - Find and execute a macro or insert template from repository
"Visual <F2> - Replays last macro for each line selected
"<F3>             - Save default macro register by name to the macro repository 
"Visual <F3>  - Save selection as template by name to the macro repository 
"<Tab>            - On the Macro command line for cycling through autocomplete
"<Control>+D - On the Macro command line for listing autocomplete options
Plug 'https://github.com/vim-scripts/marvim'

" table mode
Plug 'https://github.com/dhruvasagar/vim-table-mode'
let g:table_mode_corner='|'

" git conflict
Plug 'https://github.com/mkotha/conflict3'

" fzf (install fzf from https://github.com/junegunn/fzf)
Plug '~/.fzf'

" vim-rainbow - color paranthesis and brackets
Plug 'frazrepo/vim-rainbow'
au FileType c,cpp,objc,objcpp,py,js,sh call rainbow#load()
 
" nerdcommenter - https://github.com/scrooloose/nerdcommenter - comment with leader(/) + cc
Plug 'scrooloose/nerdcommenter'

"git gutter
Plug 'https://github.com/airblade/vim-gitgutter'

"" Initialize plugin system
call plug#end()
" ===================================


