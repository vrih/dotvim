" Ad Words Keywords Syntax Highlighting
"
" Columns: Campaign, Ad group, Keyword, Match type, Destination URL
"

syn match DestinationURL /http:\/\/.*/
syn match MatchType /\t\(Negative \)\?\(Exact\|Broad\|Phrase\)/ nextgroup=DestinationURL skipwhite
syn match Keyword /\t[^\t]*/ nextgroup=Matchtype skipwhite
syn match AdGroup /\t[^\t]*/ nextgroup=Keyword skipwhite
syn match Campaign /^[^\t]*/ nextgroup=AdGroup skipwhite 
syn keyword basicLanguageKeywords Exact Phrase Broad Negative

hi def link DestinationURL Todo
hi def link MatchType Comment
hi def link Keyword Statement
hi def link AdGroup Type
hi def link Campaign Constant

