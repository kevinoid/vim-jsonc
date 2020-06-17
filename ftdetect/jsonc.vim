augroup jsoncFtdetect
    autocmd BufNewFile,BufRead *.cjson setlocal filetype=jsonc
    " Recognize files with .jsonc extension
    autocmd BufNewFile,BufRead *.jsonc setfiletype jsonc

    " Recognize some files known to support JSON with comments
    " Entries sorted by pattern

    " https://eslint.org/docs/user-guide/configuring
    autocmd BufNewFile,BufRead .eslintrc.json setlocal filetype=jsonc
    " https://jshint.com/docs/
    autocmd BufNewFile,BufRead .jshintrc setlocal filetype=jsonc
    " https://github.com/neoclide/coc.nvim
    autocmd BufNewFile,BufRead coc-settings.json setlocal filetype=jsonc
    " https://github.com/clutchski/coffeelint/pull/407
    autocmd BufNewFile,BufRead coffeelint.json setlocal filetype=jsonc
    " https://github.com/microsoft/TypeScript/pull/5450
    autocmd BufNewFile,BufRead tsconfig.json setlocal filetype=jsonc
augroup END
