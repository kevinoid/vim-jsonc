runtime ftplugin/json.vim

if exists('b:did_ftplugin_jsonc')
  finish
else
  let b:did_ftplugin_jsonc = 1
endif

" A list of commands that undo buffer local changes made below.
let s:undo_ftplugin = []

" Set comment (formatting) related options. {{{1
setlocal commentstring=//%s comments=sO:*\ -,mO:*\ \ ,exO:*/,s1:/*,mb:*,ex:*/,://
call add(s:undo_ftplugin, 'commentstring< comments<')

" Let Vim know how to disable the plug-in.
call map(s:undo_ftplugin, "'execute ' . string(v:val)")
let b:undo_ftplugin = join(s:undo_ftplugin, ' | ')
unlet s:undo_ftplugin
