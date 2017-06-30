" Use pathogen to load all plugins from bundle/
call pathogen#infect(my_runtimepath . '/bundle/{}')
call pathogen#helptags()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => gitgutter
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set gitgutter signs
let g:gitgutter_sign_added = '⠀│'
let g:gitgutter_sign_modified = '⠀┊'
let g:gitgutter_sign_removed = '▁▁'
" let g:gitgutter_sign_removed = '﹍'
" let g:gitgutter_sign_removed = '……'
let g:gitgutter_sign_removed_first_line = '▔▔'
" let g:gitgutter_sign_removed_first_line = '﹉'
let g:gitgutter_sign_modified_removed = '⠀┤'


" => vim-commentary
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set comments to use //
autocmd FileType c,cpp,java setlocal commentstring=//\ %s


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => lightline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c

" Get rid of bottom status line
set noshowmode

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ ['mode', 'paste'],
      \             ['fugitive', 'readonly', 'filename', 'modified'] ],
      \   'right': [ [ 'lineinfo' ], ['percent'] ]
      \ },
      \ 'component': {
      \   'readonly': '%{&filetype=="help"?"":&readonly?"✖":""}',
      \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
      \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
      \ },
      \ 'component_visible_condition': {
      \   'readonly': '(&filetype!="help"&& &readonly)',
      \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
      \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
      \ },
      \ 'separator': { 'left': ' ', 'right': ' ' },
      \ 'subseparator': { 'left': ' ', 'right': ' ' }
      \ }


" let g:lightline = {
"       \ 'colorscheme': 'wombat',
"       \ 'active': {
"       \   'left': [ [ 'mode', 'paste' ],
"       \             [ 'readonly', 'filename', 'modified', 'helloworld' ] ]
"       \ },
"       \ 'component': {
"       \   'helloworld': 'Hello World!'
"       \ },
"       \ }


" let g:clang_library_path='/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/'
