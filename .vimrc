so ~/.vim/mod.vim

map <F9> :mksession<space>
map <F5> :wall<enter>
map <F4> <esc> :sh <enter>
map <C-q> <C-a> "	Guake on my config launches a new tab when I hit ctrl+a (this way guake acts more like screen, so I've got one less keyboard shortcut to memorize) 
map W <c-w>w
set encoding=utf-8
set backupcopy=auto
syntax on
set wildmode=longest
set wildmenu

set softtabstop=8
set shiftwidth=8
"set errorbells
set splitright
set autoindent
set smarttab

autocmd BufNewFile,BufRead *.h so ~/.vim/header.vim
autocmd BufRead,BufNewFile *.clj set filetype=clojure
autocmd BufRead,BufNewFile *.m set filetype=octave
autocmd filetype octave so ~/.vim/octave.vim
autocmd filetype c so ~/.vim/c.vim
autocmd filetype shell so ~/.vim/sh.vim
autocmd filetype text so ~/.vim/txt.vim
autocmd filetype make so ~/.vim/make.vim
autocmd filetype python so ~/.vim/python.vim
autocmd filetype assembly so ~/.vim/assembly.vim
autocmd filetype LaTeX so ~/.vim/latex.vim
autocmd filetype clojure so ~/.vim/clojure.vim
autocmd filetype haskell execute "setlocal expandtab shiftwidth=4 softtabstop=0 tabstop=4"

autocmd BufNewFile * let fname=expand("%:p")
autocmd BufNewFile *.m execute "autocmd BufWritePost ".fname." call SetExecutableBit()"
autocmd BufNewFile *.sh execute "autocmd BufWritePost ".fname." call SetExecutableBit()"
autocmd BufNewFile *.rb execute "autocmd BufWritePost ".fname." call SetExecutableBit()"
autocmd BufNewFile *.py execute "autocmd BufWritePost ".fname." call SetExecutableBit()"
autocmd BufNewFile *.clj execute "autocmd BufWritePost ".fname." call SetExecutableBit()"
autocmd BufNewFile *.hs execute "setlocal expandtab shiftwidth=4 softtabstop=0 tabstop=4"
autocmd BufNewFile *.pl execute "autocmd BufWritePost ".fname." call SetExecutableBit()"

autocmd BufNewFile *.m 0put = '#! /usr/bin/octave -q'
autocmd BufNewFile *.py 0put = '#! /usr/bin/python'
autocmd BufNewFile *.sh 0put = '#! /bin/bash'
autocmd BufNewFile *.pl 0put = '#! /usr/bin/swipl -q'
autocmd BufNewFile *.sh set autoindent
autocmd BufNewFile *.rb 0put = '#! /usr/bin/ruby'
autocmd BufNewFile,BufRead *.scala so ~/.vim/scala.vim


nmap <C-S-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
	if !exists("*synstack")
		return
	endif
	echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc
