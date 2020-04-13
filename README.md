JSON with Comments for Vim
==========================

[Vim](https://www.vim.org/) syntax highlighting plugin for JSON with C-style
line (`//`) and block (`/* */`) comments.

It defines a filetype named `jsonc` (matching the name used in [VS
Code](https://code.visualstudio.com/Docs/languages/json#_json-with-comments),
a [Microsoft parser library](https://github.com/Microsoft/node-jsonc-parser),
[.mocharc.jsonc](https://github.com/mochajs/mocha/pull/3760), and the [jsonc
npm package](https://www.npmjs.com/package/jsonc)) which can be applied to
files using [`set
ft=jsonc`](https://vimhelp.org/options.txt.html#%27filetype%27) or a
[modeline](https://vimhelp.org/options.txt.html#modeline).


## Installation

This plugin can be installed in the usual ways:

### Using [Vim Packages](https://vimhelp.org/repeat.txt.html#packages)

```sh
git clone https://github.com/kevinoid/vim-jsonc.git ~/.vim/pack/git-plugins/start/vim-jsonc
```

### Using [Pathogen](https://github.com/tpope/vim-pathogen)

```sh
git clone https://github.com/kevinoid/vim-jsonc.git ~/.vim/bundle/vim-jsonc
```

### Using [Vundle](https://github.com/VundleVim/Vundle.vim)

Add the following to `.vimrc`:
```vim
Plugin 'kevinoid/vim-jsonc'
```
Then run `:PluginInstall`.

### Using [vim-plug](https://github.com/junegunn/vim-plug)

Add the following to `.vimrc` between `plug#begin()` and `plug#end()`:
```vim
Plug 'kevinoid/vim-jsonc'
```


## Implementation

This plugin loads the JSON syntax plugin, clears the syntax group for
comments as errors, then defines additional syntax to match C-style comments.

This project was inspired by, and the code is based on,
[elzr/vim-json#61](https://github.com/elzr/vim-json/pull/61) by
[**@TheLocehiliosan**](https://github.com/TheLocehiliosan).


## Contributing

Contributions are appreciated!  Please add tests where possible and ensure
`./run-tests.sh` passes.

If the desired change is large, complex, backwards-incompatible, can have
significantly differing implementations, or may not be in scope for this
project, opening an issue before writing the code can avoid frustration and
save a lot of time and effort.


## License

This package is available under the terms of the
[MIT License](https://opensource.org/licenses/MIT).
