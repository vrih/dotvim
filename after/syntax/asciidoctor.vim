let s:bcs = b:current_syntax
unlet b:current_syntax
syntax include @JSON syntax/json.vim
syntax include @YAML syntax/yaml.vim
syntax include @SQL syntax/sql.vim
let b:current_syntax = s:bcs

"syntax region hereDocText  matchgroup=Statement start=+```[-~.]*\z([A-Z]\+\)+ end=+^\s*\z1+ contains=NONE

syntax region codeBlockJSON matchgroup=Statement start=+^```\z(json\)+  end=+^```+ contains=@JSON

syntax region codeBlockYAML matchgroup=Statement start=+^```\z(yaml\)+  end=+^```+ contains=@YAML

syntax region codeBlockSQL matchgroup=Statement start=+^```\z(sql\)+  end=+^```+ contains=@SQL
