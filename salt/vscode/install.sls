{% from "vscode/map.jinja" import vscode with context %}

{% if vscode.supported_kernel %}
  {% if salt.grains.get('os') == "Ubuntu" %}

vscode-install:
  cmd.run:
    - name: snap install --classic code
    - runas: {{ vscode.user }}
    - unless:
      - fun: cmd.run
        cmd: snap list code
        runas: {{ vscode.user }}
        output_loglevel: quiet # prevent printing expected log errors

  {% elif salt.grains.get('kernel') == "Darwin" %}

vscode-install:
  pkg.installed:
    - name: homebrew/cask/visual-studio-code

  {% endif %}
{% endif %}
