set autoindent
syntax keyword GO_Bold  import
syntax keyword GO_Bold package
syntax keyword GO_Bold range

syntax keyword GO_Type int
syntax keyword GO_Type int32
syntax keyword GO_Type float64
syntax keyword GO_Type var
syntax keyword GO_Type bool
syntax keyword GO_Type string
syntax keyword GO_Type rune
syntax keyword GO_Type complex128
syntax keyword GO_Type complex64
syntax keyword GO_Type error 
syntax keyword GO_Type struct 
syntax keyword GO_Type type 
syntax keyword GO_Type const 
syntax keyword GO_Type byte 
"so many built-in types

syntax keyword GO_Control if
syntax keyword GO_Control return
syntax keyword GO_Control else
syntax keyword GO_Control for
syntax keyword GO_Control func
syntax keyword GO_Control switch
syntax keyword GO_Control select
syntax keyword GO_Control case
syntax keyword GO_Control break
syntax keyword GO_Control defer
syntax keyword GO_Control chan
syntax keyword GO_Control continue
syntax keyword GO_Control fallthrough
syntax keyword GO_Control goto
syntax keyword GO_Control go
syntax keyword GO_Control map

syntax keyword GO_Value true
syntax keyword GO_Value false

syntax keyword GO_Builtin len
syntax keyword GO_Builtin recover
syntax keyword GO_Builtin panic

syntax keyword GO_misc iota
syntax keyword GO_misc defer

syntax match GO_Comment /\/\/.*$/
syntax region GO_Comment_multi start="/\*" end="*/"


syntax region GO_String start="\"" end="\"" skip="\\\""

syntax match GO_Const /\([0-9]\+\(\.[0-9]\+\)\?\|nil\)/
syntax match GO_Ident /[_a-zA-Z][_a-zA-Z0-9]*/

hi GO_Bold ctermfg=red
hi GO_String ctermfg=DarkRed
hi GO_Const ctermfg=DarkRed
hi GO_Type ctermfg=darkgreen
hi GO_Comment ctermfg=darkblue
hi GO_Comment_multi ctermfg=darkblue
hi GO_Value ctermfg=yellow
hi GO_misc ctermfg=darkcyan
hi GO_Control ctermfg=darkyellow
hi GO_Ident ctermfg=white
hi GO_Builtin ctermfg=lightblue
