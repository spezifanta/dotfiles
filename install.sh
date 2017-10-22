#!/usr/bin/env bash

readonly DOTFILE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
readonly BACKUP_DIR="${HOME}/.dotfiles_backup"
readonly IGNORE_FILES="install.sh .git README.md preview.png $(find * -maxdepth 0 -regex '^_.*' -printf '%f ')"

for dotfile in $(find "${DOTFILE_DIR}" -type f -printf '%P ')
do
  # Skip Git repository related files.
  if [[ "${IGNORE_FILES}" =~ "${dotfile}" || "${IGNORE_FILES}" =~ $(echo -n "${dotfile}" | cut -d/ -f1) ]]
  then
    continue 
  fi

  link="${HOME}/${dotfile}"

  # Backup existing dotfiles.
  if [ -e "${link}" ] && [ ! -L "${link}" ]
  then
    path="$(dirname "${dotfile}")"
    backup="${BACKUP_DIR}/${path}"
    echo "Backing up ${link} to '${BACKUP_DIR}/${dotfile}'"
    mkdir -p "${backup}"
    mv "${link}" "${backup}"
  fi

  # Skip existing links.
  [[ -L "${link}" ]] && continue
  
  # Create directories ans symlinks.
  mkdir -p $(dirname "${link}")
  ln -sfTv "${DOTFILE_DIR}/${dotfile}" "${link}"
done

echo "Done linking dot files."


