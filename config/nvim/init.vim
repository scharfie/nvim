" ===========================================
" CORE
" ===========================================
set hidden " hide buffers instead of closing them
set number " enable line numbers
set shiftwidth=2
set tabstop=2
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
  Plug 'junegunn/vim-easy-align'
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'tpope/vim-rails'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-fugitive'
  Plug 'zirrostig/vim-schlepp'

  " colorschemes
  Plug 'drewtempelmeyer/palenight.vim'
	Plug 'Rigellute/shades-of-purple.vim'
call plug#end()

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

" ===========================================
" COLORS
" ===========================================
set background="dark"
if (has("termguicolors"))
  set termguicolors
endif

color slate
silent! color palenight
" silent! color shades_of_purple
