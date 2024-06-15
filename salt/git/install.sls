{% from "git/map.jinja" import git with context %}

{% if git.supported_kernel %}

git-install:
  pkg.latest:
    - name: {{ git.pkg }}

{% endif %}
