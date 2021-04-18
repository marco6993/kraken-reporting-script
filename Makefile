.PYTHON3:=$(shell PATH='$(subst $(CURDIR)/.venv/bin:,,$(PATH))' which python3)

run-jupyter:
	.venv/bin/jupyter notebook

# install exact package versions from requirements.txt.freeze
install-packages: .venv/bin/python
	.venv/bin/pip install --requirement=requirements.txt.freeze --src=./packages --upgrade --exists-action=w

# update packages from requirements.txt and create requirements.txt.freeze
update-packages:
	make .venv/bin/python
	PYTHONWARNINGS="ignore" .venv/bin/pip install --requirement=requirements.txt --src=./packages --upgrade --exists-action=w
	# write freeze file
    # pkg-ressources is automatically added on ubuntu, but breaks the install.
    # https://stackoverflow.com/a/40167445/1380673
	.venv/bin/pip freeze | grep -v "pkg-resources" > requirements.txt.freeze

# create or update virtualenv
.venv/bin/python:
	# if .venv is already a symlink, don't overwrite it
	mkdir -p .venv
	# go into the new dir and build it there as venv doesn't work if the target is a symlink
	cd .venv && $(.PYTHON3) -m venv --copies --prompt='[$(shell basename `pwd`)/.venv]' .
	# install minimum set of required packages
	# wheel needs to be early to be able to build wheels
	.venv/bin/pip install --upgrade pip wheel requests setuptools
	# Add project root to python path
	echo $(shell pwd) > `echo .venv/lib/*/site-packages`/path.pth
