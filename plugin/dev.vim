function! ReloadAlpha()
lua << EOF
    for k in pairs(package.loaded) do 
        if k:match("^hello") then
            package.loaded[k] = nil
        end
    end
EOF
endfunction

nnoremap <Leader>pra :call ReloadAlpha()<CR>
