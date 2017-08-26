# Vimispirational
A repo that documents my journey into trying to be a developer who uses Vim as well as a place to keep my current setup.

## Table of Contents
- [Steps to setup on Windows](#steps-to-setup-on-windows)
- [ConEmu settings](#conemu-settings)
- [Problems I'm sure I can solve but haven't yet](#problems-im-sure-i-can-solve-but-havent-yet)
- [Problems I faced during install that I haven't solved](#problems-i-faced-during-install-that-i-havent-solved)
- [Problems I've managed to overcome](#problems-ive-managed-to-overcome)

## Steps to setup on Windows
1. Install ConEmu, my favourite flavour is [cmder](http://cmder.net/)
1. Pull down my ConEmu settings to give you a basic setup. You need to pull down [this xml file](https://github.com/zacbraddy/Vimispirational/blob/master/con_emu_settings.xml) and then import it into ConEmu through the import functionality available from the settings menu which you can pull up in ConEmu using the shortcut `Win+Alt+P`
1. Install [Babun](http://babun.github.io) you can follow the steps on the site they're pretty simple.
1. Because Babun installs a separate version of Cygwin and a different environment you'll need to setup new SSH keys even if you already had some setup on another Cygwin install (I have to admit I don't know this is the case, I'm guessing here seen as I had SSH keys setup on my box and when I installed Babun they couldn't seem to find them)

## ConEmu Settings

|Setting Name|Value|
---|---
Features > Colors | Ubuntu
Features > Status bar > Show status bar | off
Main > Background > Background Image | [I use this image](https://wallpaperscraft.com/image/panda_art_apofiss_night_94616_1920x1080.jpg)
Main > Background Placement | Stretch-Fill
Main > Background Darkening | 51
Main > Font Face | Consolas
Main > Quake style > Quake style slide down turned | on
Main > Quake style > Animation time (ms) | 300
Main > Quake style > Appear delay | 100
Main > Quake stlye > Disappear | 100
Main > Size & Position > Window position (pixels) | Centered
Main > Tab bar > Tabs on Bottom | On
Main > Update > Do automatic check on | Startup
Main > Update > Preferred release type | Stable
Startup > Environment | Added the line `set projects=<projects folder path>`
Startup > Tasks | Added a SuperShells::Babun task as per the link in [problems I've solved section](#problems-ive-managed-to-overcome)

## Problems I'm sure I can solve but haven't yet
- Babun has completely taken over the look and feel of the terminal from ConEmu, I want my background and colours back or at least be able to configure them myself :(

## Problems I faced during install that I haven't solved
### Conemu
- When I was setting up the Babun task I wanted to use the `%projects% ` variable that I setup in the Environment settings as the startup directory but Babun seems to have trouble understanding the variable that was setup in ConEmu. For now I've hard coded the startup directory to my projects directory and also left the variable as they're separately useful but it would be great find a way to use these together.
- Babun appears to hijack the ConEmu shortcuts so I can't use the keybinding to open a new shell or switch between shells with Babun open 

## Problems I've managed to overcome
### Babun
- When I installed Babun I found that I was getting an error that was suggesting that a child process couldn't be forked and that I needed to rebaseall. WTF right?! [this post](https://stackoverflow.com/questions/9300722/cygwin-error-bash-fork-retry-resource-temporarily-unavailable) helped out. I went through all the steps on the accepted answer, they all worked except for the last one which then suggested that I restart, so I did that and after that it was fine. 
>Lesson learned: Restart after installing Babun on a windows box

- Solved the problem of getting a Babun console loading up in ConEmu with (this)[http://babun.github.io/faq.html#_how_do_i_integrate_babun_with_conemu_cmder]
