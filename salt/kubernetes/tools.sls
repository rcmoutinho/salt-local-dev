{% if salt.grains.get('kernel') == "Darwin" %}

# https://k9scli.io/topics/install/
k9scli-install:
  pkg.installed:
    - name: derailed/k9s/k9s

{% endif %}
