{% if salt.grains.get('os') == "Ubuntu" %}

eza-add-apt-gpg-key: # favor gpg considering apt-key is depricated
  cmd.run:
    - name: curl -sS https://raw.githubusercontent.com/eza-community/eza/main/deb.asc | sudo gpg --dearmor --output /etc/apt/keyrings/gierens.gpg
    - creates: /etc/apt/keyrings/gierens.gpg

eza-add-apt-repository:
  pkgrepo.managed:
    - name: deb [signed-by=/etc/apt/keyrings/gierens.gpg] http://deb.gierens.de stable main
    - file: /etc/apt/sources.list.d/gierens.list
    - refresh: True
    - require_in:
      - pkg: eza-install-latest

eza-install-latest:
  pkg.latest:
    - name: eza

{% endif %}
