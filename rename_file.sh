#!/bin/bash

# 引数の数をチェック
if [ $# -ne 4 ]; then
  echo "引数エラー: スクリプトには 4 つの引数が必要です。"
  echo "Usage: $0 <コピー元ディレクトリ> <コピー先ディレクトリ> <置換前文字列> <置換後文字列>"
  exit 1
fi

# 引数から変数に値を代入
source_directory="$1"
destination_directory="$2"
original_string="$3"
replacement_string="$4"

# ソースディレクトリ内のファイルを検索してコピー
for file in "$source_directory"/*"$original_string"*; do
  # ファイル名から置換対象の文字列を置換して新しいファイル名を作成
  new_file="${file//$original_string/$replacement_string}"
  
  # ファイルをコピー
  cp "$file" "$destination_directory/$(basename "$new_file")"
done