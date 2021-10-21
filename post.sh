#/bin/sh

# Boot to console
# disable getty and reset default to graphical.target 
# if using display manager
systemctl set-default multi-user.target
systemctl enable getty@tty1.service