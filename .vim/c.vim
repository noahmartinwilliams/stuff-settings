set autoindent
map <buffer> <F7> <esc> :!man <space>
map <buffer> /* i/*<space><space>*/<left><left><left>
set foldmethod=manual
set nu


function! UpdateHeader(header, head)
	exec "!sed -i '$d' ".a:header
	call feedkeys("<enter>")
	exec "!echo \"extern ".a:head.";\" >>".a:header
	call feedkeys("<enter>")
	exec '!echo "\#endif" >>'.a:header
	call feedkeys("<enter>")
endfunction

map <F9> :call<space>UpdateHeader(input("input<space>header<space>path<space>and<space>name:<space>"),<space>getline("."))<enter>
