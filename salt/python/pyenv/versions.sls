{% from "python/pyenv/map.jinja" import pyenv with context %}

{% if pyenv.supported_kernel %}

python-pyenv-doctor-check:
  test.fail_without_changes:
    - name: "There is an issue when running pyenv doctor. Check the installation and dependencies."
    - unless:
      - fun: cmd.run
        cmd: pyenv doctor
        runas: {{ pyenv.user }}
        output_loglevel: quiet # prevent printing expected log errors
        prepend_path: {{ pyenv.path.bin }}

  {% for version in pyenv.python_versions %}
python-pyenv-versions-install-{{ version.name }}:
  cmd.run:
    - name: pyenv install {{ version.name }}
    - runas: {{ pyenv.user }}
    - unless:
      - fun: cmd.run
        cmd: pyenv versions | grep {{ version.name }}
        runas: {{ pyenv.user }}
        python_shell: True
        output_loglevel: quiet # prevent printing expected log errors
        prepend_path: {{ pyenv.path.bin }}
    - require:
      - test: python-pyenv-doctor-check

    {% if version.default | default(false) %}
python-pyenv-versions-install-{{ version.name }}-default:
  cmd.run:
    - name: pyenv global {{ version.name }}
    - runas: {{ pyenv.user }}
    - unless:
      - fun: cmd.run
        cmd: pyenv global | grep {{ version.name }}
        runas: {{ pyenv.user }}
        python_shell: True
        output_loglevel: quiet # prevent printing expected log errors
        prepend_path: {{ pyenv.path.bin }}
    - require:
      - cmd: python-pyenv-versions-install-{{ version.name }}
    {% endif %}

    {% if version.pip_pkgs is defined %}
python-pyenv-versions-install-{{ version.name }}-pip:
  pip.installed:
    - pkgs: {{ version.pip_pkgs }}
    - user: {{ pyenv.user }}
    - bin_env: {{ pyenv.path.root }}/versions/{{ version.name }}/bin
    - require:
      - cmd: python-pyenv-versions-install-{{ version.name }}
    {% endif %}
  {% endfor %}

{% endif %}
