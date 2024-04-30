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

  G@kernel:Linux:
    - gdm
    - grub
    - sudoers
