if exists('g:loaded_alpha') | finish | endif 

let s:save_cpo = &cpo 
set cpo&vim          

" command to run our plugin
command! AlphaHelloWorld lua require("hello").sayHelloWorld()

" expose vim commands and interface here
" nnoremap <Plug>PlugCommand :lua require(...).plug_command()<CR>

let &cpo = s:save_cpo 
unlet s:save_cpo

let g:loaded_alpha = 1
