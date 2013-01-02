set number
set cc=80
hi ColorColumn ctermbg=black

nnoremap <C-N> :tabn<Enter>
nnoremap <C-P> :tabp<Enter>

filetype plugin on
set grepprg=grep\ -nH\ $*


" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'
