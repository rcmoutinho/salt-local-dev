{% from "vscode/map.jinja" import vscode with context %}

{% if vscode.supported_kernel %}

vscode-config-user-settings:
  file.managed:
    - name: {{ vscode.home }}/User/settings.json
    - source: salt://vscode/files/settings.json

vscode-config-user-keybindings:
  file.managed:
    - name: {{ vscode.home }}/User/keybindings.json
    - source: salt://vscode/files/keybindings.json

{% endif %}
