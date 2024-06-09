{% if salt.grains.get('os') == "Ubuntu" %}

docker-install-check:
  test.fail_without_changes:
    - name: "There is an issue when running a command in Docker. Check the installation."
    - unless:
      - fun: cmd.run
        cmd: docker run --rm hello-world
        output_loglevel: quiet # prevent printing expected log errors

{% endif %}
