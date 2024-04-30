{% if salt.grains.get('kernel') == "Linux" %}

docker-service:
  service.running:
    - name: docker
    - enable: True

containerd-service:
  service.running:
    - name: containerd
    - enable: True

{% endif %}
