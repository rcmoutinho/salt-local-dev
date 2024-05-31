{% from "python/pyenv/map.jinja" import pyenv with context %}

{% if pyenv.supported_kernel %}

salt-minion-conf-pyenv:
  file.managed:
    - name: {{ pyenv.minion_conf_file }}
    - contents: |
        pyenv:
          root: {{ pyenv.path.root }}

{% endif %}
