#!/bin/bash

#メモを保存するフォルダの設定
MEMO_DIR=$QUICK_MEMO_DIR

echo MEMO_DIR

# MEMO_DIRが設定されてない場合はなにもしない
if [ -z "$MEMO_DIR" ]; then
    echo "QUICK_MEMO_DIR is not set."
    exit 1
fi

# 新しいメモのファイル名を日付と時間で生成
FILE_NAME="$(date +%Y%m%d_%H%M).md"

# 新しいファイルを作成し、Neovimで開く
nvim "$MEMO_DIR/$FILE_NAME"
