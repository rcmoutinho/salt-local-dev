{% if salt.grains.get('os') == "Ubuntu" %}

virtualbox-config-vboxdrv:
  cmd.run:
    - name: /sbin/vboxconfig
    - onlyif:
      - fun: cmd.run
        cmd: VBoxManage --version | grep 'The vboxdrv kernel module is not loaded'
        python_shell: True
        output_loglevel: quiet # prevent printing expected log errors

{% endif %}
