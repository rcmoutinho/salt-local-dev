{% from "personal/map.jinja" import account with context %}
{% from "fonts/map.jinja" import nerd_fonts, update with context %}

{% if salt.grains.get('os') == "Ubuntu" %}

  {% for font in nerd_fonts %}
fonts-install-nerd-fonts-{{ font.name }}:
  archive.extracted:
    - name: {{ account.info.home }}/.local/share/fonts/{{ font.name }}
    - source: {{ font.source }}
    - source_hash: {{ font.source_hash }}
    - enforce_toplevel: False
    - user: {{ account.username }}
    - group: {{ account.group }}
    - enforce_ownership_on: {{ account.info.home }}/.local/share/fonts/
    - overwrite: {{ update }}
  {% endfor %}

fonts-update-cache:
  cmd.run:
    - name: fc-cache --force --verbose
    - runas: {{ account.username }}
    - onchanges:
      - archive: fonts-install-nerd-fonts-*

{% endif %}
