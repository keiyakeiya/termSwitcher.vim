if exists('g:loaded_termSwitcher')
  finish
endif
let g:loaded_termSwitcher = 1

command! Tterm call termSwitcher#toggleTerm(1)
" Toggle terminal window (bottom).

command! Vtterm call termSwitcher#toggleTerm(0)
" Toggle terminal window (right).
