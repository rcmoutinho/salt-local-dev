{% if salt.grains.get('os') == "Ubuntu" %}

google-chrome-add-apt-gpg-key: # favor gpg considering apt-key is depricated
  cmd.run:
    - name: curl -sS https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo gpg --yes --dearmor --output /etc/apt/keyrings/google-chrome.gpg
    - creates: /etc/apt/keyrings/google-chrome.gpg

google-chrome-add-apt-repository:
  pkgrepo.managed:
    - name: deb [arch={{ salt.grains.get('osarch') }} signed-by=/etc/apt/keyrings/google-chrome.gpg] http://dl.google.com/linux/chrome/deb/ stable main
    - file: /etc/apt/sources.list.d/google-chrome.list
    - refresh: True
    - require_in:
      - pkg: google-chrome-install-latest

google-chrome-install-latest:
  pkg.latest:
    - name: google-chrome-stable

{% elif salt.grains.get('kernel') == "Darwin" %}

# https://formulae.brew.sh/cask/google-chrome
google-chrome-install:
  pkg.installed:
    - name: homebrew/cask/google-chrome

{% endif %}
