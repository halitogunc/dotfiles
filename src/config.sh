df_config() {
  #### Recommended Themes
  ## Argonaut
  ## Brogrammer
  ## Cobalt2
  ## Dark Pastel
  ## Darkside
  ## Espresso Libre
  ## Paul Millr
  ## Pencil Dark
  ## Thayer Bright
  ## Xterm

  if command -v dconf > /dev/null 2>&1; then
    dconf write /apps/guake/style/font/palette-name "'Argonaut'" 2> /dev/null
  fi

  # franciscolourenco/done
  fish -c "set -U __done_min_cmd_duration 10000" # default: 5000 ms
  fish -c "set -U __done_exclude 'git (?!push|pull)'" # default: all git commands, except push and pull. accepts a regex.
}
