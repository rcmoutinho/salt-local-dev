{% from "salt/minion/config/map.jinja" import config with context %}

{% if config.supported_kernel %}

salt-minion-default-absent:
  file.absent:
    - name: {{ config.absent.minion_default }}

salt-minion-conf-masterless:
  file.managed:
    - name: {{ config.masterless.file }}
    - source: {{ config.masterless.source }}

salt-minion-conf-base:
  file.managed:
    - name: {{ config.minion.file }}
    - source: {{ config.minion.source }}
    - template: jinja

{% endif %}
