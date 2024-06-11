{% from "system/os/macos/map.jinja" import macos with context %}

{% if salt.grains.get('kernel') == "Darwin" %}

# https://github.com/kcrawford/dockutil
dockutil-cli-install:
  pkg.installed:
    - name: dockutil

  {% for app in macos.dock.remove_default %}

dockutil-remove-{{ app }}:
  cmd.run:
    - name: dockutil --remove {{ app }} --no-restart
    - runas: {{ macos.runas }}
    - onlyif:
      - fun: cmd.run
        cmd: dockutil --find {{ app }}
        runas: {{ macos.runas }}
        output_loglevel: quiet # prevent printing expected log errors
    - require:
      - pkg: dockutil-cli-install

  {% endfor %}

{# Ensure the define section will get the correct order after removing apps #}
dockutil-restart-dock-after-remove:
  cmd.run:
    - name: killall Dock
    - onchanges:
      - cmd: dockutil-remove-*

  {% for app in macos.dock.define %}

dockutil-define-{{ app }}:
  cmd.run:
    - name: dockutil --add {{ app }}
    - runas: {{ macos.runas }}
    - unless:
      - fun: cmd.run
        cmd: dockutil --find {{ app }} | grep 'at slot {{ loop.index }}'
        runas: {{ macos.runas }}
        python_shell: True
        output_loglevel: quiet # prevent printing expected log errors
    - require:
      - pkg: dockutil-cli-install

  {% endfor %}

{% endif %}
