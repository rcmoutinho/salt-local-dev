# Salt Local Development <!-- omit in toc -->

- [About](#about)
- [Install Salt](#install-salt)
  - [By Operational Systems](#by-operational-systems)
  - [Basic testing](#basic-testing)
- [Setup the project](#setup-the-project)
  - [Configure Saltfile (Optional)](#configure-saltfile-optional)
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
  - [GIT](https://git-scm.com/) + configs
  - [Visual Studio Code](https://code.visualstudio.com/) + extensions
  - [Docker](https://www.docker.com/) + configs
  - Terminal using [Zsh](https://www.zsh.org/) + configs + theme + plugins
  - [Python](https://www.python.org/) + [Ruff](https://astral.sh/ruff) + [UV](https://astral.sh/uv)
  - Hypervisors
    - [Virtualbox](https://www.virtualbox.org/)
  - [Vagrant](https://www.vagrantup.com/)
  - General Tools
    - [1Password](https://1password.com/)
    - [Shutter](https://shutter-project.org/) _(for screenshots)_
    - [Spotify](https://open.spotify.com/)
  - General packages
    - curl
    - [jq](https://jqlang.github.io/jq/)
    - tree
    - vim
    - wget
  - Extra
    - GDM (GNOME Display Manager) + configs
    - GRUB Customizer
    - Extra fonts
    - [eza](https://eza.rocks/) _(alternative for `ls` command)_
  - Documentation about a few manual configurations
  
  ### Windows <!-- omit in toc -->
  _Coming soon ( as I have time :smile: )_

  ### macOS <!-- omit in toc -->
  - [GIT](https://git-scm.com/) + configs
  - [Visual Studio Code](https://code.visualstudio.com/) + extensions
  - [Docker](https://www.docker.com/)
  - Terminal using [Zsh](https://www.zsh.org/) + configs + theme + plugins
  - [Python](https://www.python.org/) + [Ruff](https://astral.sh/ruff) + [UV](https://astral.sh/uv)
  - Hypervisors
    - [Virtualbox](https://www.virtualbox.org/)
  - [Vagrant](https://www.vagrantup.com/)
  - General Tools
    - [1Password](https://1password.com/)
    - [Spotify](https://open.spotify.com/)
    - Google Chrome
  - General packages
    - curl
    - [jq](https://jqlang.github.io/jq/)
    - tree
    - vim
    - wget
  - Extra
    - Extra fonts
    - [eza](https://eza.rocks/) _(alternative for `ls` command)_
    - [mas](https://github.com/mas-cli/mas) _(command line interface for the Mac App Store)_
    - System defaults
  - Documentation about a few manual configurations

</details>

## Install Salt

The easiest way to start is by installing salt via [bootstrap script](https://github.com/saltstack/salt-bootstrap). Check [Salt release notes](https://docs.saltproject.io/en/latest/topics/releases/index.html) page to pick your desired version.

### By Operational Systems

<details>
  <summary>Ubuntu <i>(click to expand)</i></summary>

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
  sudo sh /tmp/bootstrap-salt.sh -X -P stable 3006.8

  # For Debian distros, like Ubuntu, we will need to manually stop the service
  ## Message from the script
  ## WARN: Not starting daemons on Debian based distributions is not working mostly because starting them is the default behaviour.
  sudo systemctl stop salt-minion

  # check if the service is stopped
  sudo systemctl status salt-minion
  ```
</details>

<details>
  <summary>macOS <i>(click to expand)</i></summary>

  ```bash
  curl -o /tmp/bootstrap-salt.sh -L https://bootstrap.saltproject.io

  # test the downloaded file
  test $(shasum -a 256 /tmp/bootstrap-salt.sh | awk '{print $1}') \
    = $(curl -sL https://bootstrap.saltproject.io/sha256 | cat -) \
    && echo "OK" || echo "File does not match checksum"

  # install salt
  ## -P : Allow pip based installations
  ## -X : Do not start daemons after installation (to favor our masterless approach)
  sudo sh /tmp/bootstrap-salt.sh -X -P stable 3006.8

  # Once it's installed, open a new terminal before executing salt commands
  ```

  > _**EXTRA NOTES:** You might get a dialog regarding python3 asking to install **"command line developer tools"** (please do so because it's helpful and will install essential initial tools like git - the installation might take a while)_

</details>

### Basic testing

You can run some quick and basic tests using the `--local` argument:

```bash
sudo salt-call --local test.ping
sudo salt-call --local test.versions
```

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

### Configure Saltfile (Optional)

Duplicate the reference [Saltfile.template](./Saltfile.template), in the root of this project, into [Saltfile](./Saltfile) and define all the specific configurations you have. This configuration will help you typing less arguments when executing commands from the root of the project.

Depending on the OS _(for example, macOS)_, it will only work when saving the file under `~/.salt/Saltfile`. However, for other OS, _like Ubuntu_, this approach might not work because you always use `sudo`, which favors `root` user references. You can change the [user minion configuration](https://docs.saltproject.io/en/latest/ref/configuration/minion.html#user) not to use `root`, but this can be a bit advanced for a simple setup we want here.

Regardless of your choice, we can apply the salt minion state later to make the `file_client` configuration permanent.

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

You can now run the salt minion state to make masterless definitions permament. This would be optional in a way but it make simpler to ensure all the configurations you have for your salt setup.

```bash
# with Saltfile configured
sudo salt-call state.sls salt.minion

# without Saltfile configured
sudo salt-call --local --file-root /path/to/my/project/salt --pillar-root /path/to/my/project/pillar state.sls salt.minion
```

If you get an error like `No matching sls found for 'salt.minion' in env 'base'`. Please check your Saltfile or arguments regarding the file and pillar root. It must point correctly to the [salt](./salt/) and [pillar](./pillar/) folders from this project.

You will also get errors regarding missing the personal pillar folder if you haven't configured it [based on the template](pillar/personal.template/) yet.

### Apply all states

Once you have managed all the previous instructions, you should execute all states safely. Before applying all changes, you can run a test to understand all the potential changes.

> _NOTE: **For macOS**, you might need to log in to the AppStore before running all states. Processes that install apps via CLI require this access. Only previously downloaded apps can be installed. Any other will cause an error while trying to install._

```bash
# dry-run
sudo salt-call state.highstates test=True

# apply changes
sudo salt-call state.highstates
```

Voilà! Everything is now configured!

> **IMPORTANT:** Keep in mind this code was developed to be **idempotent**. So after running once, following executions won't change the final result unless there is something to change _(like a new software version in case we enforce the latest)_.

## Documentation

Find more about the project, extra configurations, faq, and more under the [doc folder](./docs/README.md).

## Support

Supported and tested OS, so far:
- Ubuntu 20.04 LTS
- macOS Monterey 12.7.5

## License

[MIT License](LICENSE)

