# macOS <!-- omit in toc -->

This is not a complete and official guide on how to do a fresh install. The goal here is to organize useful links and potentially some quick tips on how to do this process efficiently without the need to search for it every time we need to do it.

> _If you have already done the process or want to learn how to automate all the tools and configurations using Salt, [check the Salt bootstrap guide for macOS](/docs/faq/salt/bootstrap.md)._

- [Trigger OS install](#trigger-os-install)
  - [Erase data](#erase-data)
  - [Reinstall macOS](#reinstall-macos)
- [OS Configuration](#os-configuration)
  - [System Preferences](#system-preferences)
  - [Terminal](#terminal)

## Trigger OS install

Considering an oldish hardware, the following instructions is probably what you are looking for:

- Install the latest version of macOS compatible with your computer: <kbd>Option</kbd> + <kbd>Command</kbd> + <kbd>R</kbd>. _**(recommended)**_  
  _This option will ask for a Wi-Fi connection if you are not using a cable connection._

- Reinstall your computer’s original version of macOS (including available updates): <kbd>Option</kbd> + <kbd>Shift</kbd> + <kbd>Command</kbd> + <kbd>R</kbd>.

- Reinstall your current version of macOS: <kbd>Command</kbd> + <kbd>R</kbd>.

You can [check all alternatives here](https://support.apple.com/en-ca/guide/mac-help/mh27903/mac) based on your hardware.

### Erase data

> _**CAUTION HERE!** Using Disk Utility might result in complete data loss. **Use it at your own risk!**_

You can use the [Disk Utility](https://support.apple.com/en-ca/guide/disk-utility/welcome/mac) right before the OS installation. This is an excellent opportunity to wipe everything in your current storage.

Using the `APFS` format might be enough here. You can later configure the encryption on your data via system configuration.

### Reinstall macOS

This option will depend on how you started the process. In my current test using an old _MacBook Air 2015_, it says "Reinstall macOS Monterey". This is because I used the option to download the latest supported OS for my hardware.

You could also recover from a Time Machine, but considering we want to automate everything, you might want to start fresh to install everything you want and copy missing data later in the process.

After that, it is just the regular tedious installation waiting with minimal user definitions.

## OS Configuration

### System Preferences

> NOTE: I haven't searched yet for a way to define all system preferences via the command line. I think it might be possible for some of them, but it would require some extra effort.

Here is everything I find helpful in configuring on top of the default configuration.

- Trackpad
  - Point & Click
    - [X] Tap to click
    - Tracking speed 8 of 10
- Dock & Menu Bar
  - [ ] Show recent applications in Dock

### Terminal

With Terminal opened, go to Preferences:
- Profiles
  - Homebrew as default
  - Change the font to “MesloLGS NL“, size 14

> NOTE: I searched a bit but the effort might be too high to handle terminal configurations. Here are some references for potential automation:
> - https://apple.stackexchange.com/questions/229049/change-font-of-terminal-programmatically-w-o-restarting
> - https://apple.stackexchange.com/questions/246273/how-to-permamently-change-terminal-font-size-via-commandline-terminal
