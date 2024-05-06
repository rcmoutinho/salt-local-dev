base:
  '*':
    - salt.minion
    - utils
    - system.os
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
