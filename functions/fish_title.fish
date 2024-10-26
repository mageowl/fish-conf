function fish_title 
	set command fish
	if set -q argv[1]
		set command (string split " " $argv[1])
	end
	set cmd_name $command[1]
	
	set icon 󰈺
	switch $cmd_name
		case nv
			set icon 
		case nvim
			set icon 
		case cat
			set icon 󰄛
		case sleep
			set icon 󰒲
		case npm
			set icon 
    case live-server
      set icon 
    case cargo
      set icon 
	end
	
	if test (count $command) = 1
		set command[2] (prompt_pwd)
	end
	
	echo $icon $command
end
