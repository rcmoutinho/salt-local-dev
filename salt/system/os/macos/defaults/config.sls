{% from "system/os/macos/defaults/map.jinja" import defaults with context %}

{% if salt.grains.get('kernel') == "Darwin" %}
  {% for domain_key, domain in defaults.domains.items() %}
    {% for config_key, config in domain.config.items() %}
macos-defaults-{{ domain_key }}-{{ config_key }}:
  cmd.run:
    - name: defaults write {{ domain_key }} {{ config_key }} {{ config.type | default('') }} {{ config.value }};
    - runas: {{ defaults.runas }}
    - unless:
      - fun: cmd.run
        cmd: defaults read {{ domain_key }} {{ config_key }} | grep {{ config.value }}
        runas: {{ defaults.runas }}
        python_shell: True
        output_loglevel: quiet # prevent printing expected log errors
    {% endfor %}

macos-{{ domain_key }}-reset:
  cmd.run:
    - name: killall {{ domain.killall }}
    - onchanges:
      - cmd: macos-defaults-{{ domain_key }}-*
  {% endfor %}
{% endif %}
