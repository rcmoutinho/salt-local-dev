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

  G@kernel:Linux:
    - gdm
    - grub
    - sudoers
