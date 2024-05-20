{% from "personal/map.jinja" import account with context %}

{% if salt.grains.get('os') == "Ubuntu" %}

python-pyenv-install-plugin-pyenv-doctor:
  git.latest:
    - name: https://github.com/pyenv/pyenv-doctor.git
    - target: {{ account.info.home }}/.pyenv/plugins/pyenv-doctor
    - user: {{ account.username }}

python-pyenv-install-plugin-pyenv-update:
  git.latest:
    - name: https://github.com/pyenv/pyenv-update.git
    - target: {{ account.info.home }}/.pyenv/plugins/pyenv-update
    - user: {{ account.username }}

python-pyenv-install-plugin-pyenv-virtualenv:
  git.latest:
    - name: https://github.com/pyenv/pyenv-virtualenv.git
    - target: {{ account.info.home }}/.pyenv/plugins/pyenv-virtualenv
    - user: {{ account.username }}
    - rev: v1.2.3
    - depth: 1 # ensure just the last commit is important

{% endif %}
