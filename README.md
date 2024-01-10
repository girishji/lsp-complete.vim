> [!CAUTION]
> THIS PLUGIN IS NO LONGER NEEDED.
> The functionality is already merged into [vimcomplete](https://github.com/girishji/vimcomplete).

------
------



#### LSP Source for Vimcomplete Plugin

This plugin sources autocompletion items from
[LSP](https://github.com/yegappan/lsp) for
[Vimcomplete](https://github.com/girishji/vimcomplete) autocompletion plugin.

# Requirements

- Vim >= 9.0
- [Vimcomplete](https://github.com/girishji/vimcomplete)
- [LSP Client](https://github.com/yegappan/lsp)

# Installation

Install this plugin after installing [LSP](https://github.com/yegappan/lsp) and
[Vimcomplete](https://github.com/girishji/vimcomplete).

Install using [vim-plug](https://github.com/junegunn/vim-plug).

```
vim9script
plug#begin()
Plug 'girishji/lsp-complete.vim'
plug#end()
```

For those who prefer legacy script.

```
call plug#begin()
Plug 'girishji/lsp-complete.vim'
call plug#end()
```

Or use Vim's builtin package manager.

# Configuration

Default options are as follows.

```
vim9script
export var options: dict<any> = {
    enable: true,    # 'false' to disable this extension
    priority: 8,     # Higher priority items are shown at the top
    maxCount: 10,    # Maximum number of items shown
    dup: true,       # `true` allows duplicate completion words
    keywordOnly: false, # 'false' will complete after '.' in 'builtins.'
}
```

Options can be modified using `g:VimCompleteOptionsSet()`. It takes a
dictionary as argument. If you are using
[vim-plug](https://github.com/junegunn/vim-plug) then call this function through
__VimEnter__ autocommand event.

```
autocmd VimEnter * g:VimCompleteOptionsSet(options)
```
