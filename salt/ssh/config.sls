{% from "ssh/map.jinja" import ssh with context %}

{% if ssh.supported %}

ssh-folder:
  file.directory:
    - name: {{ ssh.directory }}
    - user: {{ ssh.user }}
    - group: {{ ssh.group }}
    - mode: 0700

ssh-private-key:
  file.managed:
    - name: {{ ssh.private_key.path }}
    - user: {{ ssh.user }}
    - group: {{ ssh.group }}
    - mode: 0600
    - contents: {{ ssh.private_key.content | yaml_encode }}

ssh-private-key-symlink:
  file.symlink:
    - name: {{ ssh.private_key.link }}
    - target: {{ ssh.private_key.path }}
    - user: {{ ssh.user }}
    - group: {{ ssh.group }}
    - mode: 0600

ssh-public-key:
  file.managed:
    - name: {{ ssh.public_key.path }}
    - user: {{ ssh.user }}
    - group: {{ ssh.group }}
    - mode: 0644
    - contents: {{ ssh.public_key.content }}

ssh-public-key-symlink:
  file.symlink:
    - name: {{ ssh.public_key.link }}
    - target: {{ ssh.public_key.path }}
    - user: {{ ssh.user }}
    - group: {{ ssh.group }}
    - mode: 0644

{% endif %}
