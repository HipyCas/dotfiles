for file in `find . -type f -not -iwholename "*/.vim/plugged/*" -not -iwholename "*.git*" -not -iname "*.png" -not -executable -not -iname "*.md" | sed "s|^\./||"`; do
  if [ $file != "update-links.sh" -a $file != ".git" -a $file != ".gitignore" -a $file != "carbon.png" -a $file != "README.md" -a $file != "TODO.md" -a $file != "." -a $file != ".." ]; then	
    if [ -e $HOME/$file ]; then
            echo Removing already existing file $HOME/$file
            rm -ri $HOME/$file
    fi
    if [ -n `[ -e $HOME/$file ]` ]; then
      echo Copying $HOME/dotfiles/$file to $HOME/$file
      cp --parents $file $HOME/
    fi
  fi
done
