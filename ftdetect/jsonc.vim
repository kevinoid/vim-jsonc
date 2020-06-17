augroup jsoncFtdetect
    " Recognize some extensions known to have JSON with comments
    " Note: If conflicts are found, please report them.

    " https://github.com/mohae/cjson
    autocmd BufNewFile,BufRead *.cjsn setfiletype jsonc
    " https://github.com/mohae/cjson
    autocmd BufNewFile,BufRead *.cjson setfiletype jsonc
    " https://github.com/Microsoft/vscode/issues/48969
    " https://komkom.github.io/
    " https://github.com/mochajs/mocha/issues/3753
    autocmd BufNewFile,BufRead *.jsonc setfiletype jsonc

    " Recognize some files known to support JSON with comments
    " Entries sorted by pattern

    " https://eslint.org/docs/user-guide/configuring
    autocmd BufNewFile,BufRead .eslintrc.json setlocal filetype=jsonc
    " https://jshint.com/docs/
    autocmd BufNewFile,BufRead .jshintrc setlocal filetype=jsonc
    " https://mochajs.org/#configuring-mocha-nodejs
    autocmd BufNewFile,BufRead .mocharc.json setlocal filetype=jsonc
    autocmd BufNewFile,BufRead .mocharc.jsonc setlocal filetype=jsonc
    " https://github.com/neoclide/coc.nvim
    autocmd BufNewFile,BufRead coc-settings.json setlocal filetype=jsonc
    " https://github.com/clutchski/coffeelint/pull/407
    autocmd BufNewFile,BufRead coffeelint.json setlocal filetype=jsonc
    " https://github.com/microsoft/TypeScript/pull/5450
    autocmd BufNewFile,BufRead tsconfig.json setlocal filetype=jsonc
augroup END
