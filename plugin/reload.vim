function! Reload() abort
    lua for k in pairs(package.loaded) do if k:match("^alpha") then package.loaded[k] = nil end end
    lua require("alpha")
endfunction

" Reload the plugin
nnoremap <Leader>prr :call Reload()<CR>
