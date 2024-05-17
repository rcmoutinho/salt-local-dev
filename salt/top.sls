base:
  '*':
    - salt.minion
    - utils
    - system.os
    - ssh
    - git
    - fonts
    - vscode
    - tools
    - docker
    - hypervisor
    - vagrant
    - zsh
    - eza

  G@kernel:Linux:
    - gdm
    - grub
    - sudoers
