function __jcnd_common_init
  set -xg EDITOR vim

  __jcnd_docker_alias_init
  __jcnd_system_alias_init

  alias lsl "command ls --color"
  alias ls lsd
  alias cat bat
  alias pcat "bat --plain"

  abbr -a gcd "cd (git rev-parse --show-toplevel)"
  abbr -a gcom "git checkout (git symbolic-ref refs/remotes/origin/HEAD | sed 's@^refs/remotes/origin/@@')"

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


  __jcnd_unix_init


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

  if test -d $HOME/.cargo/bin
    fish_add_path $HOME/.cargo/bin
  end

  if test -d $HOME/.nix-profile/
    bass source $HOME/.nix-profile/etc/profile.d/nix.sh
  end

  if type -q npm
    fish_add_path (npm -g bin)
  end

  if type -q yarn
    fish_add_path (yarn global bin)
  end

  if type -q java
    set -xg JAVA_HOME (asdf where java)
  end

  if type -q starship
    starship init fish | source
  end

  if test -d $PWD/vendor/bin
    set -xg PATH $PWD/vendor/bin $PATH
  end

  if type -q fd
    set -xg FZF_DEFAULT_COMMAND 'fd --type f'
    set -xg FZF_CTRL_T_COMMAND "$FZF_DEFAULT_COMMAND"
  end

end
