{% if salt.grains.get('os') == "Ubuntu" %}

virtualbox-add-apt-gpg-key: # favor gpg considering apt-key is depricated
  cmd.run:
    - name: curl -sS https://www.virtualbox.org/download/oracle_vbox_2016.asc | sudo gpg --yes --dearmor --output /usr/share/keyrings/oracle-virtualbox-2016.gpg
    - creates: /usr/share/keyrings/oracle-virtualbox-2016.gpg

virtualbox-add-apt-repository:
  pkgrepo.managed:
    - name: deb [arch={{ salt.grains.get('osarch') }} signed-by=/usr/share/keyrings/oracle-virtualbox-2016.gpg] https://download.virtualbox.org/virtualbox/debian {{ salt.grains.get('oscodename') }} contrib
    - file: /etc/apt/sources.list.d/virtualbox.list
    - refresh: True
    - require_in:
      - pkg: virtualbox-install-latest

virtualbox-install-latest:
  pkg.latest:
    - name: virtualbox-7.0

{% elif salt.grains.get('kernel') == "Darwin" %}

# https://formulae.brew.sh/cask/virtualbox
virtualbox-install:
  pkg.installed:
    - name: homebrew/cask/virtualbox

{% endif %}
