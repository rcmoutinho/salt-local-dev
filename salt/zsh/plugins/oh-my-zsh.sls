{% from "personal/map.jinja" import account with context %}
{% from "zsh/plugins/map.jinja" import custom_plugins with context %}

{% if salt.grains.get('os') == "Ubuntu" %}

{% for plugin in custom_plugins %}
zsh-plugin-oh-my-zsh-install-{{ plugin.name }}:
  git.latest:
    - name: {{ plugin.url }}
    - target: {{ account.info.home }}/.oh-my-zsh/custom/plugins/{{ plugin.name }}
    - user: {{ account.username }}
    - rev: {{ plugin.release }}
    - depth: 1 # ensure just the last commit is important
{% endfor %}

{% endif %}
