{% if  salt.grains.get('kernel') == "Darwin" %}

# https://formulae.brew.sh/cask/google-chrome
google-chrome-install:
  pkg.installed:
    - name: homebrew/cask/google-chrome

{% endif %}
