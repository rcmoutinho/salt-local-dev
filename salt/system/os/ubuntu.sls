{% from "personal/ubuntu.jinja" import ubuntu with context %}

{% if salt.grains.get('os') == "Ubuntu" %}

ubuntu-pro-license:
  cmd.run:
    - name: sudo pro attach {{ ubuntu.license }}
    - unless:
      - fun: cmd.run
        cmd: pro status --format json | jq '.attached == true'
        python_shell: True
        output_loglevel: quiet # prevent printing expected log errors

{% endif %}
