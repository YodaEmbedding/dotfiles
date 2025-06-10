#!/bin/bash -x

shopt -s expand_aliases

if ! command -v uv >/dev/null 2>&1; then
    echo "uv command not found. Please install uv via:"
    echo "curl -LsSf https://astral.sh/uv/install.sh | sh"
    exit 1
fi

UV_USER_VENV_NAME="default"
UV_USER_CONFIG="$HOME/.config/uv/envs/$UV_USER_VENV_NAME"
UV_USER_VENV="$HOME/.local/state/uv/virtualenvs/$UV_USER_VENV_NAME"
BIN_PYTHON="$HOME/.local/bin_python"
PATH="$BIN_PYTHON:$PATH"

mkdir -p "$UV_USER_VENV"
[[ "$OSTYPE" != "darwin"* ]] || alias ln='gln'
[ -s "$UV_USER_CONFIG/.venv" ] || ln -sr "$UV_USER_VENV" "$UV_USER_CONFIG/.venv"
[ -s "$BIN_PYTHON" ] || ln -sr "$UV_USER_VENV/bin" "$BIN_PYTHON"

export PATH
export UV_USER_CONFIG
alias uv-user='uv --project="$UV_USER_CONFIG"'
alias uv-user-pip='uv --directory="$UV_USER_CONFIG" pip'
alias uvu='uv-user'
alias pip='uv-user-pip'
alias python='uv-user run python'

uvu sync
