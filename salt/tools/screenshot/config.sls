{% if salt.grains.get('kernel') == "Linux" %}

include:
  - gdm.config

{# TODO [TOOLS] Automate shutter configuration

  - find a way to define as default tool to take screeshots
  - configure related-shortcuts

  - initial manual changes that needs to be automated
    - change save mode: browse for save folder every time
    - first launch behavior
      - [x] start shutter at login
      - [x] hide window on first launch

  - extra
    - maybe create and define a different profile to automate all changes
    - check other potential improvements

 #}

{% endif %}
