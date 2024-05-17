# Readme


## Installation

```bash

```bash
stow pypoetry
cd ~/.config/pypoetry/envs/default
poetry install

PYVER=3.11

# USER_SITE="$(python$PYVER -c 'import site; print(site.getusersitepackages())')"
USER_SITE="$(python$PYVER -m site --user-site)"
rm -rf "$USER_SITE"
ln -s ~/.cache/pypoetry/virtualenvs/default-*-py$PYVER/lib/python$PYVER "$USER_SITE"

ln -s ~/.cache/pypoetry/virtualenvs/default-*-py$PYVER/bin ~/.local/bin_python
```


## Usage

```bash
poetry-user add pyyaml
poetry-user run python -c 'import yaml; print(yaml.dump({"hello": "world"}))'
```


## Generic instructions

From https://github.com/python-poetry/poetry/issues/1214#issuecomment-1667364532

> My use-case is a bit more mundane. I just want to have a global `poetry.lock` managed installation for throwaway scripts or a REPL for rough calculations/experimentation which is not associated with a specific project.
>
> ---
>
> ### Using `poetry` to manage `--user` site-packages
>
> Create a directory for your poetry project:
>
> ```bash
> mkdir -p ~/.config/pypoetry/envs/default
> cd ~/.config/pypoetry/envs/default
> poetry init
> ```
>
> Symlink the resulting virtualenv, prepend to `PATH`, and set up a convenient alias:
>
> ```bash
> PYVER=3.11
>
> rm -rf ~/.local/lib/python$PYVER
> ln -s ~/.cache/pypoetry/virtualenvs/default-*-py$PYVER/lib/python$PYVER ~/.local/lib/python$PYVER
> ln -s ~/.cache/pypoetry/virtualenvs/default-*-py$PYVER/bin ~/.local/bin_python
>
> echo 'export PATH="$HOME/.local/bin_python:$PATH"' >> ~/.bashrc
> echo "alias poetry-user='poetry --directory ~/.config/pypoetry/envs/default'" >> ~/.bashrc
> ```
>
> And now, instead of `poetry --user`, just do `poetry-user`:
>
> ```bash
> poetry-user add pyyaml
> ```

