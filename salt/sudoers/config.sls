{% from "sudoers/map.jinja" import sudoers with context %}

{% if sudoers.supported_kernel %}

# https://blog.afoolishmanifesto.com/posts/checking-sudoers-with-visudo-in-saltstack/
sudoers-config-salt-local-dev:
  file.managed:
    - name: /etc/sudoers.d/salt-local-dev
    - user: {{ sudoers.user }}
    - group: {{ sudoers.group }}
    - mode: 0440
    - check_cmd: /usr/sbin/visudo -c -f # ensure syntax is valid before saving it
    - contents: {{ sudoers.contents }}

{% endif %}
