if exists('g:loaded_today')
  finish
endif
let g:loaded_today = 1

let g:today_dir = expand(get(g:, 'today_dir', $HOME . '/memo'))
let g:today_prefix = get(g:, 'today_prefix', 'memo_')
let g:today_extension = get(g:, 'today_extension', 'md')
let g:today_date_format = get(g:, 'today_date_format', '%Y%m%d')
let g:today_change_dir = get(g:, 'today_change_dir', 1)

let g:today_date = strftime(g:today_date_format)

nnoremap <plug>(today-open) :<c-u>call today#open()<cr>

" TODO <q-args> を使うと today#open の a:0 が常に 1 になる
command! -nargs=? -complete=customlist,today#complete_memos Today call today#open(<f-args>)
