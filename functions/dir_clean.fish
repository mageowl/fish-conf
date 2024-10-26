function dir_clean
  function delete_file
    read --nchars 1 -P "$(set_color green)Delete $argv[1]?$(set_color normal) (y/n) " should_delete
	set should_delete (string lower $should_delete)
    if test "$should_delete" = "y"
      echo "Deleted"
      rm -rf "./$argv[1]"
      return
    end
	if test "$should_delete" = "n"
		return
	end
    if test "$should_delete" = "r"
      cat "./$argv[1]"
      delete_file $argv[1]
      return
    end
    if test "$should_delete" = "o"
      open "./$argv[1]" &> /dev/null &
      delete_file $argv[1]
      return
    end
    if test "$should_delete" = "q"
      echo "$(set_color -o red)Aborted"
      return 1
    end
	echo "Unknown command $should_delete."
	delete_file $argv[1]
  end

  clear
  echo "Y/N to delete or skip. R to print file to terminal. O to open file using xdg-open. Q to quit."
  set files (ls)
  for path in $files
    delete_file $path
    if test $status = 1
      break
    end
  end
end
