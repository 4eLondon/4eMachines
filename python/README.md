# Python Dev Container

Includes: Python 3.13, pip

Nothing extra is pre-installed. Use a `requirements.txt` or install packages
on demand. See `packages.md` for curated lists by use case.

## Build

```bash
docker build -t dev-python .
```

## Run

```bash
# Basic
docker run --rm -it -v "$PWD":/code dev-python

# With a local virtualenv persisted in your project folder
# (the .venv folder will appear in your actual project directory)
docker run --rm -it \
  -v "$PWD":/code \
  dev-python
# Then inside: python -m venv .venv && source .venv/bin/activate
```

## Common commands inside the container

```bash
python hello.py               # run a script
python -c "print('hello')"   # run inline
python -m venv .venv          # create a virtualenv
source .venv/bin/activate     # activate it
deactivate                    # deactivate

pip install <package>         # install a package
pip install -r requirements.txt  # install from file
pip freeze > requirements.txt    # save current packages
pip list                      # list installed packages

python -m pytest              # run tests (if pytest installed)
python -m py_compile hello.py # syntax check without running
```

See `packages.md` for common packages by category.
