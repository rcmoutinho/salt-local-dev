{% from "personal/map.jinja" import account with context %}

{% if salt.grains.get('os') == "Ubuntu" %}

ssh-folder:
  file.directory:
    - name: {{ account.info.home }}/.ssh
    - user: {{ account.username }}
    - group: {{ account.group }}
    - mode: 0700

ssh-private-key:
  file.managed:
    - name: {{ account.info.home }}/.ssh/id_rsa_{{ account.username }}
    - user: {{ account.username }}
    - group: {{ account.group }}
    - mode: 0600
    - contents: {{ account.ssh_private_key | yaml_encode }}

ssh-private-key-symlink:
  file.symlink:
    - name: {{ account.info.home }}/.ssh/id_rsa
    - target: {{ account.info.home }}/.ssh/id_rsa_{{ account.username }}
    - user: {{ account.username }}
    - group: {{ account.group }}
    - mode: 0600

ssh-public-key:
  file.managed:
    - name: {{ account.info.home }}/.ssh/id_rsa_{{ account.username }}.pub
    - user: {{ account.username }}
    - group: {{ account.group }}
    - mode: 0644
    - contents: {{ account.ssh_public_key }}

ssh-public-key-symlink:
  file.symlink:
    - name: {{ account.info.home }}/.ssh/id_rsa.pub
    - target: {{ account.info.home }}/.ssh/id_rsa_{{ account.username }}.pub
    - user: {{ account.username }}
    - group: {{ account.group }}
    - mode: 0644

{% endif %}
