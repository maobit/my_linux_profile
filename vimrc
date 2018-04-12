
set t_Co=256   " This is very important to make the colorscheme function properly
"colorscheme lucius

set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}  " Set status line  
set laststatus=2
set mouse=a		" enable mouse
set nu			" Show line number
set syntax=on
set cursorline
filetype on
set cmdheight=1
set ts=4
"set nowrap
set formatoptions=tcrqn
set autoindent
set confirm
"filetype indent on

highlight StatusLine guifg=SlateBlue guibg=Yellow 
highlight StatusLineNC guifg=Gray guibg=White

set mouse=a 
set selection=exclusive 
set selectmode=mouse,key

" Function to add head file automatically
autocmd BufNewFile *.pl,*.cpp,*.[ch],*.sh,*.java exec ":call SetTitle()" 
func SetTitle() 
	if &filetype == 'sh' 
		call setline(1,          "\#==================================================================") 
		call append(line("."),   "\# File Name:    ".expand("%")) 
		call append(line(".")+1, "\# Author:       Qiang He") 
		call append(line(".")+2, "\# mail:         qheuestc@gmail.com") 
		call append(line(".")+3, "\# Created Time: ".strftime("20%y-%m-%d %H:%M:%S")) 
		call append(line(".")+4, "\#==================================================================") 
		call append(line(".")+5, "\#!/bin/bash") 
		call append(line(".")+6, "")
	endif
	if &filetype == 'cpp' || &filetype == 'c'
		call setline(1, "/*************************************************************************") 
		call append(line("."), "	> File Name:    ".expand("%")) 
		call append(line(".")+1, "	> Author:       Qiang He") 
		call append(line(".")+2, "	> Mail:       	qheuestc@gmail.com ") 
		call append(line(".")+3, "    > Created Time: ".strftime("20%y-%m-%d %H:%M:%S")) 
		""call append(line(".")+3, "	> Created Time: ".strftime("%c")) 
		call append(line(".")+4, " ************************************************************************/") 
		call append(line(".")+5, "")
	endif
	if &filetype == 'perl'
		""call setline(1,          "\#=====================================================================")
		""call append(line("."),   "\# File Name:    ".expand("%"))
		""call append(line(".")+1, "\# Author:       Qiang He")
		""call append(line(".")+2, "\# Mail:         heqiang@genomic.cn")
		""call append(line(".")+3, "\# Created Time: ".strftime("%c"))
		""call append(line(".")+4, "\#=====================================================================")
		""call append(line(".")+5, "\#!/usr/bin/perl -w")
		""call append(line(".")+6, "use strict;")
		""call append(line(".")+7, "")
		""call append(line(".")+8, "\=cut")
			
		call setline(1,           "\#!/usr/bin/perl -w")
		call append(line("."),    "use strict;")
		call append(line(".")+1,  "use Getopt::Long;")
		call append(line(".")+2,  "use File::Basename qw(basename dirname);")
		call append(line(".")+3,  "use Cwd 'abs_path';")
		call append(line(".")+4,  "use Encode;")
		call append(line(".")+5,  "use JSON;")
		call append(line(".")+6,  "")
		call append(line(".")+7,  "\=head1 Name")
		call append(line(".")+8,  "")
		call append(line(".")+9,  " ".expand("%"))
		call append(line(".")+10, "")
		call append(line(".")+11, "\=head1 Description")
		call append(line(".")+12, "")
		call append(line(".")+13, "")
		call append(line(".")+14, "\=head1 Author")
		call append(line(".")+15, "")
		call append(line(".")+16, " Qiang He\tqhe@gmail.com")
		""call append(line(".")+14, "")
		call append(line(".")+17, " Version-1.0\t".strftime("20%y-%m-%d %H:%M:%S"))
		call append(line(".")+18, "")
		call append(line(".")+19, "\=head1 Usage")
		call append(line(".")+20, "")
		call append(line(".")+21, " perl ".expand("%"))
		call append(line(".")+22, "")
		call append(line(".")+23, "\=cut")
		call append(line(".")+24, "")		
		
	endif
	if &filetype == 'cpp'
		call append(line(".")+6, "#include <iostream>")
		call append(line(".")+7, "#include <string>")
		call append(line(".")+8, "using namespace std;")
		call append(line(".")+9, "")
	endif
	if &filetype == 'c'
		call append(line(".")+6, "#include <stdio.h>")
		call append(line(".")+7, "")
	endif
	autocmd BufNewFile * normal G
endfunc 

" Create executable files 

function! MySetExecutableIfScript(line1, current_file)
	if a:line1 =~ '^#!\(/usr\)*/bin/'
		let chmod_command = "silent !chmod ugo+x " . a:current_file
		execute chmod_command
	endif
endfunction
autocmd BufWritePost * call MySetExecutableIfScript(getline(1), expand("%p"))

"
" automatically give executable permissions if file begins with #! and contains
" '/bin/' in the path
"
"au BufWritePost * if getline(1) =~ "^#!" | if getline(1) =~ "/bin/" | silent !chmod a+x <afile> | endif | endif

