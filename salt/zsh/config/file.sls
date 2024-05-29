{% from "zsh/map.jinja" import zsh with context %}

{% if salt.grains.get('os') == "Ubuntu" %}

zsh-config-zshrc-file:
  file.managed:
    - name: {{ zsh.user.home }}/.zshrc
    - source: salt://zsh/config/files/.zshrc.jinja
    - template: jinja
    - user: {{ zsh.user.name }}
    - group: {{ zsh.user.group }}
    - mode: 0644
    - context:
        plugins: {{ zsh.plugins.load }}

{% endif %}
