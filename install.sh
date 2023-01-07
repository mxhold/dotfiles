#!/bin/sh

link_file() {
  if [ -e "$2" ]; then
    printf "%s " "overwrite $2? [yN]"
    read overwrite
    case "$overwrite" in
      y)
        echo "rm -rf $2"
        rm -rf "$2"
        ;;
      *)
        echo "skipping $2"
        return
        ;;
    esac
  fi

  destdir=`dirname "$2"`
  echo "mkdir -p $destdir"
  mkdir -p "$destdir"

  echo "ln -sfv $1 $2"
  ln -sfv "$1" "$2"
}

for file in zshrc git-prompt.sh gitconfig
do
  link_file "/Users/max/Projects/dotfiles/$file" "/Users/max/.$file"
done
