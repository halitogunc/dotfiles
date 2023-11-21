df_install_asdf_plugin_version() {
  local plugin=${1}
  local version=${2}

  asdf plugin-add ${plugin}
  asdf plugin-update ${plugin}
  asdf install ${plugin} ${version}
  asdf global ${plugin} ${version}
}

df_install_asdf() {
  echo "installing asdf"

  nix profile install nixpkgs#asdf-vm

  df_install_bashrc_append '. ${HOME}/.nix-profile/share/asdf-vm/asdf.sh'

  source "${DF_BASHRC_PATH}"

  df_install_asdf_plugin_version java "latest:adoptopenjdk-17"
  df_install_bashrc_append 'export JAVA_HOME=$(asdf where java)'

  export NODEJS_CHECK_SIGNATURES=no
  df_install_asdf_plugin_version nodejs "20.2.0"

  # if root, set npm config to allow global install without sudo
  if [ $(id -u) -eq "0" ]; then
    npm config set user 0
    npm config set unsafe-perm true
  fi

  npm install -g --silent yarn@latest npm@latest pnpm@latest

  df_install_bashrc_append 'export PATH="$PATH":"$(npm prefix -g)/bin"'
  df_install_bashrc_append 'export PATH=$PATH:$(yarn global bin)'
  df_install_bashrc_append 'export PATH=$PATH:$(pnpm bin)'
}
