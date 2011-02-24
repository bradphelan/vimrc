" set nocompatible should be default. This should be the first line:
set nocompatible

" enable filetype, plugin and syntax support {{{1
" This means 
filetype indent plugin on | syn on

" =============================================
"             Add On Packages
" =============================================
" Utility for loading plugins
set runtimepath+=$HOME/vim/vim-addon-manager
fun! AddOn(plug)
    call scriptmanager#Activate(a:plug)
endf
com! -nargs=1 AddOn call AddOn("<args>")
fun! AddGit(name, url)
    let g:vim_script_manager['plugin_sources'][a:name]= { 'type' : 'git', 'url' : a:url }
    call AddOn(a:name)
endf
com! -nargs=+ AddGit call AddGit(<f-args>)
" =============================================

"requires a post install 'rake make' in the install directory
AddOn Command-T

AddOn rails

AddOn Align294

AddOn snippetsEmu

AddGit emu-eggs https://bradphelan@github.com/bradphelan/emu-eggs.git

" =============================================

set expandtab
set sw=4
set ts=4
set sts=4

" allow buffers to go in background without saving etc.
set hidden

let mapleader=","
let g:mapleader=','
let g:maplocalleader=','


" Only interested in the tabs
set guioptions=earb

hi CursorLine guibg=Grey8
hi CursorColumn guibg=Grey8

" works together with the template for embedded strings in ruby
au BufNewFile,BufRead *.rb,*.erb imap <buffer> ii ii<tab>

" automatic bracket inserting
imap [ []<esc>i
imap ( ()<esc>i
imap { {}<esc>kk$a
imap [] []
imap () ()
imap {} {}

" Copy the path of the file into the unamed buffer
nmap cp :let @* = expand("%")<cr>
nmap cP :let @* = expand("%:p")<cr>

nnoremap  zz
nnoremap  zz
nnoremap n nzz
nnoremap N Nzz
nnoremap j jzz
nnoremap k kzz
nnoremap G Gzz
nnoremap ( (zz
nnoremap ) )zz
nnoremap { {zz
nnoremap } }zz
nnoremap [ [zz
nnoremap ] ]zz
nnoremap % %zz

" Non gui tabs
hi TabLine guifg=red guibg=white gui=underline
hi TabSel guifg=green guibg=white gui=underline
hi TabLineFill guibg=darkblue 

" We hate the fucking beep. Pisses people off on the train. Flash
" the screen instead
set vb

" Allows copy the buffer with line numbers included.

function! CopyWithLineNumbers() range
    redir @*
    sil echomsg "----------------------"
    sil echomsg expand("%")
    sil echomsg "----------------------"
    exec 'sil!' . a:firstline . ',' . a:lastline . '#'
    redir END
endf

com! -range CopyWithLineNumbers <line1>,<line2>call CopyWithLineNumbers()

" Quote a word that the cursor is on
nmap "w viwxi""<esc>P

" Use ack for grep
set grepprg=ack

au! BufRead,BufNewFile *.md set filetype=markdown

colorscheme torte

" Easy escape without RSI fingers
imap jj l

" normal mode whitespace inserters
nmap  i
nmap <space> i<space><esc>l
nmap <tab> i<tab><esc>l

" Search/replace the word under the cursor
nmap ; :%s/\<<c-r>=expand("<cword>")<cr>\>/
vnoremap ; "hy:%s/<C-r>h//gc<left><left><left>


" ^W is a pain to use. normal mode 's' is hardly used.
nmap s 
