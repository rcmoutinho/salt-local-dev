{% from "zsh/map.jinja" import zsh with context %}

{% if salt.grains.get('os') == "Ubuntu" %}

{% for plugin in zsh.plugins.custom %}
zsh-plugin-oh-my-zsh-install-{{ plugin.name }}:
  git.latest:
    - name: {{ plugin.url }}
    - target: {{ zsh.user.home }}/.oh-my-zsh/custom/plugins/{{ plugin.name }}
    - user: {{ zsh.user.name }}
    - rev: {{ plugin.release }}
    - depth: 1 # ensure just the last commit is important
{% endfor %}

{% endif %}
