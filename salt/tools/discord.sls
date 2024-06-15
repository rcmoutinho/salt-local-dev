{% if salt.grains.get('kernel') == "Darwin" %}

# https://formulae.brew.sh/cask/discord
discord-install:
  pkg.installed:
    - name: homebrew/cask/discord

{% endif %}
