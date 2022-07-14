#!bin/bash

### Update all .dotfiles in system. ###

# List/Array of config directories to be updated.
CONFIGS=("alacritty" "bash" "neovim" "polybar" "qtile" "vscodium_neovim" "X" "zsh")

# Loop through all directories
for DIR in ${CONFIGS[@]}
do
    if [[ ${DIR} == "bash" ]] || [[ ${DIR} == "X" ]]  # Only copy files within and paste them into $HOME
    then
        # cd ${DIR}
        cp -a ${HOME}/.dotfiles/${DIR}/. ${HOME}
        echo "Accessed ${DIR} files and copied them into ${HOME}"
        continue
    fi
    rm -rf ${HOME}/.config/${DIR}
    cp -r ${HOME}/.dotfiles/${DIR} ${HOME}/.config
    echo "Copied ${DIR} directory into ${HOME}/.config"
done

exit 0
