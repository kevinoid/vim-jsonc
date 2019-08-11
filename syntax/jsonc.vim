" Vim syntax file
" Language:     JSONC (JSON with Comments)
" Maintainer:   Kevin Locke <kevin@kevinlocke.name>
" Repository:   https://github.com/kevinoid/vim-jsonc
" License:      MIT
" Last Change:  2019-08-10

" Ensure syntax is loaded once, unless nested inside another (main) syntax
" For description of main_syntax, see https://stackoverflow.com/q/16164549
if !exists('g:main_syntax')
  if v:version < 600
    syntax clear
  elseif exists('b:current_syntax')
    finish
  endif
  let g:main_syntax = 'jsonc'
endif

" Based on vim-json syntax
runtime syntax/json.vim

" Remove syntax group for comments treated as errors
syn clear jsonCommentError

" Define syntax matching comments and their contents
syn keyword jsonCommentTodo  FIXME NOTE TBD TODO XXX
syn match   jsonLineComment  '\/\/.*' contains=@Spell,jsonCommentTodo
syn match   jsonCommentSkip  '^[ \t]*\*\($\|[ \t]\+\)'
syn region  jsonComment      start='/\*'  end='\*/' contains=@Spell,jsonCommentTodo

" Link comment syntax comment to highlighting
hi! def link jsonLineComment    Comment
hi! def link jsonComment        Comment

" Set/Unset syntax to avoid duplicate inclusion and correctly handle nesting
let b:current_syntax = 'jsonc'
if g:main_syntax ==# 'jsonc'
  unlet g:main_syntax
endif
