{% from "zsh/map.jinja" import zsh with context %}

{% if zsh.supported_kernel %}

oh-my-zsh-install:
  cmd.script:
    - name: https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh
    - args: --unattended
    - shell: {{ zsh.sh_script_shell }}
    - runas: {{ zsh.user.name }}
    - creates: {{ zsh.user.home }}/.oh-my-zsh

{% endif %}
