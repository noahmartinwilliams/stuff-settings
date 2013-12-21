set autoindent
map <F6> :w<enter> :!clojure %<enter>
syntax region CljVector start="\[" end="\]" contains=ALL
syntax region CljList start="'(" end=")" 
syntax region CljString start="\"" end="\"" skip="\\\"" contained
syntax region CljMetaData start="#^{" end="}" contains=CljString,CljMetaTag

syntax keyword CljFunRed reverse 

syntax keyword CljMacro defn 
syntax keyword CljMacro defstruct 
syntax keyword CljMacro and 
syntax keyword CljMacro def  
syntax keyword CljMacro while 
syntax keyword CljMacro dec 
syntax keyword CljMacro inc 
syntax keyword CljMacro assert 
syntax keyword CljMacro ns 
syntax keyword CljMacro comment 

syntax keyword CljFunGreen count 

syntax keyword CljFunDarkBlue cons 
syntax keyword CljFunDarkBlue cond 
syntax keyword CljMetaTag doc 
syntax keyword CljMetaTag test 

syntax keyword CljSpecialForm if
syntax keyword CljSpecialForm catch
syntax keyword CljSpecialForm throw
syntax keyword CljSpecialForm try
syntax keyword CljSpecialForm finally


hi CljVector ctermfg=red
hi CljList ctermfg=darkblue
hi CljMacro ctermfg=yellow
hi CljFunGreen ctermfg=green
hi CljFunDarkBlue ctermfg=darkblue
hi CljFunRed ctermfg=red
hi CljMetaTag ctermfg=darkblue
hi CljString ctermfg=red
hi CljMetaData ctermfg=darkgreen
hi CljSpecialForm ctermfg=yellow

function TestFunction (doc, name, args)
	put = '(defn #^{'
	put = ':doc '.doc
	put = ':test (fn []'
	put = '(assert (= (name )))' 
	put = ')}'
	put = name.'['.args.'])'
endfunction
