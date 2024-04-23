# GDM (GNOME Display Manager) <!-- omit in toc -->

- [About](#about)
- [Changes](#changes)
- [Service Restart](#service-restart)
- [Troubleshooting](#troubleshooting)
  - [Display configuration changes](#display-configuration-changes)

## About

By default, Ubuntu Desktop comes with [Wayland](https://wayland.freedesktop.org/) enabled, although [Xorg](https://wiki.archlinux.org/title/xorg) is also installed.

## Changes

Our primary initial reason to disable Wayland and favor Xorg was due to [limitations when using Shutter](https://askubuntu.com/questions/1353360/ubuntu-21-04-shutter-did-not-work-without-x11-server). But it seems there is some trade-off in general when using one or the other. Here is a nice article to learn more about the topic, [Wayland vs. Xorg: Will Wayland Replace Xorg?](https://www.cbtnuggets.com/blog/technology/devops/wayland-vs-xorg-wayland-replace-xorg).

## Service Restart

When triggering the `gdm3` service restart, it will refresh the login session. This will basically close all current apps, and it would still require a system restart to ensure everything is working fine. To avoid breaking the salt executing in case of a highstate, especially since we are in a masterless approach where it is hard to monitor all changes, you will need to add an extra pillar to trigger the restart if it is something you really want.

```bash
# default
sudo salt-call state.sls gdm

# force to restart the server when there are configuration changes
sudo salt-call state.sls gdm pillar="{ restart_service_on_changes: True }"
```

## Troubleshooting

### Display configuration changes

When changing and restarting the gdm3 service, you might need to reconfigure your display settings, especially if you have multiple monitors. It should be fine since we do not change this definition every time.

But in case it happens, now you know why.
