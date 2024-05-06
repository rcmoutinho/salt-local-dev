{% if salt.grains.get('os') == "Ubuntu" %}

gdm3-service:
  service.running:
    - name: gdm3

{% endif %}
