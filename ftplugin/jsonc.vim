runtime ftplugin/json.vim

if exists('b:did_ftplugin_jsonc')
  finish
else
  let b:did_ftplugin_jsonc = 1
endif

" Set comment (formatting) related options.
setlocal commentstring=//%s comments=sO:*\ -,mO:*\ \ ,exO:*/,s1:/*,mb:*,ex:*/,://

" Let Vim know how to disable the plug-in.
let b:undo_ftplugin = 'setlocal commentstring< comments<'
