{% from "personal/map.jinja" import account with context %}
{% from "zsh/map.jinja" import zsh with context %}

{% if salt.grains.get('os') == "Ubuntu" %}

zsh-config-shell-as-default-for-{{ account.username }}:
  cmd.run:
    - name: chsh -s {{ zsh.path }} {{ account.username }}
    - unless:
      - fun: cmd.run
        cmd: grep "^$USER.*{{ zsh.path }}" /etc/passwd
        runas: {{ account.username }}
        python_shell: True
        output_loglevel: quiet # prevent printing expected log errors

{% endif %}
