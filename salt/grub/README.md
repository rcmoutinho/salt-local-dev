# GRUB (GRand Unified Bootloader) <!-- omit in toc -->

- [About](#about)
- [Manual Configuration](#manual-configuration)
- [Troubleshooting](#troubleshooting)
  - [Diskfilter writes are not supported](#diskfilter-writes-are-not-supported)
- [References](#references)

## About

Customizing GRUB can go from basic to highly advanced very quickly. Considering the way the hardware setup is done and every possibility involved, trying to automate it could cause more problems than solutions.

## Manual Configuration

Once you open Grub Customizer (it will ask for elevated access), you can try some fundamental changes:

- `List configuration` : Change the order to your best scenario where the most used OS is the first on the list

- `General settings > default entry > previously booted entry` : This option would help when updating the OS so it can come back to the same previous state. **See section [Diskfilter writes are not supported](#diskfilter-writes-are-not-supported) to learn more about potential side effects.**

## Troubleshooting

### Diskfilter writes are not supported

After making some simple changes, I started to see this error when booting the PC.

```bash
error:  Diskfilter writes are not supported
```

Whether selecting Windows or Ubuntu, it shows this error but doesn't affect general usage. There is a [very long answer on askubuntu.com](https://askubuntu.com/a/498281) explaining it's a potential bug and how to work around it.

The simple explanation is the option regarding `previously booted entry`. I believe that before, the `GRUB_DEFAULT` had the value `0` instead of `saved` and `GRUB_SAVEDEFAULT` was `false` instead of `true`.

I don't have a patch to ensure we can write the last boot and avoid this error. Maybe later, if this becomes an important thing to fix and automate.

## References

- [Customize Grub to Get a Better Experience With Linux](https://itsfoss.com/customize-grub-linux/)
- [What is Grub in Linux?](https://itsfoss.com/what-is-grub/)
