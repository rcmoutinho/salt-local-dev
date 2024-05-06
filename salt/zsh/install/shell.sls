{% if salt.grains.get('os') == "Ubuntu" %}

zsh-install-latest:
  pkg.latest:
    - name: zsh

{% endif %}
