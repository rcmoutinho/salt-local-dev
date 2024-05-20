{% from "python/pyenv/map.jinja" import pyenv with context %}

{% if salt.grains.get('os') == "Ubuntu" %}

python-pyenv-doctor-check:
  test.fail_without_changes:
    - name: "There is an issue when running pyenv doctor. Check the installation and dependencies."
    - unless:
      - fun: cmd.run
        cmd: pyenv doctor
        runas: {{ pyenv.user }}
        output_loglevel: quiet # prevent printing expected log errors
        prepend_path: {{ pyenv.path }}

  {% for version in pyenv.versions %}
python-pyenv-versions-install-{{ version.name }}:
  pyenv.installed:
    - name: {{ version.name }}
    - user: {{ pyenv.user }}
    - default: {{ version.default | default(false) }}
    - require:
      - test: python-pyenv-doctor-check
  {% endfor %}

{% endif %}
