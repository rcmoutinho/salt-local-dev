{% from "shell/bash/map.jinja" import bash with context %}

{% if bash.supported_kernel %}

bash-config-profile-file:
  file.managed:
    - name: {{ bash.user.home }}/.profile
    - source: salt://shell/bash/config/files/.bash.jinja
    - template: jinja
    - user: {{ bash.user.name }}
    - group: {{ bash.user.group }}
    - mode: 0644

bash-config-bashrc-file:
  file.managed:
    - name: {{ bash.user.home }}/.bashrc
    - source: salt://shell/bash/config/files/.bash.jinja
    - template: jinja
    - user: {{ bash.user.name }}
    - group: {{ bash.user.group }}
    - mode: 0644

{% endif %}
