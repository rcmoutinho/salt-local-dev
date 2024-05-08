{% from "personal/map.jinja" import account with context %}

{% if salt.grains.get('os') == "Ubuntu" %}

zsh-theme-powerlevel10k-install:
  git.latest:
    - name: https://github.com/romkatv/powerlevel10k.git
    - target: {{ account.info.home }}/.oh-my-zsh/custom/themes/powerlevel10k
    - user: {{ account.username }}
    - rev: master
    - branch: master
    - depth: 1 # ensure just the last commit is important

zsh-theme-powerlevel10k-config:
  file.managed:
    - name: {{ account.info.home }}/.p10k.zsh
    - source: salt://zsh/theme/files/.p10k.zsh
    - user: {{ account.username }}
    - group: {{ account.group }}
    - mode: 0644

{% endif %}
