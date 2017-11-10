# Vimispirational
A repo that documents my journey into trying to be a developer who uses Vim as well as a place to keep my current setup.

## Table of Contents
- [Steps to setup on Windows](#steps-to-setup-on-windows)
- [ConEmu settings](#conemu-settings)
- [Problems I'm sure I can solve but haven't yet](#problems-im-sure-i-can-solve-but-havent-yet)
- [Problems I faced during install that I haven't solved](#problems-i-faced-during-install-that-i-havent-solved)
- [Problems I've managed to overcome](#problems-ive-managed-to-overcome)

## Steps to setup on Windows
1. Got to [vim.org](http://vim.org/) and get the self-installing executable for vim. Install this whereever you wish but remember the path.
1. Install ConEmu, my favourite flavour is [cmder](http://cmder.net/)
1. Pull down my ConEmu settings to give you a basic setup. You need to pull down [this xml file](https://github.com/zacbraddy/Vimispirational/blob/master/con_emu_settings.xml) and then import it into ConEmu through the import functionality available from the settings menu which you can pull up in ConEmu using the shortcut `Win+Alt+P`
1. There are some setting in the ConEMU settings which point to paths on my local machine. Most notably the background image and the path to the vim exectuable for the VIM startup task you'll need to go change them for those to work.
1. Install clink into ConEmu. Download the zip file from [here](https://mridgers.github.io/clink/) then unzip the files directly into `%cmderinstallfolder%\cmder\vendor\conemu-maximus5\ConEmu\clink`. Clink is used to give you advanced autocomplete within the command line. Nothing really to do with vim it just makes ConEmu more powerful.


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
Features > In-console optionns > Use Clink in prompt | On
Startup > Environment | Added the line `set projects=<projects folder path>`
Startup > Tasks | Added a Tools::Vim task I also set the hotkey for this task to Alt+N
Startup > Tasks > Bash::Git bash | Set the HotKey to LCtrl+T and also set the startup Project to my projects folder

## Problems I'm sure I can solve but haven't yet

## Problems I faced during install that I haven't solved

## Problems I've managed to overcome
