{% if salt.grains.get('os') == "Ubuntu" %}

utils-packages-install:
  pkg.installed:
    - pkgs:
      - ca-certificates
      - curl
      - tree
      - vim

{% endif %}
