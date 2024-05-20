{% from "python/pyenv/map.jinja" import pyenv with context %}

{% if salt.grains.get('os') == "Ubuntu" %}

python-pyenv-install-plugin-pyenv-doctor:
  git.latest:
    - name: https://github.com/pyenv/pyenv-doctor.git
    - target: {{ pyenv.path.plugins }}/pyenv-doctor
    - user: {{ pyenv.user }}

python-pyenv-install-plugin-pyenv-update:
  git.latest:
    - name: https://github.com/pyenv/pyenv-update.git
    - target: {{ pyenv.path.plugins }}/pyenv-update
    - user: {{ pyenv.user }}

python-pyenv-install-plugin-pyenv-virtualenv:
  git.latest:
    - name: https://github.com/pyenv/pyenv-virtualenv.git
    - target: {{ pyenv.path.plugins }}/pyenv-virtualenv
    - user: {{ pyenv.user }}
    - rev: v1.2.3
    - depth: 1 # ensure just the last commit is important

{% endif %}
