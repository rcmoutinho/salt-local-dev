{% if salt.grains.get('os') == "Ubuntu" %}

vagrant-add-apt-gpg-key: # favor gpg considering apt-key is depricated
  cmd.run:
    - name: curl -sS https://apt.releases.hashicorp.com/gpg | sudo gpg --yes --dearmor --output /usr/share/keyrings/hashicorp-archive-keyring.gpg
    - creates: /usr/share/keyrings/hashicorp-archive-keyring.gpg

vagrant-add-apt-repository:
  pkgrepo.managed:
    - name: deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com {{ salt.grains.get('oscodename') }} main
    - file: /etc/apt/sources.list.d/hashicorp.list
    - refresh: True
    - require_in:
      - pkg: vagrant-install-latest

vagrant-install-latest:
  pkg.latest:
    - name: vagrant

{% endif %}
