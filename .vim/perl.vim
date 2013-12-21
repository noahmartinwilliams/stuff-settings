if getline(1)==""
	0put = '#! /usr/bin/perl -w'
endif
set autoindent
set nu
map J bhvleyoprint<space>"<esc>pa\n";<esc>
map H iprint<space>"here\n";<esc>
