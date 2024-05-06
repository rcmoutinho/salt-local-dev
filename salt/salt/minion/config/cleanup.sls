{% if salt.grains.get('os') == "Ubuntu" %}

salt-minion-conf-cleanup-minion.d:
  file.directory:
    - name: /etc/salt/minion.d
    - clean: True

{% endif %}
