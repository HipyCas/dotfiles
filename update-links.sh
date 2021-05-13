for file in `ls -a $HOME/dotfiles`; do
	if [ $file != "update-links.sh" -a $file != ".git" -a $file != ".gitignore" -a $file != "carbon.png" -a $file != "README.md" -a $file != "." -a $file != ".." ]; then	
		if [ -e $HOME/$file ]; then 
      echo $HOME/dotfiles/$file is already linked to $HOME/$file
    else
		  echo Linking $HOME/dotfiles/$file to $HOME/$file
		  ln -s $HOME/dotfiles/${file} $HOME/${file}
    fi
	fi
done
