set runtimepath^=~/.mynvim runtimepath+=~/.mynvim/after
let &packpath = &runtimepath

"---- vim-plug setup  ----
let vimplug_exists=expand('~/.config/nvim/autoload/plug.vim')

if has('win32')&&!has('win64')
  let curl_exists=expand('C:\Windows\Sysnative\curl.exe')
else
  let curl_exists=expand('curl')
endif

if !filereadable(vimplug_exists)
  if !executable(curl_exists)
    echoerr "You have to install curl or first install vim-plug yourself!"
    execute "q!"
  endif
  echo "Installing Vim-Plug..."
  echo ""
  silent exec "!"curl_exists" -fLo " . shellescape(vimplug_exists) . " --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
  let g:not_finish_vimplug = "yes"

  autocmd VimEnter * PlugInstall
endif
"-------- end vim-plug setup ----

set nocompatible

call plug#begin('~/.mynvim/plugged')

Plug 'tpope/vim-sensible'

" Local plugins
" Plug '~/workspace/development/alpha2phi/alpha.nvim'

" Plugin testing - install from Github
Plug 'alpha2phi/alpha.nvim'

call plug#end()
