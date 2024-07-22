{% from "hypervisor/virtualbox/map.jinja" import virtualbox with context %}

{% if salt.grains.get('os') == "Ubuntu" %}

virtualbox-config-vboxdrv:
  cmd.run:
    - name: /sbin/vboxconfig
    - onlyif:
      - fun: cmd.run
        cmd: VBoxManage --version | grep 'The vboxdrv kernel module is not loaded'
        python_shell: True
        output_loglevel: quiet # prevent printing expected log errors

virtualbox-config-group:
  group.present:
    - name: vboxusers
    - addusers: {{ virtualbox.addusers }}

virtualbox-config-message:
  test.succeed_with_changes:
    - name: "You may need to log out or restart so the group membership is re-evaluated."
    - onchanges:
      - group: virtualbox-config-group

{% endif %}
