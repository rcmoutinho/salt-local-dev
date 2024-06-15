{% if salt.grains.get('kernel') == "Darwin" %}

# https://formulae.brew.sh/cask/google-drive
google-drive-install:
  pkg.installed:
    - name: homebrew/cask/google-drive

{% endif %}
