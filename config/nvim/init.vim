" ===========================================
" CORE
" ===========================================
set hidden " hide buffers instead of closing them
set number " enable line numbers
set shiftwidth=2
set tabstop=2
set expandtab " convert tabs to spaces
set nowrap
set ignorecase " case-insenstive searching
set smartcase " case-sensitive search IF pattern contains any uppercase letters
set grepprg=ag\ --vimgrep
set laststatus=2  " always show status bar (0=never, 1=default, 2=always)
set statusline=
set statusline+=%=%f\ %m
set signcolumn=yes " to left of line number, used by linters/error checkers etc
set cmdheight=2 " more space for messages
set nofoldenable " I don't like code folding
let g:ruby_host_prog = '~/.rbenv/versions/2.5.3/bin/neovim-ruby-host'
let mapleader = ","

" ===========================================
" ABBREVIATIONS
" ===========================================
" path of the current file
cabbr %% <C-R>=expand('%:p:h')<CR>
cabbr cword <C-R>=expand('<cword>')<CR>

" ===========================================
" PLUGINS
" https://github.com/junegunn/vim-plug
" ===========================================
call plug#begin(stdpath("config") . "/plugged")
  Plug 'junegunn/vim-easy-align'
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
	Plug 'junegunn/fzf.vim'

  " we want global maps for ragtag, have to load before
  let g:ragtag_global_maps = 1 
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-rails'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-ragtag'

  " let g:markdown_fenced_languages = ['css', 'js=javascript']
  " Plug 'tpope/vim-markdown'

  Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }

  Plug 'tpope/vim-projectionist'

  let g:fuzzy_projectionist_preview = 1
  Plug 'cormacrelf/fuzzy-projectionist.vim'

  Plug 'zirrostig/vim-schlepp'
	Plug 'rizzatti/dash.vim'

  Plug 'neoclide/coc.nvim', {'branch': 'release' }

	" need to set this before loading ack.vim otherwise it will bail if 'ack' is
	" not executable, and we don't want to use ack anyway
	let g:ackprg = 'ag --vimgrep'
	Plug 'mileszs/ack.vim'

  " colorschemes
  Plug 'drewtempelmeyer/palenight.vim'
	Plug 'Rigellute/shades-of-purple.vim'
  
  " let base16colorspace=256
  Plug 'chriskempson/base16-vim'
  Plug 'joshdick/onedark.vim'

	" filetypes
  " polyglot config
  " https://github.com/sheerun/vim-polyglot/blob/master/syntax/php.vim
  let php_sql_query = 0 " turned off because it was highlighting words like 'when', 'in', etc
  let php_html_in_strings = 1
  let g:polyglot_disabled = ['html']
  Plug 'sheerun/vim-polyglot'
  Plug 'ycmjason/html5.vim', { 'branch': 'self-closing-indent' }
call plug#end()

" ===========================================
" COMMANDS
" ===========================================
command! W w
command! Qa qa

" ===========================================
" MAPPINGS
" ===========================================
" go to previous buffer
nnoremap ff :b#<CR>

nnoremap <Leader>w :w<CR>

" turn off highlighted search results
nnoremap // :nohl<CR>

" reindent the entire file
nnoremap === gg=G

" gp and gP select the last paste, in char-wise (p) or line-wise (P) mode
noremap gp `[v`]
noremap gP `[V`]

" perform literal search for word at cursor
" nnoremap ## :Ag -Q "<c-r>=expand("<cword>")<CR>"<CR>
nnoremap ## :CocSearch <c-r>=expand("<cword>")<CR><CR>

map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

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
" silent! color onedark
