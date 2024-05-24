{% from "salt/minion/config/map.jinja" import config with context %}

{% if config.supported_kernel %}

salt-minion-conf-masterless:
  file.managed:
    - name: {{ config.masterless.file }}
    - source: {{ config.masterless.source }}

{% endif %}
