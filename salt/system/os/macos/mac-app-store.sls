{% from "system/os/macos/map.jinja" import macos with context %}

{% if salt.grains.get('kernel') == "Darwin" %}

# https://github.com/mas-cli/mas
mac-app-store-cli-install:
  pkg.installed:
    - name: mas

  {% for app in macos.mas %}

mac-app-store-install-{{ app }}:
  cmd.run:
    - name: /opt/homebrew/bin/mas install {{ app }}
    - runas: {{ macos.runas }}
    - unless:
      - fun: cmd.run
        cmd: /opt/homebrew/bin/mas list | grep {{ app }}
        runas: {{ macos.runas }}
        python_shell: True
        output_loglevel: quiet # prevent printing expected log errors
    - require:
      - pkg: mac-app-store-cli-install

  {% endfor %}

{% endif %}
