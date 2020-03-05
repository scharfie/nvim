" https://github.com/junegunn/fzf.vim
" https://github.com/junegunn/fzf/wiki/Examples-(vim)
" let g:fzf_layout = { 'window': 'enew' }
" let s:default_layout = { 'down': '~40%' }

" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Customize fzf colors to match your color scheme
" let g:fzf_colors =
" \ { 'fg':      ['fg', 'Normal'],
"   \ 'bg':      ['bg', 'Normal'],
"   \ 'hl':      ['fg', 'Comment'],
"   \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
"   \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
"   \ 'hl+':     ['fg', 'Statement'],
"   \ 'info':    ['fg', 'PreProc'],
"   \ 'prompt':  ['fg', 'Conditional'],
"   \ 'pointer': ['fg', 'Exception'],
"   \ 'marker':  ['fg', 'Keyword'],
"   \ 'spinner': ['fg', 'Label'],
"   \ 'header':  ['fg', 'Comment'] }

" \ 'source':  reverse(s:all_files()),
command! FZFMru call fzf#run({
  \ 'source':  s:all_files(),
  \ 'sink':    'edit',
  \ 'options': '-m -x +s',
  \ 'down':    '40%' })

function! s:all_files()
  return extend(
  \ filter(copy(v:oldfiles),
  \        "v:val !~ 'fugitive:\\|NERD_tree\\|^/tmp/\\|.git/'"),
  \ map(filter(range(1, bufnr('$')), 'buflisted(v:val)'), 'bufname(v:val)'))

  let here  = getcwd()
  let files = copy(v:oldfiles)
  call filter(files, "v:val !~ 'fugitive:\\|NERD_tree\\|^/tmp/\\|.git/'")
  " call map(files, "substitute(v:val,'" . here . "','', '')")
  " call filter(files, "v:val =~ '" . here . "'")
  " call extend(files, map(filter(range(1, bufnr('$')), 'buflisted(v:val)'), 'bufname(v:val)'))
  return files
endfunction

function! s:buflist()
  redir => ls
  silent ls
  redir END
  return split(ls, '\n')
endfunction

function! s:bufopen(e)
  execute 'buffer' matchstr(a:e, '^[ 0-9]*')
endfunction

" command! FZFBuffers call fzf#run({
"   \   'source':  reverse(<sid>buflist()),
"   \   'sink':    function('<sid>bufopen'),
"   \   'options': '+m',
"   \   'down':    len(<sid>buflist()) + 2
"   \ })

" command! FZFColor call fzf#run({
"   \   'source':
"   \     map(split(globpath(&rtp, "colors/*.vim"), "\n"),
"   \         "substitute(fnamemodify(v:val, ':t'), '\\..\\{-}$', '', '')"),
"   \   'sink':    'colo',
"   \   'options': '+m',
"   \   'left':    30
"   \ })

function! s:fzf_related() 
  let basename = '"' . split(expand('%:t:r'), "_test")[0] . '"'
  
  let options = {
        \ 'options': '-x -q ' . basename,
        \ 'sink':    'edit',
        \ 'down':    '40%' }

  echo options
  call fzf#run(options)
endfunction
command! FZFRelated call s:fzf_related()

" command! FZFVimconfig call fzf#run({
"   \ 'dir':    stdpath('config'),
"   \ 'options': '-x',
"   \ 'sink':   'edit',
"   \ 'down':   '40%'
"   \ })

command! -bang FZFVimconfig call fzf#vim#files(stdpath('config'), <bang>0)

map <Leader>f :FZF<CR>

" look for files in the same directory as buffer
map <Leader>e :FZF %%<CR>

map <Leader>a :FZFRelated<CR>
map <Leader>r :FZFMru<CR>
map <Leader>b :Buffers<CR>
map <Leader>v :FZFVimconfig<CR>
map <Leader>c :Colors<CR>


" command! FZFRelated call fzf#run({
"   let basename = split(expand('%:t:r'), "_test")[0]
"   'options': '-q '
" look for 'similar' files (take base filename of current buffer as default
" search input)
" note that it also removes _test from the search input
" nnoremap <Leader>a :FZF split(expand('%:t:r'), "_test")[0]
"       \|
  " \ call ctrlp#init(0) \| :unlet g:ctrlp_default_input<CR>


" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

" Advanced customization using autoload functions
inoremap <expr> <c-x><c-k> fzf#vim#complete#word({'left': '15%'})
