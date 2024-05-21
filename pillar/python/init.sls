#!yaml

python:
  pyenv:
    versions:
      - name: 3.10.14
      - name: 3.11.9
      - name: 3.12.3
        default: true
        pip_pkgs:
          - ruff # https://github.com/astral-sh/ruff
          - uv # https://github.com/astral-sh/uv
