{% from "personal/map.jinja" import account with context %}

{% if salt.grains.get('os') == "Ubuntu" %}

# https://blog.afoolishmanifesto.com/posts/checking-sudoers-with-visudo-in-saltstack/
sudoers-config-salt-local-dev:
  file.managed:
    - name: /etc/sudoers.d/salt-local-dev
    - user: root
    - group: root
    - mode: 0440
    - check_cmd: /usr/sbin/visudo -c -f # ensure syntax is valid before saving it
    - contents: "{{ account.username }}  ALL=(ALL)  NOPASSWD:ALL"

{% endif %}
