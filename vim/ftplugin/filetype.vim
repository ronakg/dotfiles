" IAR option files for compiler/linker
" c/cpp in any file containing c/cpp comment in line 1 or 2
if ((getline(1) =~ '\/\*') || (getline(1)=~ '\/\/') || (getline(2) =~ '\/\*') || (getline(2)=~ '\/\/'))
  set ft=c
endif
