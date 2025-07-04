#!/bin/sh
if test -z "${XDG_RUNTIME_DIR}"; then
export XDG_RUNTIME_DIR=/tmp/"${UID}"-runtime-dir
if ! test -d "${XDG_RUNTIME_DIR}"; then
mkdir "${XDG_RUNTIME_DIR}"
chmod 0700 "${XDG_RUNTIME_DIR}"
fi
fi
export XDG_CACHE_HOME="${HOME}/.cache"
export XDG_CONFIG_HOME="${HOME}/.config"
export XDG_DATA_HOME="${HOME}/.local/share"
export XDG_STATE_HOME="${HOME}/.local/state"
export PATH="${PATH}:${HOME}/.local/share/nvim/mason/bin"
