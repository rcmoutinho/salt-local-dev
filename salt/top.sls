base:
  '*':
    - salt.minion
    - utils
    - git
    - vscode
    - tools

  G@kernel:Linux:
    - gdm
    - grub
    - ssh
    - sudoers
