{% from "personal/map.jinja" import account with context %}

{% if salt.grains.get('kernel') == "Linux" %}

vscode-config-user-settings:
  file.managed:
    - name: {{ account.info.home }}/.config/Code/User/settings.json
    - source: salt://vscode/files/settings.json

vscode-config-user-keybindings:
  file.managed:
    - name: {{ account.info.home }}/.config/Code/User/keybindings.json
    - source: salt://vscode/files/keybindings.json

{% endif %}
