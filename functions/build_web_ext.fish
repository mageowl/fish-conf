function build_web_ext
	cd ~/.config/firefox
	rm -rf ./web-ext-artifacts
	
	web-ext build --source-dir newTab
	web-ext build --source-dir catppuccin
end
