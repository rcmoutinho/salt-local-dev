{% from "shell/zsh/map.jinja" import zsh with context %}

{% if zsh.supported_kernel %}

zsh-install:
  pkg.installed:
    - pkgs: {{ zsh.pkgs }}

{% endif %}
