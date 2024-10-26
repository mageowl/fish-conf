function commit
  if test -e "./.on_commit.fish"
    fish ./.on_commit.fish
  end

  git add '*'
  git commit -a -m "$argv"
  git push
end
