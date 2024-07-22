{% from "vscode/map.jinja" import vscode with context %}

include:
  - .install

{% if vscode.supported_kernel %}

## TODO [FUN] Create custom module and state to manage vscode basic CLI or bulk install

  {% for extension in vscode.extensions %}

vscode-install-{{ extension }}:
  cmd.run:
    - name: code --install-extension {{ extension }}
    - runas: {{ vscode.user }}
    - unless:
      - fun: cmd.run
        cmd: code --list-extensions | grep {{ extension }}
        runas: {{ vscode.user }}
        python_shell: True
        output_loglevel: quiet # prevent printing expected log errors
    - require:
      - vscode-install

  {% endfor %}

{% endif %}
