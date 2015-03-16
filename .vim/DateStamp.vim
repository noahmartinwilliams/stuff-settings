function! DateStamp()
	let line=getline(1)
	let lines=matchstr(line, '^//date.*')
	if lines==''
		let curpos=getpos('.')
		let date=system("echo -n '//date: '; date")
		call append(0, date)
		call feedkeys("gg$x")
		call setpos('.', curpos)
	else
		let curpos=getpos('.')
		let date=system("echo -n '//date: '; date")
		call append(0, date)
		call feedkeys("gg$x")
		call feedkeys("ggjdd")
		call setpos('.', curpos)
	endif
endfunction
