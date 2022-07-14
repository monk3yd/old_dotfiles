#!/bin/bash

# Make backup ~/.dotfiles/ directory which contains all relevant config files
# & directories.
# Save backup into ~/.dotfiles-monk3yd/

# Run as ROOT
if [[ "${UID}" -ne 0 ]]
then
	echo 'You must run this script as root'
	exit 1
fi

# Relevant PATHS for backup into variables
MONK3YD="/home/monk3yd"
BACKUP="${MONK3YD}/.backup-monk3yd"
PERSONAL="/personal"
B_SCRIPTS="${MONK3YD}/.bash-monk3yd"
DOTFILES="${MONK3YD}/.dotfiles

# --- Make copy of all personal (-monk3yd) files & dirs ---

# Backup general/system config files - TODO Loop through list of config files you want to backup
rm -rf ${BACKUP}/.config-monk3yd && cp -rfT ${MONK3YD}/.config ${BACKUP}/.config-monk3yd
if [[ "${?}" -ne 0 ]]
then
	echo 'Could NOT backup .config/ directory'
	exit 1
fi

# Backup BASH config file
rm -rf ${BACKUP}/.bashrc-monk3yd && cp -rfT ${MONK3YD}/.bashrc ${BACKUP}/.bashrc-monk3yd
if [[ "${?}" -ne 0 ]]
then
	echo 'Could NOT backup .bashrc config file'
	exit 1
fi

# Backup Vim/Neovim config files
rm -rf ${BACKUP}/.vim-monk3yd && cp -rfT ${MONK3YD}/.vim ${BACKUP}/.vim-monk3yd
if [[ "${?}" -ne 0 ]]
then
	echo 'Could NOT backup .vim/ directory'
	exit 1
fi

rm -rf ${BACKUP}/.vimrc-monk3yd && cp -rfT ${MONK3YD}/.vimrc ${BACKUP}/.vimrc-monk3yd
if [[ "${?}" -ne 0 ]]
then
	echo 'Could NOT backup .vimrc config file'
	exit 1
fi

rm -rf ${BACKUP}/.dotfiles-monk3yd && cp -rfT ${DOTFILES} ${BACKUP}/.dotfiles-monk3yd
if [[ "${?}" -ne 0 ]]
then
	echo 'Could NOT backup .dotfiles/ dir'
	exit 1
fi

# Backup ZSHELL config file
rm -rf ${BACKUP}/.zshrc-monk3yd && cp -rfT ${MONK3YD}/.zshrc ${BACKUP}/.zshrc-monk3yd
if [[ "${?}" -ne 0 ]]
then
	echo 'Could NOT backup .zshrc config file'
	exit 1
fi

#rm -rf .backup-monk3yd/.aws-monk3yd && cp -rfT .aws .backup-monk3yd/.aws-monk3yd
#rm -rf .backup-monk3yd/.conda-monk3yd && cp -rfT .conda .backup-monk3yd/.conda-monk3yd
#rm -rf .backup-monk3yd/.fehbg-monk3yd && cp -rfT .fehbg .backup-monk3yd/.fehbg-monk3yd
#rm -rf .backup-monk3yd/.gitconfig-monk3yd && cp -rfT .gitconfig .backup-monk3yd/.gitconfig-monk3yd
#rm -rf .backup-monk3yd/.local-monk3yd && cp -rfT .local .backup-monk3yd/.local-monk3yd
#rm -rf .backup-monk3yd/.ssh-monk3yd && cp -rfT .ssh .backup-monk3yd/.ssh-monk3yd

# Change ownership/permissions of files to monk3yd
chown -R monk3yd:monk3yd ${BACKUP}/ && chmod -R 0755 ${BACKUP}/
#chown -R monk3yd:monk3yd {*,.*}-monk3yd* && chmod -R 0755 {*,.*}-monk3yd*

# --- Delete .bak files ---
#rm -f {*,.*}.bak

# Transfer updated backup files into personal folder
rm -rf ${PERSONAL}/.*  # TODO Fix
cp -rfT ${BACKUP}/.config-monk3yd ${PERSONAL}/.config-monk3yd
cp -rfT ${BACKUP}/.bashrc-monk3yd ${PERSONAL}/.bashrc-monk3yd
cp -rfT ${BACKUP}/.vim-monk3yd ${PERSONAL}/.vim-monk3yd
cp -rfT ${BACKUP}/.vimrc-monk3yd ${PERSONAL}/.vimrc-monk3yd
cp -rfT ${BACKUP}/.zshrc-monk3yd ${PERSONAL}/.zshrc-monk3yd
#cp -rfT .backup-monk3yd/.aws-monk3yd /personal/.aws-monk3yd
#cp -rfT .backup-monk3yd/.conda-monk3yd /personal/.conda-monk3yd
#cp -rfT .backup-monk3yd/.fehbg-monk3yd /personal/.fehbg-monk3yd
#cp -rfT .backup-monk3yd/.gitconfig-monk3yd /personal/.gitconfig-monk3yd
#cp -rfT .local-monk3yd /personal/.local-monk3yd
#cp -rfT .backup-monk3yd/.ssh-monk3yd /personal/.ssh-monk3yd

# Backup bash scripts
cp -rfT ${B_SCRIPTS}/backup-monk3yd.sh ${PERSONAL}/backup-monk3yd.sh
cp -rfT ${B_SCRIPTS}/install-monk3yd.sh ${PERSONAL}/install-monk3yd.sh

echo 'Script run successfully'
exit 0
