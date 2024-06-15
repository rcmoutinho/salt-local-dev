{% if salt.grains.get('kernel') == "Darwin" %}

# https://formulae.brew.sh/cask/adobe-acrobat-reader
adobe-acrobat-reader-install:
  pkg.installed:
    - name: homebrew/cask/adobe-acrobat-reader

{% endif %}
