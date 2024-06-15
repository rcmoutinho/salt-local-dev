{% from "python/pyenv/map.jinja" import pyenv with context %}

{% if pyenv.supported_kernel %}

python-pyenv-doctor-check:
  test.fail_without_changes:
    - name: "There is an issue when running pyenv doctor. Check the installation and dependencies."
    - unless:
      - fun: cmd.run
        cmd: pyenv doctor
        runas: {{ pyenv.runas | default() }}
        output_loglevel: quiet # prevent printing expected log errors
        prepend_path: {{ pyenv.path.bin }}

  {% for version in pyenv.python_versions %}
python-pyenv-versions-install-{{ version.name }}:
  pyenv.installed:
    - name: {{ version.name }}
    - user: {{ pyenv.runas | default() }} # macOS only work when using salt process user (root in this case)
    - default: {{ version.default | default(false) }}
    - require:
      - test: python-pyenv-doctor-check

    {% if version.pip_pkgs is defined %}
python-pyenv-versions-install-{{ version.name }}-pip:
  pip.installed:
    - pkgs: {{ version.pip_pkgs }}
    - user: {{ pyenv.user }}
    - bin_env: {{ pyenv.path.root }}/versions/{{ version.name }}/bin
    - require:
      - pyenv: python-pyenv-versions-install-{{ version.name }}
    {% endif %}
  {% endfor %}

{# Ensure folder ownership to fix macOS runas limitation #}
python-pyenv-versions-permissions:
  file.directory:
    - name: {{ pyenv.path.root }}/versions
    - user: {{ pyenv.user }}
    - recurse:
      - user

{% endif %}
