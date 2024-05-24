{% from "salt/minion/config/map.jinja" import config with context %}

{% if config.supported_kernel %}

salt-minion-conf-base:
  file.managed:
    - name: {{ config.minion.file }}
    - source: {{ config.minion.source }}
    - template: jinja

{% endif %}
