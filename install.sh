#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" 

BACKUP_DIR="${HOME}/.dotfiles_backup"
SKIP_FILES="install.sh .git README.md preview.png $(find * -maxdepth 0 -regex '^_.*' -printf '%f ')"

shopt -s dotglob

for dot_file in *
do
    [[ "${SKIP_FILES}" =~ "${dot_file}" ]] && continue 

    link="${HOME}/${dot_file}"

    if [ -e "${link}" ] && [ ! -L "${link}" ]
    then
        echo "Backing up ${link} to ${BACKUP_DIR}"
        mkdir -p "${BACKUP_DIR}/$(dirname ${link})"
        mv "${link}" "${BACKUP_DIR}/"
    fi

    ln -sfTv "$(pwd)/${dot_file}" "${link}"
done
