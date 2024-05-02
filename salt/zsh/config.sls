{% from "personal/map.jinja" import account with context %}
{% from "zsh/map.jinja" import zsh with context %}

{% if salt.grains.get('kernel') == "Linux" %}

zsh-config-shell-as-default-for-{{ account.username }}:
  user.present:
    - name: {{ account.username }}
    - shell: {{ zsh.path }}

{% endif %}
