{% if salt.grains.get('os') == "Ubuntu" %}

brave-browser-add-apt-gpg-key: # favor gpg considering apt-key is depricated
  cmd.run:
    - name: curl -sS https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg | sudo gpg --yes --dearmor --output /etc/apt/keyrings/brave-browser-archive-keyring.gpg
    - creates: /etc/apt/keyrings/brave-browser-archive-keyring.gpg

brave-browser-add-apt-repository:
  pkgrepo.managed:
    - name: deb [signed-by=/etc/apt/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main
    - file: /etc/apt/sources.list.d/brave-browser-release.list
    - refresh: True
    - require_in:
      - pkg: brave-browser-install-latest

brave-browser-install-latest:
  pkg.latest:
    - name: brave-browser

{% elif salt.grains.get('kernel') == "Darwin" %}

# https://formulae.brew.sh/cask/brave-browser
brave-browser-install:
  pkg.installed:
    - name: homebrew/cask/brave-browser

{% endif %}
