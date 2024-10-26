function launch-desktop
	cat $argv[1] | string match -rg "^Exec=(.*)" | sh $argv[2..]
end
