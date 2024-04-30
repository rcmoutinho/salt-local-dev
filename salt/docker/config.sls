{% from "personal/map.jinja" import account with context %}

{% if salt.grains.get('kernel') == "Linux" %}

include:
  - .service

docker-config-group:
  group.present:
    - name: docker
    - addusers:
      - {{ account.username }}

docker-config-message:
  test.succeed_with_changes:
    - name: "You may need to log out or restart so the group membership is re-evaluated."
    - onchanges:
      - group: docker-config-group

docker-config-daemon:
  file.managed:
    - name: /etc/docker/daemon.json
    - source: salt://docker/files/daemon.json
    - user: root
    - group: root
    - mode: 0644
    - check_cmd: dockerd --validate --config-file # ensure syntax is valid before saving it
    - watch_in:
      - service: docker-service
      - service: containerd-service

{% endif %}
