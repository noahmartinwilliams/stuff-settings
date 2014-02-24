function! SetExecutableBit()
	let fname=expand("%:p")
	set autoread
	set eventignore="FileChangedShell"
	execute "silent !chmod a+x ".fname
	set noautoread
	set eventignore=""
endfunction
