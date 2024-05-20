{% if salt.grains.get('os') == "Ubuntu" %}

utils-packages-install:
  pkg.installed:
    - pkgs:
      - ca-certificates
      - wget
      - curl
      - jq
      - tree
      - vim

{% endif %}
