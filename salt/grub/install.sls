{% if salt.grains.get('kernel') == "Linux" %}

include:
  - utils.system

grub-customizer-apt-repository:
  pkgrepo.managed:
    - ppa: danielrichter2007/grub-customizer
    - require_in:
      - pkg: grub-customizer-install-latest

grub-customizer-install-latest:
  pkg.latest:
    - name: grub-customizer

{% endif %}
