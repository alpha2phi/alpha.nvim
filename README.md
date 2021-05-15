# neovim-plugin-starter
Neovim plugin template


```bash
nvim --cmd "set rtp+=$(pwd)" .

``

fun! MyPlugin()
    lua for k in pairs(package.loaded) do if k:match("my-plugin") then package.loaded[k] = nil end end
    lua require("my-plugin").XXX()
endfun

augroup MyPlugin
    autocmd!
augroup END
