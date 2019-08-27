#How I've setup Linux the way I like it

There are a number of settings that I've had to tweak with linux to make the distro bend to my will (MUWHAHAHA!)

## Make it so you can close the lid and have the screen turn off when on power

This will make it so that the laptop doesn't shut down when you close the lid
```
echo 'HandleLidSwitch=ignore' | sudo tee --append /etc/systemd/logind.conf
echo 'HandleLidSwitchDocked=ignore' | sudo tee --append /etc/systemd/logind.conf
sudo service systemd-logind restart
```

Then to make it so that the screen doesn't stay on when you close the lid first you do:

```
echo 'event=button/lid.*' | sudo tee --append /etc/acpi/events/lm_lid
echo 'action=/etc/acpi/lid.sh' | sudo tee --append /etc/acpi/events/lm_lid
sudo touch /etc/acpi/lid.sh
sudo chmod +x /etc/acpi/lid.sh
```

After that you need to edit /etc/acpi/lid.sh and change `your_username` to your actual username

```
USER=your_username
 
grep -q close /proc/acpi/button/lid/*/state
 
if [ $? = 0 ]; then
  su -c  "sleep 1 && xset -display :0.0 dpms force off" - $USER
fi
 
grep -q open /proc/acpi/button/lid/*/state
 
if [ $? = 0 ]; then
  su -c  "xset -display :0 dpms force on &> /tmp/screen.lid" - $USER
fi
```

## Dark mode, and other small tweaks

You can do everything at the command line but do yourself a favour and just `sudo apt-get install gnome-tweaks` to save having to collate them all.
