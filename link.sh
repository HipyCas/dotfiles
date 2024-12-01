#!/bin/sh

cwd=`pwd`

cd ~/dotfiles/fs
# TODO Option to force update no backup
for file in `find . -type f`; do
  echo Linking $HOME/dotfiles/fs/$file to $HOME/$file
  ln --backup=t -s $HOME/dotfiles/fs/$file $HOME/$file
done

cd $cwd