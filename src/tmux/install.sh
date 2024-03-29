df_install_tmux() {
  nix profile install nixpkgs#tmux

  rm -rf ${HOME}/.tmux
  rm -rf ${HOME}/.tmux.conf
  rm -rf ${HOME}/.tmux.bak

  git clone https://github.com/gpakosz/.tmux.git $HOME/.tmux
  ln -sf $HOME/.tmux/.tmux.conf $HOME/.tmux.conf

  # make sure it exists
  touch $HOME/.tmux/.tmux.conf.local
  cp $HOME/.tmux/.tmux.conf.local $HOME/.tmux.conf.local

  ln -sf ${DF_SRC_PATH}/tmux/tmux.conf ${HOME}/.tmux.jcnd.conf

  local genFilePath="${HOME}"/.tmux.jcnd.gen.conf
  touch "${DF_PROJECT_PATH}/.gen/tmux.conf"
  ln -sf "${DF_PROJECT_PATH}/.gen/tmux.conf" ${genFilePath}

  echo "set-option -g default-shell $(which fish)" >> ${genFilePath}

  echo "source-file ${HOME}/.tmux.jcnd.conf" >> ${HOME}/.tmux.conf.local
  echo "source-file ${genFilePath}" >> ${HOME}/.tmux.conf.local

  tmux source-file ${HOME}/.tmux.conf
}
