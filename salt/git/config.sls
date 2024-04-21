{% from "personal/map.jinja" import account with context %}

{% if salt.grains.get('kernel') == "Linux" %}

git-config-gitconfig-file:
  file.managed:
    - name: {{ account.info.home }}/.config/git/config
    - source: salt://git/files/gitconfig.jinja
    - template: jinja
    - makedirs: True
    - user: {{ account.username }}
    - group: {{ account.group }}
    - context:
        name: {{ account.name }}
        email: {{ account.email }}

{% endif %}
