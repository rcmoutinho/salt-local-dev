{% from "shell/bash/map.jinja" import bash with context %}

{% if bash.supported_kernel %}

bash-config-profile-file:
  file.managed:
    - name: {{ bash.user.home }}/.profile
    - source: salt://bash/config/files/.profile.jinja
    - template: jinja
    - user: {{ bash.user.name }}
    - group: {{ bash.user.group }}
    - mode: 0644

{% endif %}
