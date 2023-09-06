if !has('vim9script') ||  v:version < 900
    " Needs Vim version 9.0 and above
    finish
endif

vim9script

import 'vimcompletor.vim'
import autoload '../autoload/lspcomplete.vim' as complete

def Register()
    # Note: When this function is called from LspAttached event
    # g:LspServerRunning() is false. But later when called from
    # OptionsChanged() this variable becomes true.
    var o = complete.options
    if (!o->has_key('enable') || o.enable) && exists('*g:LspServerRunning')
        if o->has_key('filetypes')
            vimcompletor.Register('lsp', complete.Completor, o.filetypes,  o->get('priority', 10))
        elseif g:LspServerRunning(&ft)
            vimcompletor.Register('lsp', complete.Completor, [&ft],  o->get('priority', 10))
        endif
    else
        vimcompletor.Unregister('lsp')
    endif
enddef

autocmd User LspAttached call Register()

def OptionsChanged()
    var opts = vimcompletor.GetOptions('lsp')
    if !opts->empty()
        complete.options->extend(opts)
        Register()
    endif
enddef

autocmd User VimCompleteOptionsChanged ++once OptionsChanged()

def Setup()
    var lspOpts = {
        useBufferCompletion: false,
        completionTextEdit: false,
        snippetSupport: true, # snippets from lsp server
        vsnipSupport: false,
        autoComplete: false,
        omniComplete: true,
    }
    if exists('*g:LspOptionsSet')
        g:LspOptionsSet(lspOpts)
    endif
enddef

Setup()
autocmd VimEnter * Setup()
