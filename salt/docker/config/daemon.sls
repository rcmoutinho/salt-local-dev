{% if salt.grains.get('kernel') == "Linux" %}

include:
  - docker.service

docker-config-daemon:
  file.managed:
    - name: /etc/docker/daemon.json
    - source: salt://docker/config/files/daemon.json
    - user: root
    - group: root
    - mode: 0644
    - check_cmd: dockerd --validate --config-file # ensure syntax is valid before saving it
    - watch_in:
      - service: docker-service
      - service: containerd-service

{% endif %}
