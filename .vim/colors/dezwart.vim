" local syntax file - set colors on a per-machine basis:
" vim: tw=0 ts=4 sw=4
" Vim color file
" Maintainer:   Pete de Zwart <dezwart@gmail.org>
" Last Change:  2012 Feb 14

hi clear
set background=dark
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "dezwart"
hi SpecialKey     ctermfg=darkred
hi NonText        ctermfg=darkred
hi Directory      ctermfg=brown
hi ErrorMsg       ctermfg=grey  ctermbg=red
hi Search         ctermfg=white  ctermbg=red
hi MoreMsg        ctermfg=darkgreen
hi ModeMsg        cterm=reverse
hi LineNr         ctermfg=darkred
hi Question       ctermfg=darkgreen
hi StatusLine     ctermfg=lightblue ctermbg=white
hi StatusLineNC   ctermfg=white ctermbg=lightblue
hi Title          ctermfg=darkmagenta
hi Visual         cterm=reverse
hi WarningMsg     ctermfg=darkred
hi Comment        cterm=NONE ctermfg=NONE ctermbg=blue
hi Constant       ctermfg=darkmagenta
hi Special        ctermfg=yellow
hi Identifier     ctermfg=darkcyan
hi Statement      ctermfg=darkyellow
hi PreProc        ctermfg=darkgreen
hi Type           cterm=underline ctermfg=darkgreen
hi Error          ctermfg=darkcyan  ctermbg=black
hi Todo           ctermfg=black  ctermbg=darkcyan
hi CursorLine     cterm=underline
hi CursorColumn   cterm=underline
hi MatchParen     ctermbg=darkgreen ctermfg=black
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
