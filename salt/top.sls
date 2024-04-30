base:
  '*':
    - salt.minion
    - utils
    - ssh
    - git
    - vscode
    - tools
    - docker

  G@kernel:Linux:
    - gdm
    - grub
    - sudoers
