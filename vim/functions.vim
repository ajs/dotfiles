" Custom, non-autocommand functions

function! NoDistractions(...)
  let set_cursor = 0
  let set_scrollbar = 0
  let set_menubar = 0
  let set_fullscreen = 0
  let set_all = 1
  if a:0 > 0
    let set_all = 0
    let index = 1
    while index <= a:0
      if a:{index} == "cursor"
	let set_cursor = 1
      elseif a:{index} == "scrollbar"
	let set_scrollbar = 1
      elseif a:{index} == "menubar"
	let set_menubar = 1
      elseif a:{index} == "fullscreen"
	let set_fullscreen = 1
      else
	echo "Invalid NoDistractions mode: " . a:{index} . ", valid modes: cursor, scrollbar, menubar and fullscreen"
	return
      endif
      let index = index + 1
    endwhile
  endif
  if set_cursor == 1 || set_all == 1
    " cursor doesn't blink
    set guicursor=a:blinkon0
  endif
  if set_scrollbar == 1 || set_all == 1
    " Remove scrollbar in gvim
    set guioptions-=r
  endif
  if set_menubar == 1 || set_all == 1
    " Remove menubar
    set guioptions-=T
  endif
  if set_fullscreen == 1 || set_all == 1
    " fullscreen. duh.
    set fullscreen
  endif
endfunction

function! ConvertToMocha()
  exec "%s/should_receive/expects/ge"
  exec "%s/and_return/returns/ge"
  exec "%s/should_not_receive(\\([^)]*\\))/expects(\\1).never/ge"
  exec "%s/with(\\(\\/[^)]*\\))/with(regexp_matches(\\1))/ge"
  exec "%s/\\.stub/.stubs/ge"
  exec "%s/\\.and_raise/.raises/ge"
  write
endfunction
