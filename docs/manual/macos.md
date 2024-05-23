# macOS

This is not a complete and official guide on how to do a fresh install. The goal here is to organize useful links and potentially some quick tips on how to do this process efficiently without the need to search for it every time we need to do it.

> _If you have already done the process or want to learn how to automate all the tools and configurations using Salt, [check the Salt bootstrap guide for macOS](/docs/faq/salt/bootstrap.md)._

## Trigger OS install

Considering an oldish hardware, the following instructions is probably what you are looking for:

- Install the latest version of macOS compatible with your computer: <kbd>Option</kbd> + <kbd>Command</kbd> + <kbd>R</kbd>. _**(recommended)**_  
  _This option will ask for a Wi-Fi connection if you are not using a cable connection._

- Reinstall your computer’s original version of macOS (including available updates): <kbd>Option</kbd> + <kbd>Shift</kbd> + <kbd>Command</kbd> + <kbd>R</kbd>.

- Reinstall your current version of macOS: <kbd>Command</kbd> + <kbd>R</kbd>.

You can [check all alternatives here](https://support.apple.com/en-ca/guide/mac-help/mh27903/mac) based on your hardware.

## Erase data

> _**CAUTION HERE!** Using Disk Utility might result in complete data loss. **Use it at your own risk!**_

You can use the [Disk Utility](https://support.apple.com/en-ca/guide/disk-utility/welcome/mac) right before the OS installation. This is an excellent opportunity to wipe everything in your current storage.

Using the `APFS` format might be enough here. You can later configure the encryption on your data via system configuration.

## Reinstall macOS

This option will depend on how you started the process. In my current test using an old _MacBook Air 2015_, it says "Reinstall macOS Monterey". This is because I used the option to download the latest supported OS for my hardware.

You could also recover from a Time Machine, but considering we want to automate everything, you might want to start fresh to install everything you want and copy missing data later in the process.

After that, it is just the regular tedious installation waiting with minimal user definitions.
