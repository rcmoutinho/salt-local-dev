{% from "personal/map.jinja" import account with context %}

{% if salt.grains.get('kernel') == "Darwin" %}

include:
  - sudoers

homebrew-install: # https://github.com/Homebrew/install
  cmd.script:
    - name: https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh
    - shell: /bin/bash
    - runas: {{ account.username }}
    - creates: /usr/local/bin/brew
    - env:
      - NONINTERACTIVE: 1

{% endif %}
