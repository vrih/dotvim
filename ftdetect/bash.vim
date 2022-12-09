fun! s:DetectBash()
    if getline(1) == '#!/usr/bin/env bash'
        set ft=bash
    endif
endfun

autocmd BufNewFile,BufRead * call s:DetectBash()
