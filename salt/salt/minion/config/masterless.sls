{% if salt.grains.get('kernel') == "Linux" %}

salt-minion-conf-masterless:
  file.managed:
    - name: /etc/salt/minion.d/masterless.conf
    - source: salt://salt/minion/config/files/minion.d/masterless.conf

{% endif %}
