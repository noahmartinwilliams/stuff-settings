if getline(1)==""
	let header_name=bufname("%")
	let header_name=substitute(header_name, "/", "_", "")
	let header_name=substitute(header_name, "\\.", "_", "")
	let header_name=substitute(header_name, "include_", "", "")
	let header_name=toupper(header_name)
	0put = '#ifndef __'.header_name.'__'
	put = '#define __'.header_name.'__'
	put = ''
	put = ''
	put = '#endif'
	call feedkeys("Gdd")
endif
set autoindent
set nu
