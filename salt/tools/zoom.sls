{% if salt.grains.get('kernel') == "Darwin" %}

# https://formulae.brew.sh/cask/zoom
zoom-install:
  pkg.installed:
    - name: homebrew/cask/zoom

{% endif %}
