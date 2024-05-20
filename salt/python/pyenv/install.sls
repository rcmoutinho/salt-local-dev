{% from "python/pyenv/map.jinja" import pyenv with context %}

{% if salt.grains.get('os') == "Ubuntu" %}

# https://github.com/pyenv/pyenv/wiki#suggested-build-environment
# https://realpython.com/intro-to-pyenv/
python-pyenv-dependencies:
  pkg.installed:
    - pkgs:
      - make
      - build-essential
      - libssl-dev
      - zlib1g-dev
      - libbz2-dev
      - libreadline-dev
      - libsqlite3-dev
      - llvm
      - libncurses5-dev
      - libncursesw5-dev
      - xz-utils # https://askubuntu.com/questions/1509015/is-ubuntu-affected-by-the-xz-backdoor-compromise
      - tk-dev
      - libffi-dev
      - liblzma-dev
      - python3-openssl

python-pyenv-install:
  git.latest:
    - name: https://github.com/pyenv/pyenv.git
    - target: {{ pyenv.path.root }}
    - user: {{ pyenv.user }}
    - rev: v2.4.1
    - depth: 1 # ensure just the last commit is important

{% endif %}
