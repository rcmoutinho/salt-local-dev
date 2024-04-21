#!yaml

# THIS IS A TEMPLATE FILE!
# DUPLICATE THIS CONTENT UNDER "pillar/personal"

# The goal of this file is to keep potentially sensitive data away from your repository (in a simple approach)
# Folder "pillar/personal" is ignored and will never be committed to your public repository
# If you want to handle extra secrets, even locally, I recommend using GPG keys to improve security: https://docs.saltproject.io/en/latest/ref/renderers/all/salt.renderers.gpg.html

# User example: Ayrton Senna

personal:
  account:
    user:
      name: Ayrton Senna
      email: ayrtonsenna@f1.legends.com
      username: ayrtonsenna
      group: ayrtonsenna
      ssh_public_key: ssh-rsa ... ayrtonsenna
      ssh_private_key: |
        -----BEGIN RSA PRIVATE KEY-----
        ...
        -----END RSA PRIVATE KEY-----
