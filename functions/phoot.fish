function phoot
	set title (set_color -i -o magenta)
	set norm (set_color normal)
	set icon (set_color 74c7ec)
	
	echo " ôvô $title  owl@cosmog$norm
 ( )   $icon󰥔 $norm$(uptime --pretty | string replace 'up ' "" | string replace -r -a '(\d+) (\w)\w+,?' '$1$2')
==m=>  $icon󰂚 $norm??"
end
