function TFVariableSort ()
  execute 'g/[:word:]* {/,/^}/s/\n/§'
  execute '%sort'
  execute 'g/[:word:]* {/s/§/\r/g'
endfunction

compiler terraform
