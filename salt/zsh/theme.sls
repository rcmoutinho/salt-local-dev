{% from "personal/map.jinja" import account with context %}

{% if salt.grains.get('os') == "Ubuntu" %}

zsh-theme-powerlevel10k:
  git.latest:
    - name: https://github.com/romkatv/powerlevel10k.git
    - target: {{ account.info.home }}/.oh-my-zsh/custom/themes/powerlevel10k
    - user: {{ account.username }}
    - rev: master
    - branch: master
    - depth: 1 # ensure just the last commit is important

{% endif %}
