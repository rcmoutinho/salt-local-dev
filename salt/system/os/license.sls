{% from "personal/map.jinja" import license with context %}

{% if salt.grains.get('os') == "Ubuntu" %}

ubuntu-pro-license:
  cmd.run:
    - name: sudo pro attach {{ license.ubuntu_pro }}
    - unless:
      - fun: cmd.run
        cmd: pro status --format json | jq '.attached == true'
        python_shell: True
        output_loglevel: quiet # prevent printing expected log errors

{% endif %}
