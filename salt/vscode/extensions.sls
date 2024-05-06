{% from "personal/map.jinja" import account with context %}
{% from "vscode/map.jinja" import extensions with context %}

{% if salt.grains.get('os') == "Ubuntu" %}

## TODO [FUN] Create custom module and state to manage vscode basic CLI or bulk install

  {% for extension in extensions %}

vscode-install-{{ extension }}:
  cmd.run:
    - name: code --install-extension {{ extension }}
    - runas: {{ account.username }}
    - unless:
      - fun: cmd.run
        cmd: code --list-extensions | grep {{ extension }}
        runas: {{ account.username }}
        python_shell: True
        output_loglevel: quiet # prevent printing expected log errors

  {% endfor %}

{% endif %}
