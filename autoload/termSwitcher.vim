let s:bufferName = 'termSwitcherBuf'
" Buffer name.
let g:winnr_prev = winnr()

let g:openedPosition = -1
let g:termSwitcherHeight = get(g:, 'termSwitcherHeight', 10)
let g:termSwitcherWidth = get(g:, 'termSwitcherWidth', 65)
" If height and width was not defined, assign default value.

" let g:termSwitcherHeightResized = get(g:, 'termSwitcherHeightResized ', g:termSwitcherHeight)
" let g:termSwitcherWidthResized  = get(g:, 'termSwitcherWidthResized ', g:termSwitcherWidth)
" " If terminal has not resized, assign default value.

function! s:checkBuffer() abort
  " Check the existence of terminal buffer made by this plugin.
  " If have, return bufnr.
  " If does not have, return 0.
  let l:have = 0
  if bufnr(s:bufferName) != -1
    let l:have = bufnr(s:bufferName)
  endif
  return l:have
endfunction

function! termSwitcher#openTerm(pos) abort
  " Open terminal.
  " pos: 1:sp, 0:vsp.
  let l:bufNum = s:checkBuffer()
  " Save current winnr.
  let g:winnr_prev = winnr()
  if l:bufNum == 0
    " If there is no buffer, make new one.
    execute('split')
    execute('terminal')
    execute('f ' . s:bufferName)
    execute a:pos? 'wincmd J' : 'wincmd L'
    execute a:pos? 'resize '.g:termSwitcherHeight : 'vertical resize '.g:termSwitcherWidth
  else
    " If there is a buffer, open it.
    execute('split')
    execute('buffer ' . l:bufNum)
    execute a:pos? 'wincmd J' : 'wincmd L'
    execute a:pos? 'resize '.g:termSwitcherHeight : 'vertical resize '.g:termSwitcherWidth
  endif
  let g:openedPosition = a:pos
endfunction

function! termSwitcher#closeTerm() abort
  " Close terminal.
  if bufwinid(s:bufferName) != -1
    " If current tab has terminal window, close it.
    " Save current winnr.
    let l:winnr_current = winnr() 
    let l:winnr_term = bufwinnr(s:bufferName)
    if g:openedPosition == 1
      let g:termSwitcherHeight = winheight(l:winnr_term)
    elseif g:openedPosition == 0
      let g:termSwitcherWidth = winwidth(l:winnr_term)
    endif
    execute(l:winnr_term.'wincmd w')
    execute('close')
    
    if l:winnr_current != l:winnr_term
      " If cursor was not on the terminal window, back cursor to previous window.
      execute(l:winnr_current.'wincmd w')
    else
      " If the cursor was on a terminal window, returns the cursor to the previous window.
      execute(g:winnr_prev.'wincmd w')
    endif
  endif
endfunction

function! termSwitcher#toggleTerm(pos) abort
  " Toggle terminal window.
  if bufwinid(s:bufferName) != -1
    " If current tab has terminal window, close it.
    call termSwitcher#closeTerm()
  else
  " If terminal window is closed, open it.
    call termSwitcher#openTerm(a:pos)
  endif
endfunction
