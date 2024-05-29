{% from "zsh/map.jinja" import zsh with context %}

{% if zsh.supported_kernel %}

zsh-theme-powerlevel10k-install:
  git.latest:
    - name: https://github.com/romkatv/powerlevel10k.git
    - target: {{ zsh.user.home }}/.oh-my-zsh/custom/themes/powerlevel10k
    - user: {{ zsh.user.name }}
    - rev: v1.20.0
    - depth: 1 # ensure just the last commit is important

zsh-theme-powerlevel10k-config:
  file.managed:
    - name: {{ zsh.user.home }}/.p10k.zsh
    - source: salt://zsh/theme/files/.p10k.zsh
    - user: {{ zsh.user.name }}
    - group: {{ zsh.user.group }}
    - mode: 0644

{% endif %}
