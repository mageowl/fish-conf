function fish_prompt
	set -l cmd_status $status
	
	set color (set_color 93cee9)
	
	set color_status (set_color normal)
	if test "$cmd_status" != 0
		set color_hoot (set_color red)
	end

	set cwd (prompt_pwd | string split "/")
  if set -q cwd[-2]
    set cwd[-2] "$cwd[-2]/"
  end
	
	echo -n "$color󰉋$(set_color normal)$(set_color -i) $cwd[-2]$color$cwd[-1]$(set_color normal) ) "
end
