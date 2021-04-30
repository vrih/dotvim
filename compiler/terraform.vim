if exists('g:current_compiler') || &compatible
  finish
endif
let g:current_compiler="terraform"

CompilerSet errorformat=%EError:\ %m
CompilerSet errorformat+=%WWarning:\ %m
CompilerSet errorformat+=%Z%.%#on\ %f\ line\ %l%.%#
CompilerSet errorformat+=%C%.%#

CompilerSet makeprg=terraform\ plan\ -out\ plan\ -no-color

