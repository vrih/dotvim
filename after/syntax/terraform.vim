let s:bcs = b:current_syntax
unlet b:current_syntax
syntax include @JSON syntax/json.vim
syntax include @YAML syntax/yaml.vim
let b:current_syntax = s:bcs

syntax region hereDocText  matchgroup=Statement start=+<<[-~.]*\z([A-Z]\+\)+ end=+^\s*\z1+ contains=NONE

syntax region hereDocDashJSON matchgroup=Statement start=+<<[-~.]*\z(JSON\)+  end=+^\s*\z1+ contains=@JSON

syntax region hereDocDashYAML matchgroup=Statement start=+<<[-~.]*\z(YAML\)+  end=+^\s*\z1+ contains=@YAML
