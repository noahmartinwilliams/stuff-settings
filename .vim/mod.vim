function! SetExecutableBit()
	let fname=expand("%:p")
	set autoread
	execute "!chmod a+x ".fname
endfunction
