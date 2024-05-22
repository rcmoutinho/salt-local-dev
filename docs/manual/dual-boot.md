# Dual boot

Configuring dual boot can sometimes be tricky, and it is hard to cover all the edge cases. To improve your experience with GRUB, you can check some of the manual steps. You will find other challenges regarding dual boot and potential fixes/workarounds here.

## Troubleshooting

### How to fix Windows and Linux showing different times when dual booting

Ideally, changing this configuration on Linux will be less problematic than on Windows _(according to [this article](https://www.howtogeek.com/323390/how-to-fix-windows-and-linux-showing-different-times-when-dual-booting/), and I agree with the author that the Windows registry can be wild sometimes)_. Although we have a warning after changing it, here are the commands to go around it:

```bash
# check current state
timedatectl

# change it to favor local time
timedatectl set-local-rtc 1 --adjust-system-clock

#                Local time: Wed 2024-05-22 06:53:34 EDT
#            Universal time: Wed 2024-05-22 10:53:34 UTC
#                  RTC time: Wed 2024-05-22 10:53:34
#                 Time zone: America/Toronto (EDT, -0400)
# System clock synchronized: yes
#               NTP service: active
#           RTC in local TZ: yes       <<<<< the default here is 'no'
# 
# Warning: The system is configured to read the RTC time in the local time zone.
#          This mode cannot be fully supported. It will create various problems
#          with time zone changes and daylight saving time adjustments. The RTC
#          time is never updated, it relies on external facilities to maintain it.
#          If at all possible, use RTC in UTC by calling
#          'timedatectl set-local-rtc 0'.
```

The warning is to mention that it is better not to go this route, and that's why I'm not automating it to let this decision go to you. However, dual booting with Windows is the less problematic approach. If you prefer to continue as it is, you can roll back using the command below.

```bash
timedatectl set-local-rtc 0 --adjust-system-clock
```
