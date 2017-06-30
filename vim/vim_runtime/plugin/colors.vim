"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable 

" Enable 256 colors palette in Gnome Terminal
if $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif

" Colorscheme
set background=dark
colorscheme peaksea

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions-=e
    set t_Co=256
    set guitablabel=%M\ %t
endif

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Set GitGutter colors, TODO move to peaksea.vim
let g:gitgutter_override_sign_column_highlight = 0
hi SignColumn ctermbg=235
hi GitGutterAdd ctermfg=84 ctermbg=235
hi GitGutterChange ctermfg=186 ctermbg=235
hi GitGutterChangeDelete ctermfg=186 ctermbg=235
hi GitGutterDelete ctermfg=209 ctermbg=235
hi LineNr ctermbg=235

" Set all cols after 80 to darker color
let &colorcolumn=join(range(81,999),",")
hi ColorColumn ctermbg=233

hi FoldColumn	ctermfg=DarkGrey ctermbg=235 cterm=NONE


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Formatting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set text shown when folded
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


set fillchars+=vert:│
