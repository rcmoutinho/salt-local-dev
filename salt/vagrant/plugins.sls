{% from "vagrant/map.jinja" import vagrant with context %}

{% if vagrant.supported_kernel %}

  {% for plugin in vagrant.plugins %}

vagrant-install-{{ plugin }}:
  cmd.run:
    - name: vagrant plugin install --no-tty {{ plugin }}
    - runas: {{ vagrant.user }}
    - unless:
      - fun: cmd.run
        cmd: vagrant plugin list | grep {{ plugin }}
        runas: {{ vagrant.user }}
        python_shell: True
        output_loglevel: quiet # prevent printing expected log errors

  {% endfor %}

{% endif %}
