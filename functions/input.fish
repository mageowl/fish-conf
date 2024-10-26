function input -a prompt -a default
  if test -n "$default"
    set default_text "$(set_color -d)($default)$(set_color normal) "
  end

  set output (read --prompt-str "$(set_color -o green)?$(set_color normal) $(set_color -o)$prompt$(set_color normal) $default_text")
  or return 1

  if test -z "$output"
    set output $default
  end

  echo $output
end
