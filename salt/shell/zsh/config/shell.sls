{% from "shell/zsh/map.jinja" import zsh with context %}

{% if zsh.supported_kernel %}

zsh-config-shell-as-default-for-{{ zsh.user.name }}:
  cmd.run:
    - name: chsh -s {{ zsh.path }} {{ zsh.user.name }}
    - unless:
      - fun: cmd.run
        cmd: grep "^$USER.*{{ zsh.path }}" /etc/passwd
        runas: {{ zsh.user.name }}
        python_shell: True
        output_loglevel: quiet # prevent printing expected log errors

{% endif %}
