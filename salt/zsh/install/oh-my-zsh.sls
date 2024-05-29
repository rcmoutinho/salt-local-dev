{% from "zsh/map.jinja" import zsh with context %}

{% if salt.grains.get('os') == "Ubuntu" %}

oh-my-zsh-install:
  cmd.script:
    - name: https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh
    - args: --unattended
    - runas: {{ zsh.user.name }}
    - creates: {{ zsh.user.home }}/.oh-my-zsh

{% endif %}
