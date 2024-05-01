base:
  '*':
    - salt.minion
    - utils
    - ssh
    - git
    - vscode
    - tools
    - docker
    - hypervisor
    - vagrant
    - zsh

  G@kernel:Linux:
    - gdm
    - grub
    - sudoers
