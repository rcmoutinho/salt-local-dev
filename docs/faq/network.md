# Network <!-- omit in toc -->

- [Linux](#linux)
  - [Useful commands](#useful-commands)
  - [Troubleshooting](#troubleshooting)
    - [WiFi UNCLAIMED](#wifi-unclaimed)
  - [References](#references)

## Linux

### Useful commands

- `lshw -C network` - Check if the adapter is recognized
- `dmesg` - Check kernel messages to debug what might be missing

### Troubleshooting

#### WiFi UNCLAIMED

When using Windows with dual boot, we need to make sure the `Turn on fast startup` is disabled on Windows configuration. Change it under `Control Panel\Hardware and Sound\Power Options\System Settings`.

### References

- [Exploring Network Status](https://ubuntu.com/core/docs/networkmanager/exploring-network-status)
