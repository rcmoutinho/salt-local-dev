{% if salt.grains.get('os') == "Ubuntu" %}

git-install:
  pkg.latest:
    - name: git-all

{% endif %}
