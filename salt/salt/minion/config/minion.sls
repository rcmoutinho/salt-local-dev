{% if salt.grains.get('os') == "Ubuntu" %}

salt-minion-conf-base:
  file.managed:
    - name: /etc/salt/minion.d/minion.conf
    - source: salt://salt/minion/config/files/minion.d/minion.conf.jinja
    - template: jinja

{% endif %}
