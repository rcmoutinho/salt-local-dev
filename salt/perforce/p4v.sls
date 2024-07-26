{% from "perforce/map.jinja" import perforce, update with context %}

{% if perforce.supported_kernel %}
  {% if salt.grains.get('os') == "Ubuntu" %}

perforce-p4v-dependencies:
  pkg.installed:
    - pkgs:
      - libxcb-cursor0

perforce-p4v-install:
  archive.extracted:
    - name: {{ perforce.p4v.path }}
    - source: {{ perforce.p4v.source }}
    - skip_verify: True
    - overwrite: {{ update }}

    {% for link, target in perforce.p4v.symlinks.items() %}
perforce-p4v-symlink-{{ link }}:
  file.symlink:
    - name: {{ link }}
    - target: {{ target }}
    - user: root
    - group: root
    - mode: 0755
    {% endfor %}

  {% elif salt.grains.get('kernel') == "Darwin" %}

# https://formulae.brew.sh/cask/p4v
perforce-p4v-install:
  pkg.installed:
    - name: {{ perforce.p4v.pkg }}

  {% endif %}
{% endif %}
