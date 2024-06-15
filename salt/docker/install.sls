{% from "docker/map.jinja" import docker with context %}

{% if docker.supported_kernel %}
  {% if salt.grains.get('os') == "Ubuntu" %}

include:
  - utils

docker-add-apt-gpg-key: # favor gpg considering apt-key is depricated
  file.managed:
    - name: /etc/apt/keyrings/docker.asc
    - source: https://download.docker.com/linux/ubuntu/gpg
    - source_hash: 1afae06b34a13c1b3d9cb61a26285a15 # curl -sS https://download.docker.com/linux/ubuntu/gpg | md5sum
    - user: root
    - group: root
    - mode: 0644
    - makedirs: True

docker-add-apt-repository:
  pkgrepo.managed:
    - name: deb [arch={{ salt.grains.get('osarch') }} signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu {{ salt.grains.get('oscodename') }} stable
    - file: /etc/apt/sources.list.d/docker.list
    - refresh: True
    - require_in:
      - pkg: docker-install-latest

docker-install-latest:
  pkg.latest:
    - pkgs:
      - docker-ce
      - docker-ce-cli
      - containerd.io
      - docker-buildx-plugin
      - docker-compose-plugin

  {% elif salt.grains.get('kernel') == "Darwin" %}

docker-install:
  pkg.installed:
    - name: homebrew/cask/docker

  {% endif %}
{% endif %}
