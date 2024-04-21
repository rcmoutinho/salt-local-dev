{% if salt.grains.get('kernel') == "Linux" %}

utils-packages-install:
  pkg.installed:
    - pkgs:
      - tree
      - curl

{% endif %}
