{% from "personal/map.jinja" import account with context %}

{% if salt.grains.get('kernel') == "Linux" %}

vscode-install:
  cmd.run:
    - name: snap install --classic code
    - runas: {{ account.username }}
    - unless:
      - fun: cmd.run
        cmd: snap list code
        runas: rcmoutinho
        output_loglevel: quiet # prevent printing expected log errors

{% endif %}
