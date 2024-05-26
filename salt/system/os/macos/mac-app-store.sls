{% from "system/os/macos/map.jinja" import mas with context %}

{% if salt.grains.get('kernel') == "Darwin" %}

# https://github.com/mas-cli/mas
mac-app-store-cli-install:
  pkg.installed:
    - name: mas

  {% for app in mas.install %}

mac-app-store-install-{{ app }}:
  cmd.run:
    - name: mas install {{ app }}
    - runas: {{ mas.runas }}
    - unless:
      - fun: cmd.run
        cmd: mas list | grep {{ app }}
        runas: {{ mas.runas }}
        python_shell: True
        output_loglevel: quiet # prevent printing expected log errors
    - require:
      - pkg: mac-app-store-cli-install

  {% endfor %}

{% endif %}
