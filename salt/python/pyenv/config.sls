{% from "python/pyenv/map.jinja" import pyenv with context %}

{% if pyenv.supported_kernel %}

pyenv-conf-salt-minion:
  file.managed:
    - name: {{ pyenv.minion_conf_file }}
    - contents: |
        pyenv:
          root: {{ pyenv.path.root }}

  {% if salt.grains.get('kernel') == "Darwin" %}

pyenv-conf-root-symlink:
  file.symlink:
    - name: {{ pyenv.path.root }}
    - version: {{ pyenv.path.brew_version }}

  {% endif %}

{% endif %}
