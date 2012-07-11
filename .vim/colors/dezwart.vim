" local syntax file - set colors on a per-machine basis:
" vim: tw=0 ts=4 sw=4
" Vim color file
" Maintainer:   Pete de Zwart <dezwart@gmail.org>
" Last Change:  2012-07-11

hi clear
set background=dark
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "dezwart"

hi Directory      ctermfg=yellow ctermbg=red
hi ErrorMsg       ctermfg=yellow ctermbg=red
hi ModeMsg        ctermfg=yellow ctermbg=red
hi Question       ctermfg=yellow ctermbg=red
hi Title          ctermfg=yellow ctermbg=red
hi WarningMsg     ctermfg=yellow ctermbg=red

hi LineNr         ctermfg=cyan ctermbg=blue
hi Search         ctermfg=NONE ctermbg=red
hi StatusLine     ctermfg=blue ctermbg=white
hi StatusLineNC   ctermfg=NONE ctermbg=blue
hi Comment        ctermfg=NONE ctermbg=blue

hi Special        cterm=none
hi Visual         cterm=reverse

hi NonText        ctermfg=blue
hi Constant       ctermfg=magenta
hi Identifier     ctermfg=cyan
hi Statement      ctermfg=yellow
hi PreProc        ctermfg=red
hi Type           ctermfg=green
hi Error          ctermfg=black ctermbg=cyan
hi Todo           ctermfg=black ctermbg=red
hi SpecialKey     ctermfg=red ctermbg=blue

hi CursorLine    cterm=underline
hi CursorColumn   cterm=underline
hi ColorColumn    ctermbg=blue

hi MatchParen     ctermbg=yellow ctermfg=black
hi TabLine        ctermfg=lightblue ctermbg=white
hi TabLineFill    ctermfg=lightblue ctermbg=white
hi TabLineSel     term=reverse  ctermfg=white ctermbg=lightblue

hi link IncSearch       Visual
hi link String          Constant
hi link Character       Constant
hi link Number          Constant
hi link Boolean         Constant
hi link Float           Number
hi link Function        Identifier
hi link Conditional     Statement
hi link Repeat          Statement
hi link Label           Statement
hi link Operator        Statement
hi link Keyword         Statement
hi link Exception       Statement
hi link Include         PreProc
hi link Define          PreProc
hi link Macro           PreProc
hi link PreCondit       PreProc
hi link StorageClass    Type
hi link Structure       Type
hi link Typedef         Type
hi link Tag             Special
hi link SpecialChar     Special
hi link Delimiter       Special
hi link SpecialComment  Special
hi link Debug           Special
