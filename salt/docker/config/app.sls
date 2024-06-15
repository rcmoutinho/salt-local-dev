{% if salt.grains.get('kernel') == "Darwin" %}

docker-config-app:
  cmd.run:
    - name: open -a Docker.app --args --accept-license
    - unless:
      - fun: cmd.run
        cmd: docker run --rm hello-world
        output_loglevel: quiet # prevent printing expected log errors

{% endif %}
