{% if salt.grains.get('kernel') == "Linux" %}

salt-minion-conf-cleanup-minion.d:
  file.directory:
    - name: /etc/salt/minion.d
    - clean: True

{% endif %}
