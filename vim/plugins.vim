if exists('*minpac#init')
  " minpac is loaded.
  call minpac#init()
  call minpac#add('k-takata/minpac', {'type': 'opt'})

  " Additional plugins here.
  call minpac#add('tpope/vim-surround')
  call minpac#add('tpope/vim-commentary')
  call minpac#add('tpope/vim-unimpaired')

  call minpac#add('junegunn/fzf')
  call minpac#add('junegunn/fzf.vim')
endif

" Plugin settings here.

" Define user commands for updating/cleaning the plugins.
" Each of them loads minpac, reloads .vimrc to register the
" information of plugins, then performs the task.

command! PackUpdate packadd minpac | source $VIMCONFIG/init.vim | call minpac#update('', {'do': 'call minpac#status()'})
command! PackClean  packadd minpac | source $VIMCONFIG/init.vim | call minpac#clean()
command! PackStatus packadd minpac | source $VIMCONFIG/init.vim | call minpac#status()
