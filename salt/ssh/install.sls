{% if salt.grains.get('os') == "Ubuntu" %}

ssh-install:
  pkg.installed:
    - name: openssh-server

{% endif %}
