{% if salt.grains.get('os') == "Ubuntu" %}

docker-service:
  service.running:
    - name: docker
    - enable: True

containerd-service:
  service.running:
    - name: containerd
    - enable: True

{% endif %}
