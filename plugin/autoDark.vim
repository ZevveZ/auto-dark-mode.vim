" Auto Dark Mode
"
" Switch automatically between light and dark modes on macOS Mojave and
" onwards.
" 
" Original Maintainer:	Liang-Ting Chen <liang.ting.chen.tw@gmail.com>
" Maintainer: Zev
" Repository: https://github.com/ZevveZ/auto-dark-mode
" License: MIT

if exists('g:AutoDarkLoaded') || &cp
  finish
end
let g:AutoDarkLoaded = 1

if !exists('##OSAppearanceChanged') && has("gui_running")
  echomsg "AutoDark requires MacVim Snapshot 160 or later."
  finish
end

func! s:ChangeBackground()
  if (v:os_appearance)
    set background=dark
  else 
    set background=light
  endif
  redraw!
endfunc

if exists('##OSAppearanceChanged')
    augroup AutoDark
        autocmd OSAppearanceChanged * call s:ChangeBackground()
    augroup END
endif
