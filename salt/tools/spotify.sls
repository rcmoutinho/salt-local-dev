{% if salt.grains.get('os') == "Ubuntu" %}

# https://www.spotify.com/us/download/linux/

spotify-add-apt-gpg-key: # favor gpg considering apt-key is depricated
  cmd.run:
    - name: curl -sS https://download.spotify.com/debian/pubkey_6224F9941A8AA6D1.gpg | sudo gpg --dearmor --yes -o /etc/apt/trusted.gpg.d/spotify.gpg
    - creates: /etc/apt/trusted.gpg.d/spotify.gpg

spotify-add-apt-repository:
  pkgrepo.managed:
    - name: deb http://repository.spotify.com stable non-free
    - file: /etc/apt/sources.list.d/spotify.list
    - refresh: True
    - require_in:
      - pkg: spotify-install-latest

spotify-install-latest:
  pkg.latest:
    - name: spotify-client

{% endif %}
