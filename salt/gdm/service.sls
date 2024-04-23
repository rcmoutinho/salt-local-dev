{% if salt.grains.get('kernel') == "Linux" %}

gdm3-service:
  service.running:
    - name: gdm3

{% endif %}
