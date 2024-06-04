{% from "fonts/map.jinja" import fonts, update with context %}

{% if fonts.supported_kernel %}
  {% if salt.grains.get('kernel') == "Linux" %}

    {% for font in fonts.pkgs %}
fonts-install-{{ font.name }}:
  archive.extracted:
    - name: {{ fonts.folder }}/{{ font.name }}
    - source: {{ font.source }}
    - source_hash: {{ font.source_hash }}
    - enforce_toplevel: False
    - user: {{ fonts.user }}
    - group: {{ fonts.group }}
    - enforce_ownership_on: {{ fonts.folder }}
    - overwrite: {{ update }}
    {% endfor %}

fonts-update-cache:
  cmd.run:
    - name: fc-cache --force --verbose
    - runas: {{ fonts.user }}
    - onchanges:
      - archive: fonts-install-*

  {% elif salt.grains.get('kernel') == "Darwin" %}

fonts-install:
  pkg.installed:
    - pkgs: {{ fonts.pkgs }}

  {% endif %}
{% endif %}
