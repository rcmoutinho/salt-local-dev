{% if salt.grains.get('kernel') == "Darwin" %}

mac-app-store-cli-install:
  pkg.latest:
    - name: mas

{% endif %}
