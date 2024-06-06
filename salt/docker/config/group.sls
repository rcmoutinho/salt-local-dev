{% from "docker/map.jinja" import docker with context %}

{% if salt.grains.get('os') == "Ubuntu" %}

docker-config-group:
  group.present:
    - name: docker
    - addusers: {{ docker.addusers }}

docker-config-message:
  test.succeed_with_changes:
    - name: "You may need to log out or restart so the group membership is re-evaluated."
    - onchanges:
      - group: docker-config-group

{% endif %}
