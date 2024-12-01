for file in `find . -type f -not -iwholename "*/.vim/plugged/*" -not -iwholename "*.git*" -not -iname "*.png" -not -executable -not -iname "*.md"`; do
  if [ -e $HOME/$file ]; then
    echo Removing file $HOME/$file
    rm -ri $HOME/$file
  fi
done
