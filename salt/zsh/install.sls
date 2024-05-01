{% if salt.grains.get('kernel') == "Linux" %}

zsh-install-latest:
  pkg.latest:
    - name: zsh

{% endif %}
