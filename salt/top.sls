base:
  '*':
    - salt.minion
    - system.os
    - utils
    - ssh
    - git
    - fonts
    - vscode
    - tools
    - docker
    - hypervisor
    - vagrant
    - eza
    - python
    - shell

  G@kernel:Linux:
    - gdm
    - grub
    - sudoers
