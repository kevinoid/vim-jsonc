" Author: Kevin Locke <kevin@kevinlocke.name>
" Description: jsonlint for JSON with comments
"
" Combines jsonlint with strip-json-comments for linting,
" necessary until/unless https://github.com/zaach/jsonlint/issues/50 is fixed.
"
" Based on ale_linters/json/jsonlint.vim by KabbAmine <amine.kabb@gmail.com>
" and David Sierra <https://github.com/davidsierradz>

call ale#Set('jsonc_jsonlint_executable', 'jsonlint')
call ale#Set('jsonc_jsonlint_options', '')
call ale#Set('jsonc_jsonlint_use_global', get(g:, 'ale_use_global_executables', 0))
call ale#Set('jsonc_sjc_executable', 'strip-json-comments')
call ale#Set('jsonc_sjc_use_global', get(g:, 'ale_use_global_executables', 0))

function! ale_linters#jsonc#jsonlint#GetJsonlintExecutable(buffer) abort
    return ale#node#FindExecutable(a:buffer, 'jsonc_jsonlint', [
    \   'node_modules/.bin/jsonlint',
    \   'node_modules/jsonlint/lib/cli.js',
    \])
endfunction

function! ale_linters#jsonc#jsonlint#GetSjcExecutable(buffer) abort
    return ale#node#FindExecutable(a:buffer, 'jsonc_sjc', [
    \   'node_modules/.bin/strip-json-comments',
    \   'node_modules/strip-json-comments-cli/cli.js',
    \])
endfunction

" Returns non-empty string if all executables are available (used to
" enable/disable this linter based on requisite command availability).
" Since %e is not used in command string, returned path doesn't matter.
function! ale_linters#jsonc#jsonlint#GetExecutable(buffer) abort
    if empty(ale_linters#jsonc#jsonlint#GetSjcExecutable(a:buffer))
        return ''
    endif

    return ale_linters#jsonc#jsonlint#GetJsonlintExecutable(a:buffer)
endfunction

function! ale_linters#jsonc#jsonlint#GetCommand(buffer) abort
    let l:sjc_exe = ale_linters#jsonc#jsonlint#GetSjcExecutable(a:buffer)
    let l:jsonlint_exe = ale_linters#jsonc#jsonlint#GetJsonlintExecutable(a:buffer)

    " Note: Need %t so that ALE doesn't redirect stdin of jsonlint after pipe
    return ale#node#Executable(a:buffer, l:sjc_exe)
    \   . ' %t | '
    \   . ale#node#Executable(a:buffer, l:jsonlint_exe)
    \   . ale#Pad(ale#Var(a:buffer, 'jsonc_jsonlint_options'))
    \   . ' --compact -'
endfunction

" FIXME: Copy of ale_linters#json#jsonlint#Handle
"        Is there a non-hacky way to reference it without duplication?
function! ale_linters#jsonc#jsonlint#Handle(_buffer, lines) abort
    " Matches patterns like the following:
    " line 2, col 15, found: 'STRING' - expected: 'EOF', '}', ',', ']'.
    let l:pattern = '^line \(\d\+\), col \(\d*\), \(.\+\)$'
    let l:output = []

    for l:match in ale#util#GetMatches(a:lines, l:pattern)
        call add(l:output, {
        \   'lnum': l:match[1] + 0,
        \   'col': l:match[2] + 0,
        \   'text': l:match[3],
        \})
    endfor

    return l:output
endfunction

call ale#linter#Define('jsonc', {
\   'name': 'jsonlint',
\   'executable': function('ale_linters#jsonc#jsonlint#GetExecutable'),
\   'output_stream': 'stderr',
\   'command': function('ale_linters#jsonc#jsonlint#GetCommand'),
\   'callback': 'ale_linters#jsonc#jsonlint#Handle',
\})
