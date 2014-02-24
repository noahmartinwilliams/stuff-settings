so ~/.vim/mod.vim

map <F4> <esc> :sh <enter>
map W <c-w>w
set encoding=utf-8

set softtabstop=8
set shiftwidth=8
"set errorbells
set splitright
set autoindent

so ~/.vim/fugitive.vim

autocmd BufNewFile,BufRead *.h so ~/.vim/header.vim
autocmd BufRead,BufNewFile *.clj set filetype=clojure
autocmd filetype c so ~/.vim/c.vim
autocmd filetype shell so ~/.vim/sh.vim
autocmd filetype text so ~/.vim/txt.vim
autocmd filetype make so ~/.vim/make.vim
autocmd filetype python so ~/.vim/python.vim
autocmd filetype perl so ~/.vim/perl.vim
autocmd filetype assembly so ~/.vim/assembly.vim
autocmd filetype LaTeX so ~/.vim/latex.vim
autocmd filetype clojure so ~/.vim/clojure.vim
autocmd BufNewFile,BufRead *.go so ~/.vim/go.vim

autocmd BufNewFile * let fname=expand("%:p")
autocmd BufNewFile *.sh execute "autocmd BufWritePost ".fname." call SetExecutableBit()"
autocmd BufNewFile *.rb execute "autocmd BufWritePost ".fname." call SetExecutableBit()"
autocmd BufNewFile *.py execute "autocmd BufWritePost ".fname." call SetExecutableBit()"
autocmd BufNewFile *.clj execute "autocmd BufWritePost ".fname." call SetExecutableBit()"
autocmd BufNewFile *.pl execute "autocmd BufWritePost ".fname." call SetExecutableBit()"

autocmd BufNewFile *.py 0put = '#! /usr/bin/python'
autocmd BufNewFile *.sh 0put = '#! /bin/bash'
autocmd BufNewFile *.sh set autoindent
autocmd BufNewFile *.rb 0put = '#! /usr/bin/ruby'


nmap <C-S-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
	if !exists("*synstack")
		return
	endif
	echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc
