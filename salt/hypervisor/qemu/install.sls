{% if salt.grains.get('kernel') == "Darwin" %}

# https://www.qemu.org/download/#macos
qemu-install:
  pkg.installed:
    - name: qemu

{% endif %}
