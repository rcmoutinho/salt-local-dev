{% if salt.grains.get('os') == "Ubuntu" %}

# https://www.perforce.com/perforce-packages
perforce-cli-add-apt-gpg-key: # favor gpg considering apt-key is depricated
  cmd.run:
    - name: curl -sS https://package.perforce.com/perforce.pubkey | sudo gpg --yes --dearmor --output /usr/share/keyrings/perforce.gpg
    - creates: /usr/share/keyrings/perforce.gpg

perforce-cli-add-apt-repository:
  pkgrepo.managed:
    - name: deb [signed-by=/usr/share/keyrings/perforce.gpg] https://package.perforce.com/apt/{{ salt.grains.get('os') | lower }} {{ salt.grains.get('oscodename') }} release
    - file: /etc/apt/sources.list.d/perforce.list
    - refresh: True
    - require_in:
      - pkg: perforce-cli-install-latest

perforce-cli-install-latest:
  pkg.latest:
    - name: helix-cli

{% endif %}
