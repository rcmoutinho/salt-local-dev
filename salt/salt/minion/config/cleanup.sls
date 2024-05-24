{% from "salt/minion/config/map.jinja" import config with context %}

{% if config.supported_kernel %}

salt-minion-conf-cleanup-minion.d:
  file.directory:
    - name: {{ config.minion.directory }}
    - clean: True

{% endif %}
