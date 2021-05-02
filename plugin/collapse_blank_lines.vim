function FixBlankLines()
        :silent %s/\($\n\)\{3,\}/\r\r/e
        :silent %s/\($\n\)\{2,\}\%$/\r/e
endfunction
