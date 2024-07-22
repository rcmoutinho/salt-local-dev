{% from "personal/ubuntu.jinja" import ubuntu with context %}

{% if salt.grains.get('os') == "Ubuntu" %}

  {% if ubuntu.license is defined %}
ubuntu-pro-license:
  cmd.run:
    - name: sudo pro attach {{ ubuntu.license }}
    - unless:
      - fun: cmd.run
        cmd: pro status --format json | jq '.attached == true'
        python_shell: True
        output_loglevel: quiet # prevent printing expected log errors
  {% else %}
ubuntu-pro-license-not-defined:
  test.show_notification:
    - text: There is no Ubuntu license defined under 'pillar/personal/init.sls'. Skipping license configuration.
  {% endif %}

{% endif %}
