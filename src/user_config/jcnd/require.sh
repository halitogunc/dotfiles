#!/bin/bash

df_install_jcnd_config_clean() {
  rm -f "${HOME}"/.config/starship.toml
}

df_install_jcnd_config() {
  df_install_jcnd_config_clean

  ln -sf ${DF_SRC_PATH}/user_config/jcnd/starship.toml ${HOME}/.config/starship.toml

  if [ "${SHELL}" != "$(which fish)" ]; then
    chsh -s "$(which fish)"
  fi
}
