{% if salt.grains.get('kernel') == "Linux" %}

utils-packages-install:
  pkg.installed:
    - pkgs:
      - ca-certificates
      - curl
      - tree
      - vim

{% endif %}
