syn keyword OctFlowControl if
syn keyword OctFlowControl else
syn keyword OctFlowControl elseif
syn keyword OctFlowControl end
syn keyword OctFlowControl while
syn keyword OctFlowControl endwhile
syn keyword OctFlowControl for
syn keyword OctStruct struct
syn keyword OctFunction function nextgroup=OctReturnVarName skipwhite
syn keyword octTodo contained XXX TODO NB FIXME WARN

syn cluster texCommentGroup add=octTodo
syn cluster OctCommentGroup contains=octTodo
syn keyword OctMatGenBuiltInFunc zeros
syn keyword OctMatGeneralBuiltInFunc sum nextgroup=OctInParan
syn keyword OctMatGetPropsBuiltInFunc size

syn cluster OctBuiltInFunc contains=OctMatGenBuiltInFunc,OctMatGetPropsBuiltInFunc,OctMatGeneralBuiltInFunc,OctBuiltInProbFunc

syn keyword OctBuiltInPlotFunc xlabel
syn keyword OctBuiltInPlotFunc ylabel
syn keyword OctBuiltInPlotFunc title
syn keyword OctBuiltInPlotFunc legend
syn keyword OctBuiltInPlotFunc plot
syn keyword OctBuiltInPlotFunc waitfor
syn keyword OctBuiltInPlotFunc figure

syn keyword OctBuiltInProbFunc error
syn keyword OctBuiltInProbFunc warning

hi OctBuiltInProbFunc cterm=underline ctermfg=red ctermbg=green


syn match OctReturnVarName /[A-Z][_a-zA-Z0-9]*/
syn match OctAt /@/
syn match OctEq /[=<]/
syn match OctNumber /\([0-9]*\.[0-9]*\|[0-9]*\)/
syn match OctPeriod /\./
syn match OctCondOp /&&/
syn match OctCondOp /||/
syn match OctPerElemOp /\(\.\*\|\.\/\)/
syn match OctVariable /[_a-zA-Z][_a-zA-Z0-9]*/ nextgroup=OctSingleQuote,OctInParan
hi OctPerElemOp cterm=italic ctermfg=green ctermbg=magenta

hi OctPeriod cterm=bold ctermfg=magenta ctermbg=cyan

syn match OctEscapes /\\n/
syn match OctAnonVar /_/
syn match OctComma /,/
syn match OctSemiColon /;/
syn match OctColon /:/

syn region OctShebang start="#!" end="\n"
syn region OctComment start="%" end="\n" contains=octTodo
syn region OctString start="'" end="'" skip="\\'" contains=OctEscapes contained
syn region OctString start="\"" end="\"" skip="\\\"" contains=OctEscapes contained
syn cluster OctExpression contains=OctCondOp,OctAnonVar,OctVariable,OctNumber,OctString,OctBuiltInFunc,@OctInParan
syn region OctMatrix start="\[" end="\]" contains=@OctExpression,OctComma,OctSemiColon,OctSet,OctInParan,OctEq,OctAt,OctCondOp
syn region OctSet start="{" end="}" contains=@OctExpression,OctComma,OctSemiColon,OctInParan,OctEq,OctAt,OctCondOp,OctColon
syn region OctInParan start="(" end=")" nextgroup=OctSingleQuote contains=@OctExpression,OctComma,OctSemiColon,OctEq,OctAt,OctCondOp,OctSet,@OctBuiltInFunc
syn match OctSingleQuote /'/

syn keyword OctCommand hold
syn keyword OctCommand grid

syn keyword OctCommandArg on

hi OctBuiltInPlotFunc term=bold ctermfg=magenta
hi OctFlowControl term=NONE ctermfg=lightyellow
hi OctCommand term=NONE ctermfg=yellow
hi OctVariable term=NONE ctermfg=NONE

hi OctMatrix term=NONE ctermfg=cyan
hi OctAnonVar term=NONE ctermfg=DarkRed
hi OctComma term=NONE ctermfg=NONE
hi OctSemiColon term=NONE ctermfg=lightgreen
hi OctColon term=NONE ctermfg=LightGray
hi OctComment term=NONE ctermfg=darkblue
hi OctShebang term=NONE ctermfg=darkgreen
hi OctNumber term=NONE ctermfg=blue
hi OctSet term=NONE ctermbg=darkred ctermfg=darkblue
hi OctInParan term=NONE
hi OctEq term=bold ctermfg=NONE
hi OctAt ctermfg=darkcyan
hi OctStruct ctermfg=green
hi OctCondOp ctermfg=yellow
hi OctSingleQuote cterm=bold ctermfg=magenta 
hi OctFunction ctermfg=cyan term=NONE
hi OctReturnVarName ctermfg=cyan cterm=italic
hi OctMatGenBuiltInFunc cterm=bold ctermfg=blue
hi OctMatGetPropsBuiltInFunc cterm=underline ctermfg=green ctermbg=blue
hi OctMatGeneralBuiltInFunc cterm=undercurl ctermfg=blue ctermbg=red
hi def link octTodo Todo

hi OctCommandArg term=NONE ctermfg=darkblue
hi OctString term=NONE ctermfg=red
hi OctEscapes term=NONE ctermfg=lightblue
