set autoindent
map <buffer> <F7> <esc> :!man <space>
map <buffer> /* i/*<space><space>*/<left><left><left>
set foldmethod=manual
set nu
so ~/.vim/DateStamp.vim

function! UpdateHeader(head)
	let file_c_name=expand('%:t')
	let file_h_name=system("echo include/$(basename ".file_c_name." .c).h")
	echo filereadable(file_h_name)
	if !filereadable(file_h_name)
		let header=file_h_name
		if system("sed -n '$p' ".header)=="#endif\n"
			exec "silent !sed -i '$d' ".header
			let modified_name=substitute(a:head, "=[^,;]*", "", "g")
			let modified_name=substitute(modified_name, ";", "", "g")
			exec "!echo \"extern ".modified_name.";\" >>".header
			exec "!echo \"\\#endif\" >>".header
		else
			let header_intern_name=toupper(system("basename ".header))
			let header_intern_name=substitute(header_intern_name, "\\.", "_", "g")
			let header_intern_name=substitute(header_intern_name, "\\n", "", "g")
			exec "!echo \"\\#ifndef __".header_intern_name."__\" >".header 
			exec "!echo -e \"\\#define __".header_intern_name."__\\n\\n\" >>".header
			let modified_name=substitute(a:head, "=[^,;]*", "", "g")
			let modified_name=substitute(modified_name, ";", "", "g")
			exec "!echo -e \"extern ".modified_name.";\\n\\n\" >>".header
			exec '!echo \\#endif >>'.header
		endif
	else
		echo "Header file not found"
	endif
endfunction

map <F9> :call<space>UpdateHeader(getline("."))<enter>
