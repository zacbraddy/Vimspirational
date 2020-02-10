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

## Make spotify big for my 4k monitor!

Put this into the `~/.local/share/applications/spotify.desktop` and change the user name in the icon to your own username and replace the spotify icon user name with what ever random file the spotify icon has taken for itself. You now have to open spotify by going to the Spotify[Big] link best you favourite that one bud ;) 

```
[Desktop Entry]
Name=Spotify[Big]
Exec=/snap/bin/spotify --force-device-scale-factor=2
Icon=/home/zac/.cache/gnome-software/icons/4e763d64d7d04a3b072fcb90e3798530916c6b8a-spotify-linux-256.png
Terminal=false
Type=Application
StartupNotify=true
```

## Same with Postman

Download the linux app and then put the level of the folder that has the `app` folder and `Postman` the postman desktop app into the location `~/Postman` then put the following desktop application in `~/.local/share/applications/postman.desktop`

```
[Desktop Entry]
Name=Postman
Exec=/home/zac/Postman/Postman
Icon=/home/zac/Postman/app/resources/app/assets/icon.png
Terminal=false
Type=Application
StartupNotify=true
```

## Increase watcher limit so npm doesn't bork out for watching tests etc.

Tests with watchers and npm build tasks etc tend to only be able to be running a few at a time unless you increase the watcher limit with this set of commands:

```
echo fs.inotify.max_user_watches=524288 | sudo tee -a /etc/sysctl.conf && sudo sysctl -p
```

## Yarn doesn't work because Ubuntu has something named yarn installed automattically /facepalm

[Yeah it's for real](https://github.com/yarnpkg/yarn/issues/2821)

I used this command to make it spring to life

```
sudo apt remove cmdtest
sudo apt remove yarn
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt update
sudo apt install yarn
```

# Fixing bluetooth headphones with ubuntu

My bluetooth headphones were doing funky things when the machine went into suspended mode and also kept choosing poor quality bluetooth bands. [This blog post sorted me out](https://medium.com/@overcode/fixing-bluetooth-in-ubuntu-pop-os-18-04-d4b8dbf7ddd6)

# Making that caps lock another backspace and dual shift keys my caps lock
Both of these can be done using the gnome-tweak-tools package which has been installed during the setup instructions in the readme
