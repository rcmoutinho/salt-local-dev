{% if salt.grains.get('kernel') == "Linux" %}

# Improve PPA support: https://docs.saltproject.io/en/latest/ref/states/all/salt.states.pkgrepo.html
# Alternative to package: python-software-properties

utils-system-install-software-properties-common:
  pkg.latest:
    - name: software-properties-common

{% endif %}
