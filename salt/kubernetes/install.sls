{% if salt.grains.get('kernel') == "Darwin" %}

# https://minikube.sigs.k8s.io/docs/start
minikube-install:
  pkg.installed:
    - name: minikube

minikube-qemu-socket-vmnet-install:
  pkg.installed:
    - name: socket_vmnet

{% endif %}
