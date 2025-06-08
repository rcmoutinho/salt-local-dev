{% from "personal/map.jinja" import account with context %}

{% if salt.grains.get('kernel') == "Darwin" %}

include:
  - sudoers

homebrew-install: # https://github.com/Homebrew/install
  cmd.run:
    - name: 'NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"'
    - runas: {{ account.username }}
    - unless:
      - fun: cmd.run
        cmd: /opt/homebrew/bin/brew --version
        output_loglevel: quiet # prevent printing expected log errors

{% endif %}
