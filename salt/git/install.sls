{% if salt.grains.get('kernel') == "Linux" %}

git-install:
  pkg.latest:
    - name: git-all

{% endif %}
