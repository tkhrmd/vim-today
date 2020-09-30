let s:dir = g:today_dir
let s:prefix = g:today_prefix
let s:extension = g:today_extension
let s:date = g:today_date
let s:change_dir = g:today_change_dir

function! today#open(...)
  if a:0 >= 1
    let l:fname = a:1
  else
    let l:fname = s:prefix . s:date . '.' . s:extension
  endif

  if s:change_dir
    execute 'lcd' s:dir
  endif

  let l:fpath = expand(s:dir . '/' . l:fname)
  setlocal undoreload=0 | execute 'edit' l:fpath
endfunction

function! today#complete_memos(arglead, cmdline, cursorpos)
  if a:arglead == ''
    let l:exp = printf('^%s.*\.%s$', s:prefix . s:date, s:extension)
  else
    " TODO エスケープが怪しい
    let l:exp = '^' . escape(a:arglead, '.')
  endif

  return readdir(s:dir, {n -> n =~? l:exp}, {'sort': 'collate'})
endfunction
