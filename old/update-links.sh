for file in `find . -type f -not -iwholename "*/.vim/plugged/*" -not -iwholename "*.git*" -not -iname "*.png" -not -iname "*.md" | sed "s|^\./||"`; do
	if [ $file != "update-links.sh" -a $file != "copy-files.sh" -a $file != "remove-files.sh" -a  $file != "." -a $file != ".." ]; then	
		if [ -e $HOME/$file ]; then 
      echo Removing already existing file $HOME/$file
      rm -ri $HOME/$file
    fi
		echo Linking $HOME/dotfiles/$file to $HOME/$file
		ln -s $HOME/dotfiles/${file} $HOME/${file}
	fi
done
