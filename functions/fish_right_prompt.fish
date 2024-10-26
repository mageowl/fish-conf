function fish_right_prompt
	fish_git_prompt | string replace ')' '' | string replace '(' '( 󰘬 '
end
