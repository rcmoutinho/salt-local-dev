{% from "git/map.jinja" import git with context %}

{% if git.supported_kernel %}

git-config-gitconfig-file:
  file.managed:
    - name: {{ git.config.file.path }}
    - source: salt://git/files/gitconfig.jinja
    - template: jinja
    - makedirs: True
    - user: {{ git.config.file.user }}
    - group: {{ git.config.file.group }}
    - context:
        name: {{ git.config.content.name }}
        email: {{ git.config.content.email }}

{% endif %}
