# vim-today
Vim plugin for open a memo quickly.

## Introduction

**今日のメモ** を素早く開くためのプラグインです。 `:Today` コマンドを提供します。

`:Today` を実行すると当日の日付をファイル名に入れたバッファを開きます。

日付の入ったファイルが複数ある場合はファイル名が補完され、選択してバッファを開けます。

```
:Today memo_20200929
memo_20200929.md       memo_20200929_hoge.md
```

## Installation

[minpac](https://github.com/k-takata/minpac)

```
call minpac#add('tkhrmd/vim-today')
```

## Configuration

```
" open memo
nmap <leader>t <plug>(today-open)
```
