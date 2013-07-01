"if exists("b:did_ftplugin")
"finish
"endif
"let b:did_ftplugin = 1

set tabstop=4
set shiftwidth=4
set noexpandtab

imap <buffer> <C-e> <TAB>exact
imap <buffer> <C-p> <TAB>phrase
imap <buffer> <C-b> <TAB>broad
imap <buffer> <C-r> <TAB>negative exact
imap <buffer> <C-o> <TAB>negative phrase
imap <buffer> <C-v> <TAB>negative broad

map <buffer> <F5> :call CopyCurrentRow()<CR>
map <buffer> <F6> :call CopyCurrentRowB()<CR>

function! CopyCurrentRow()
"    gaq
    let regex = '^[^\t]*\t[^\t]*\t'
    let line = getline('.')
    let ad_g = matchstr(line,regex)
    if ad_g == -1
	echo "no match"
    else
        execute "normal o" . ad_g
    endif
endfunction

function! CopyCurrentRowB()
"    gaq
    let regex = '^[^\t]*\t[^\t]*\t[^\t]*\t'
    let line = getline('.')
    let ad_g = matchstr(line,regex)
    if ad_g == -1
	echo "no match"
    else
        execute "normal o" . ad_g
    endif
endfunction

function! CampaignFolds()
    let prevline = getline(v:lnum-1)
    let thisline = getline(v:lnum)

    let thisfold=matchstr(thisline,'^[^\t]*')
    let lastfold=matchstr(prevline,'^[^\t]*')

    if lastfold == thisfold
        return "1"
    else
        return ">1"
    endif
endfunction

let b:matchfold=""
setlocal foldmethod=expr
setlocal foldexpr=CampaignFolds()

