" ===========================================
" CORE
" ===========================================
set hidden " hide buffers instead of closing them
set number " enable line numbers
set shiftwidth=2
set tabstop=2
set nowrap
set ignorecase " case-insenstive searching
set smartcase " case-sensitive search IF pattern contains any uppercase letters
set grepprg=ag\ --vimgrep

let mapleader = ","

" ===========================================
" ABBREVIATIONS
" ===========================================
" path of the current file
cabbr %% <C-R>=expand('%:p:h')<CR>

" ===========================================
" PLUGINS
" ===========================================
call plug#begin(stdpath("config") . "/plugged")
  " https://github.com/junegunn/vim-plug
  Plug 'junegunn/vim-easy-align'
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
	" Plug 'junegunn/fzf.vim'

  Plug 'tpope/vim-rails'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-fugitive'
  Plug 'zirrostig/vim-schlepp'
	Plug 'rizzatti/dash.vim'

	" need to set this before loading ack.vim otherwise it will bail if 'ack' is
	" not executable, and we don't want to use ack anyway
	let g:ackprg = 'ag --vimgrep'
	Plug 'mileszs/ack.vim'

  " colorschemes
  Plug 'drewtempelmeyer/palenight.vim'
	Plug 'Rigellute/shades-of-purple.vim'

	" filetypes
	Plug 'jwalton512/vim-blade'	
call plug#end()

" ===========================================
" COMMANDS
" ===========================================
command! W w
command! Qa qa

" ===========================================
" MAPPINGS
" ===========================================
" we could use the vim-previous-buffer plugin but let's try a simpler option
" for now
nnoremap ff :b#<CR>
" nnoremap ff :PreviousBuffer<CR>
" nnoremap fF :PreviousBuffer<CR>
" nnoremap Ff :PreviousBuffer<CR>
" nnoremap FF :PreviousBuffer<CR>

nnoremap <Leader>w :w<CR>

" turn off highlighted search results
nnoremap // :nohl<CR>

" reindent the entire file
nnoremap === gg=G

" gp and gP select the last paste, in char-wise (p) or line-wise (P) mode
noremap gp `[v`]
noremap gP `[V`]

" ===========================================
" COLORS
" ===========================================
set background="dark"
if (has("termguicolors"))
  set termguicolors
endif

color slate
" silent! color palenight
silent! color shades_of_purple
