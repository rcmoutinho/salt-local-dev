base:
  '*':
    - salt.minion
    - utils
    - git
    - vscode
    - tools
    - docker

  G@kernel:Linux:
    - gdm
    - grub
    - ssh
    - sudoers
