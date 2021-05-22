fun! ReloadAlpha()
    lua for k in pairs(package.loaded) do if k:match("my-plugin") then package.loaded[k] = nil end end
    lua require("my-plugin").XXX()
endfun

augroup AlphaCmdGroup
    autocmd!
augroup END
