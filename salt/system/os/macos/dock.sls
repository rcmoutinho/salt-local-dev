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

# Ensure the define section will get the correct order after removing apps
dockutil-restart-dock-after-remove:
  cmd.run:
    - name: killall Dock
    - onchanges:
      - cmd: dockutil-remove-*

  {% for app in macos.dock.define.apps %}

dockutil-define-apps-{{ app }}:
  cmd.run:
    # First, try to add. If it exists, but in the wrong position, move it to the desired place.
    - name: |
        dockutil --add "{{ app }}" --position {{ loop.index }} --section apps || \
        dockutil --move "{{ app }}" --position {{ loop.index }} --section apps
    - runas: {{ macos.runas }}
    - unless:
      - fun: cmd.run
        cmd: dockutil --find "{{ app }}" | grep 'at slot {{ loop.index }}'
        runas: {{ macos.runas }}
        python_shell: True
        output_loglevel: quiet # prevent printing expected log errors
    - require:
      - pkg: dockutil-cli-install

  {% endfor %}

  {% for app in macos.dock.define.others %}
    {% set item = app | regex_replace('^~', macos.homedir) %}

dockutil-define-others-{{ item }}:
  cmd.run:
    # First, try to add. If it exists, but in the wrong position, move it to the desired place.
    - name: |
        dockutil --add "{{ item }}" --position {{ loop.index }} --section others || \
        dockutil --move "{{ item }}" --position {{ loop.index }} --section others
    - runas: {{ macos.runas }}
    - unless:
      - fun: cmd.run
        cmd: dockutil --find "{{ item }}" | grep 'at slot {{ loop.index }}'
        runas: {{ macos.runas }}
        python_shell: True
        output_loglevel: quiet # prevent printing expected log errors
    - require:
      - pkg: dockutil-cli-install

  {% endfor %}

{% endif %}
