function! Reload(module_name) abort
" lua << EOF
"     for k in pairs(package.loaded) do 
"         if k:match("^alpha") then
"             package.loaded[k] = nil
"         end
"     end
" EOF
    let b:module_name = a:module_name
    lua for k in pairs(package.loaded) do if k:match("^" .. vim.b.module_name) then package.loaded[k] = nil end end
    lua require("alpha")
endfunction

augroup AlphaAuGrp
    autocmd!
    " autocmd VimResized * :lua require("alpha.utils").onResize()
augroup END


" Reload the plugin
nnoremap <Leader>prr :call Reload("alpha") <bar> lua require("alpha.vimspector").generateDebugProfile() <CR>
nnoremap <Leader>prt :Luapad<CR>
nnoremap <Leader>pre :LuaRun<CR>
nnoremap <Leader>prs :source %<CR>
nnoremap <Leader>prl :luafile %<CR>
nnoremap <Leader>prm :messages<CR>
