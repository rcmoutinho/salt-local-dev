{% from "personal/map.jinja" import account with context %}

{% if salt.grains.get('os') == "Ubuntu" %}

zsh-config-zshrc-file:
  file.managed:
    - name: {{ account.info.home }}/.zshrc
    - source: salt://zsh/config/files/.zshrc.jinja
    - template: jinja
    - user: {{ account.username }}
    - group: {{ account.group }}
    - mode: 0644

{% endif %}
