function mkdatapack
  argparse h/help 'f/pack_format=' -- $argv
  or return

  if set -ql _flag_help
    echo "mkdatapack [OPTIONS] PATH NAMESPACE"
    return 0
  end

  set path $argv[1] # folder name
  set namespace $argv[2] # namespace
  set format $_flag_pack_format # pack format

  if test -z "$argv"
    set path (realpath (input "Path to datapack" .; or return 1))
    # directory exists and contains files
    if test -n "$(ls -A "$path" 2> /dev/null)"
      echo "Directory '$path' is not empty."
      return 1
    end

    set namespace (string split "/" $path)
    set namespace (input "Default namespace" $namespace[-1]; or return 1)

    set format (input "Pack format" 48; or return 1)
    set desc (input "Description"; or return 1)
  # directory exists and contains files
  else if test -n "$(ls -A "$path" 2> /dev/null)"
    echo "Directory is not empty."
    return 1
  end

  mkdir -p {$path}/data/{$namespace}
  
  echo "\
{
  \"pack\": {
    \"description\": \"$desc\",
    \"pack_format\": $format
  }
}" > {$path}/pack.mcmeta
end
