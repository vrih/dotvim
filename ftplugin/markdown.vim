nnoremap <buffer> ,c :!pandoc % -s -f markdown_github-hard_line_breaks -t html -c ~/Documents/pandoc.css -o %:r.html<CR>
nnoremap <buffer> ,b :silent !firefox %:r.html<CR>
