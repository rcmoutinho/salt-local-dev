{% if salt.grains.get('os') == "Ubuntu" %}

# https://support.1password.com/install-linux/#debian-or-ubuntu
# https://www.digitalocean.com/community/tutorials/how-to-handle-apt-key-and-add-apt-repository-deprecation-using-gpg-to-add-external-repositories-on-ubuntu-22-04

1password-add-apt-gpg-key: # favor gpg considering apt-key is depricated
  cmd.run:
    - name: curl -sS https://downloads.1password.com/linux/keys/1password.asc | sudo gpg --dearmor --output /usr/share/keyrings/1password-archive-keyring.gpg
    - creates: /usr/share/keyrings/1password-archive-keyring.gpg

1password-add-debsig-verify-policy-pol:
  file.managed:
    - name: /etc/debsig/policies/AC2D62742012EA22/1password.pol
    - source: https://downloads.1password.com/linux/debian/debsig/1password.pol
    - source_hash: c123179ce41eaa781777b9b47d46f18b # curl -sS https://downloads.1password.com/linux/debian/debsig/1password.pol | md5sum
    - user: root
    - group: root
    - mode: 0644
    - makedirs: True

1password-add-debsig-verify-policy-gpg:
  file.directory:
    - name: /usr/share/debsig/keyrings/AC2D62742012EA22
    - user: root
    - group: root
    - mode: 0744
    - makedirs: True
  cmd.run:
    - name: curl -sS https://downloads.1password.com/linux/keys/1password.asc | sudo gpg --dearmor --output /usr/share/debsig/keyrings/AC2D62742012EA22/debsig.gpg
    - creates: /usr/share/debsig/keyrings/AC2D62742012EA22/debsig.gpg

1password-add-apt-repository:
  pkgrepo.managed:
    - name: deb [arch={{ salt.grains.get('osarch') }} signed-by=/usr/share/keyrings/1password-archive-keyring.gpg] https://downloads.1password.com/linux/debian/amd64 stable main
    - file: /etc/apt/sources.list.d/1password.list
    - refresh: True
    - require_in:
      - pkg: 1password-install-latest

1password-install-latest:
  pkg.latest:
    - name: 1password

{% endif %}
