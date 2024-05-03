# Salt Local Development <!-- omit in toc -->

[Back to Top]: #salt-local-development

- [About](#about)
- [Install Salt](#install-salt)
- [Setup the project](#setup-the-project)
  - [Configure personal data](#configure-personal-data)
  - [Configure GPG keys (Optional)](#configure-gpg-keys-optional)
  - [Configure Masterless](#configure-masterless)
  - [Apply all states](#apply-all-states)
- [Documentation](#documentation)
- [Support](#support)
- [License](#license)

## About

Imagine having a fresh environment to configure every time. It could be a new computer, a PC gamer on top of your notebook, formatting your disk, or even creating a dual boot to play with Linux. You need to think about all the cool stuff you installed and configured in your primary machine to replicate and be up to speed on the other environment. Boring... right?

This project aims to help you (and me) map all the most important and common things we need as developers so we can quickly get up to speed using the most efficient environment we have.

The project uses a [Salt Masterless](https://docs.saltproject.io/en/latest/topics/tutorials/quickstart.html) approach to configure and automate everything we need for the local environment without the need for master and minion daemons/services. We could reach similar goals using tools like [Ansible](https://www.ansible.com) or other tools or even installing master and minion services to automate more targets that are not just your machine. Feel free to get inspired if you want to take a different route.

<details>
  <summary>Quick overview of all automated installs <i>(click to expand)</i></summary>

  ### Linux <!-- omit in toc -->
  - GIT and its configuration
  - Visual Studio Code and extensions
  - Docker and its configuration
  - Terminal using Zsh
  - Hypervisors
    - Virtualbox
  - Vagrant
  - General Tools
    - 1password
    - Shutter _(for screenshots)_
    - Spotify
  - General packages
    - tree
    - curl
  - Extra
    - GDM (GNOME Display Manager) and its configurations
    - GRUB Customizer
  - Documentation about a few manual configurations
  
  Coming soon:
  - ZSH + configs + plugins
  - Python + Ruff + UV
  - ...
  
  ### Windows <!-- omit in toc -->
  _Coming soon ( as I have time :smile: )_

  ### macOS <!-- omit in toc -->
  _Coming soon ( as I have time :smile: )_

</details>

_[Back to Top]_

## Install Salt

The easiest way to start is by installing salt via [bootstrap script](https://github.com/saltstack/salt-bootstrap). Check [Salt release notes](https://docs.saltproject.io/en/latest/topics/releases/index.html) page to pick your desired version.

```bash
curl -o /tmp/bootstrap-salt.sh -L https://bootstrap.saltproject.io

# test the downloaded file
test $(sha256sum /tmp/bootstrap-salt.sh | awk '{print $1}') \
   = $(curl -sL https://bootstrap.saltproject.io/sha256 | cat -) \
   && echo "OK" || echo "File does not match checksum"

# alternative for curl
wget -O /tmp/bootstrap-salt.sh https://bootstrap.saltproject.io

# test the downloaded file
test $(sha256sum /tmp/bootstrap-salt.sh | awk '{print $1}') \
   = $(wget -qO- https://bootstrap.saltproject.io/sha256) \
   && echo "OK" || echo "File does not match checksum"

# install salt
## -P : Allow pip based installations
## -X : Do not start daemons after installation (to favor our masterless approach)
sudo sh /tmp/bootstrap-salt.sh -X -P stable 3006.7

# For Debian distros, like Ubuntu, we will need to manually stop the service
## Message from the script
## WARN: Not starting daemons on Debian based distributions is not working mostly because starting them is the default behaviour.
sudo systemctl stop salt-minion

# check if the service is stopped
sudo systemctl status salt-minion
```

You can run some quick and basic tests using the `--local` argument:
```bash
sudo salt-call --local test.ping
sudo salt-call --local test.versions
```

_[Back to Top]_

## Setup the project

Clone the project:

```bash
# SSH
git clone git@github.com:rcmoutinho/salt-local-dev.git

# HTTPS
git clone https://github.com/rcmoutinho/salt-local-dev.git
```

> NOTE: You can also fork this project before to allow you to push all your custom changes to your project.

The Masterless approach means that instead of connecting to a Salt master to collect files and pillars _(default configuration behavior with minion configuration `file_client: remote`)_, we will only rely on the local files removing the need of a minion daemon. This means we will only use the [salt-call command line](https://docs.saltproject.io/en/latest/ref/cli/salt-call.html).

It's possible to force local calls using the argument `--local` and many other specific configurations, but using a [Saltfile](https://docs.saltproject.io/salt/install-guide/en/latest/topics/configure-master-minion.html#saltfile) makes everything WAY simpler in this scenario.

Duplicate the reference [Saltfile.template](./Saltfile.template), in the root of this project, into [Saltfile](./Saltfile) and define all the specific configurations you have. This configuration will help you typing less arguments when executing commands from the root of the project.

> **Advanced:** In case you want to make this permanent to your user for any salt project, you could move the file to `~/.salt/Saltfile`, but considering you are always using `sudo`, it will favor `root` user references. You can change the [user minion configuration](https://docs.saltproject.io/en/latest/ref/configuration/minion.html#user) to not use `root`, but this can be a bit advanced for a simple setup we want here.

### Configure personal data

To simplify the project configuration with your personal data, duplicate the folder [pillar/personal.template/](pillar/personal.template/) into [pillar/personal/](pillar/personal/) and change the values to your preferences under [pillar/personal/init.sls](pillar/personal/init.sls).

### Configure GPG keys (Optional)

If you need to handle any extra secrets locally, you can improve security using GPG keys.

> IMPORTANT: **Ensure you know what you are doing before pushing your encrypted value, and NEVER commit your private GPG key or plaintext secrets.** As a personal project, I recommend keeping personal data and encrypted secrets under the "pillar/personal" folder to avoid worrying much about your public repository content, considering this folder is ignored.

There is no point in rewriting the excellent [salt documentation about GPG](https://docs.saltproject.io/en/latest/ref/renderers/all/salt.renderers.gpg.html) already available. This section will focus on the minimum you need to configure your keys on your local machine. It will be a one-time setup so you can encrypt/decrypt your secrets and still be able to version them.

```bash
sudo mkdir -p /etc/salt/gpgkeys
sudo chmod 0700 /etc/salt/gpgkeys

# It is an interactive command
# Make sure **NOT to add a password**, considering salt does not support it
sudo gpg --homedir /etc/salt/gpgkeys --gen-key
```

### Configure Masterless

Once you have your [Saltfile](./Saltfile) configured, you can now run the salt minion state to make masterless definitions permament. This would be optional in a way but it make simpler to ensure all the configurations you have for your salt setup.

```bash
sudo salt-call state.sls salt.minion
```

### Apply all states

Once you have managed all the previous instructions, you should execute all states safely. Before applying all changes, you can run a test to understand all the potential changes.

```bash
# dry-run
sudo salt-call state.highstates test=True

# apply changes
sudo salt-call state.highstates
```

Voilà! Everything is now configured!

> **IMPORTANT:** Keep in mind this code was developed to be **idempotent**. So after running once, following executions won't change the final result unless there is something to change _(like a new software version in case we enforce the latest)_.

_[Back to Top]_

## Documentation

Find more about the project, extra configurations, faq, and more under the [doc folder](./docs/README.md).

_[Back to Top]_

## Support

Supported and tested OS, so far:
- Ubuntu 20.04 LTS

_[Back to Top]_

## License

[MIT License](LICENSE)

_[Back to Top]_
