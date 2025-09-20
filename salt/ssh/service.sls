{% if salt.grains.get('os') == "Ubuntu" %}

ssh-service:
  service.running:
    - name: ssh
    - enable: True

{% endif %}
