function common_init
  function fish_greeting 
  end

  set -xg EDITOR vim

  source $HOME/.asdf/asdf.fish

  docker_alias_init
  system_alias_init

  alias lsl "command ls --color"
  alias ls lsd
  alias cat bat

  abbr -a cls clear

  set -xg IS_WSL (grep Microsoft /proc/sys/kernel/osrelease 2>/dev/null \
    | wc -l | sed -e 's/^[ \t]*//' -e 's/[ \t]*$//')

  set -xg NODEJS_CHECK_SIGNATURES no

  set -xg PATH $HOME/.fzf/bin $PATH
  set -xg PATH $HOME/.local/bin $PATH

  set -xg TERM xterm-256color
  set -xg BYOBU_BACKEND tmux

  set -xg theme_display_user yes
  set -xg theme_color_scheme terminal-dark
  set -xg theme_display_ruby no

  if test -d $HOME/.kube
    set -xg KUBECONFIG (echo $HOME/.kube/config* | sed -e "s/\ /:/g")
  end

  if [ "$IS_WSL" != "0" ]
    # if we're in WSL
    wsl_init
  else
    # we're in a non-wsl unix environment
    unix_init
  end


  if type -q code-insiders
    set -xg EDITOR "code-insiders --wait"
  else if type -q code
    set -xg EDITOR "code --wait"
  else if type -q subl
    set -xg EDITOR "subl --wait"
  end

  if type -q gpg
    set -xg GPG_TTY (tty)
  end

  if test -d $HOME/.cabal/bin
    set -xg PATH $HOME/.cabal/bin $PATH
  end

  if test -d $HOME/.ghcup/bin
    set -xg PATH $HOME/.ghcup/bin $PATH
  end

  if test -d $HOME/.nix-profile/
    bass source $HOME/.nix-profile/etc/profile.d/nix.sh
  end

  if type -q npm
    set -xg PATH (npm -g bin) $PATH
  end

  if type -q yarn
    set -xg PATH (yarn global bin) $PATH
  end

  if type -q java
    set -xg JAVA_HOME (asdf where java)
  end

  if type -q starship
    starship init fish | source
  end

  if type -q react-native
    abbr --add rn 'react-native'
  end

  # TODO: install fd with dotfiles and remove if check
  if type -q fd
    # use https://github.com/sharkdp/fd for fzf if available, respects .gitignore
    set -xg FZF_DEFAULT_COMMAND 'fd --type f'
    # To apply the command to CTRL-T as well
    set -xg FZF_CTRL_T_COMMAND "$FZF_DEFAULT_COMMAND"
  end

end
