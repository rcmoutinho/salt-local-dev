{% if salt.grains.get('os') == "Ubuntu" %}

# 10 Tools to Take or Capture Desktop Screenshots in Linux:
# https://www.tecmint.com/take-or-capture-desktop-screenshots-in-ubuntu-linux/

# https://shutter-project.org/
shutter-install-latest:
  pkg.latest:
    - name: shutter

{% endif %}
