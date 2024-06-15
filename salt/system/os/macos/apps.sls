{% from "system/os/macos/map.jinja" import macos with context %}

{% if salt.grains.get('kernel') == "Darwin" %}

apps-install:
  pkg.installed:
    - pkgs: {{ macos.apps }}

{% endif %}
