#!/bin/bash

# 指定した SDL2_ttf のバージョンをダウンロードして、make を実行できる状態にする
#
# ソースコードは $2/source に配置される
#
# 引数:
#   $1: SDL2_ttf のバージョン
#   $2: 出力ディレクトリ
if [ $# -lt 2 ]; then
  echo "$0 <sdl2_ttf_version> <output_dir>"
  exit 1
fi

SDL2_TTF_VERSION=$1
OUTPUT_DIR=$2

mkdir -p $OUTPUT_DIR
pushd $OUTPUT_DIR
  if [ ! -e SDL2_ttf-$SDL2_TTF_VERSION.tar.gz ]; then
    curl -LO https://www.libsdl.org/projects/SDL_ttf/release/SDL2_ttf-$SDL2_TTF_VERSION.tar.gz
  fi
  rm -rf source
  rm -rf SDL2_ttf-$SDL2_TTF_VERSION
  tar xf SDL2_ttf-$SDL2_TTF_VERSION.tar.gz
  mv SDL2_ttf-$SDL2_TTF_VERSION source
popd