if has('vim_starting')
  set nocompatible
endif

" Check for 'curl' binary
if !executable("curl")
  echoerr "You have to install curl!"
  execute "q!"
endif

" Install vim-plug
let vimplug_file=expand('~/.vim/autoload/plug.vim')

if !filereadable(vimplug_file)
  echo "Installing vim-plug..."
  echo ""
  silent execute '!\curl -fLso ' . vimplug_file . ' --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

  autocmd VimEnter * PlugInstall
endif

" Download VimUR scripts
let vimur_dir = expand('~/.vim/vimur/')
if !isdirectory(vimur_dir)
  let vimur_list = "https://raw.githubusercontent.com/Misenko/vimur/master/vimur.list"
  let vimur_list_tmp = '/tmp/vimur.list.' . system('head /dev/urandom | tr -dc A-Za-z0-9 | head -c 5 ; echo -n ""')

  silent execute '!\curl -fLso ' . ' ' . vimur_list_tmp . ' ' . vimur_list
  let lines = readfile(vimur_list_tmp)

  silent execute '! mkdir -p ' . vimur_dir
  for line in lines
    silent execute '! \cd ' . vimur_dir . ' ; curl -fLsO ' . ' ' . line
  endfor
  silent execute '! \rm ' . vimur_list_tmp
endif

let scripts = split(globpath(vimur_dir, '*.vim'), '\n')
for script in scripts
  execute 'source ' . script
endfor
