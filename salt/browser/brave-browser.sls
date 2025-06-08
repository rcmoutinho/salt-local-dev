{% if salt.grains.get('kernel') == "Darwin" %}

# https://formulae.brew.sh/cask/brave-browser
brave-browser-install:
  pkg.installed:
    - name: homebrew/cask/brave-browser

{% endif %}
