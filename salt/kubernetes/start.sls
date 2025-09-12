{% from "personal/map.jinja" import account with context %}

{% if salt.grains.get('kernel') == "Darwin" %}

start-socket-vmnet-service:
  cmd.run:
    - name: /opt/homebrew/bin/brew services start socket_vmnet

# start-minikube:
#   cmd.run:
#     - name: /opt/homebrew/bin/minikube start --driver qemu --network socket_vmnet
#     - runas: {{ account.username }}

{% endif %}
