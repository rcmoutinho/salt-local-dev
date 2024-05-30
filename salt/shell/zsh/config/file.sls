{% from "shell/zsh/map.jinja" import zsh with context %}

{% if zsh.supported_kernel %}

zsh-config-zshrc-file:
  file.managed:
    - name: {{ zsh.user.home }}/.zshrc
    - source: salt://shell/zsh/config/files/.zshrc.jinja
    - template: jinja
    - user: {{ zsh.user.name }}
    - group: {{ zsh.user.group }}
    - mode: 0644
    - context:
        plugins: {{ zsh.plugins.load }}

{% endif %}
