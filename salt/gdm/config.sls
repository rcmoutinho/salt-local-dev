{% set restart_service_on_changes = salt.pillar.get('restart_service_on_changes', False) %}

{% if salt.grains.get('kernel') == "Linux" %}

include:
  - gdm.service

# About GDM3: https://askubuntu.com/a/829110
# https://askubuntu.com/questions/1353360/ubuntu-21-04-shutter-did-not-work-without-x11-server

gdm3-config-custom:
  file.managed:
    - name: /etc/gdm3/custom.conf
    - source: salt://gdm/files/custom.conf.jinja
    - template: jinja
    - user: root
    - group: root
    - mode: 0644
    {% if restart_service_on_changes %}
    - watch_in:
      - service: gdm3-service
    {% endif %}

gdm3-message-config-changes:
  test.succeed_with_changes:
    - name: "The gdm3 configuration has changed. To apply all changes, it's recommended that the system be restarted."
    - onchanges:
      - file: gdm3-config-custom

{% endif %}
