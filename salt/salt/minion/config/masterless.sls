{% if salt.grains.get('os') == "Ubuntu" %}

salt-minion-conf-masterless:
  file.managed:
    - name: /etc/salt/minion.d/masterless.conf
    - source: salt://salt/minion/config/files/minion.d/masterless.conf

{% endif %}
