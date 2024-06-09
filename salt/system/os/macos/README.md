# macOS <!-- omit in toc -->

- [Troubleshooting](#troubleshooting)
  - [Could not find "com.apple.atrun" in domain for port](#could-not-find-comappleatrun-in-domain-for-port)
  - [References](#references)

## Troubleshooting

### Could not find "com.apple.atrun" in domain for port

It seems that running commands as a user via salt, which would use `su`, causes some error messages, although it works. If you really want to work around it, enabling the service `/System/Library/LaunchDaemons/com.apple.atrun.plist` would potentially remove this error. But it seems the file is in a read-only folder, so enabling it permanently would require disabling SIP (bad idea). [More about it](https://unix.stackexchange.com/questions/478823/making-at-work-on-macos/478840#478840).

### References

- [macOS `defaults` list](https://macos-defaults.com/)
