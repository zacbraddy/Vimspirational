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
1. Install [Pathogen](https://github.com/tpope/vim-pathogen), just follow the instructions on the README. I used the "brandnew to vim rc file the readme suggests and I also installed [sensible.vim](https://github.com/tpope/vim-sensible) as my first plugin.
1. Install Nerdtree using pathogen by git cloning the nerdtree solution into the bundle folder created during the install of pathogen. When setting the help tags as per the installation instructions on the nerd tree github us `$VIM\bundle\nerdtree\doc\` in place of `~/.vim/bundle/nerdtree/doc/`. This makes the nerd tree reference files work correctly.
1. Create a `vimtmp` folder in the vimfiles directory then add a folder called `backup` one called `swap` and another called `undo`. This is where the swap, undo and backup files for vim are going to be stored so that we don't pollute our `pwd` with them when working. If you don't create this directory then you will get all the swap, undo and backup files being created in the `pwd` as normal.

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
Startup > Startup options > Specified named task | {Bash::Git bash}
Startup > Environment | Added the line `set projects=<projects folder path>`
Startup > Tasks | Added a Tools::Vim task I also set the hotkey for this task to Alt+N
Startup > Tasks > Bash::Git bash | Set the HotKey to LCtrl+T and also set the startup Project to my projects folder and set as Default task for new console

## Problems I'm sure I can solve but haven't yet
- Make it so that when I use / search the highlighting goes away on escape.
- Integrate git into vim
- Install nerdtree-git-plugin to get git flags in nerd tree.
- Get syntax highlighting for JS and possibly JSX.
- Map nerd tree opening to a keypress
- Install a fuzzy finder
- Making it so that the backup, undo and swap directories are created automatically. Some [ideas for this can be found here](http://vim.wikia.com/wiki/Remove_swap_and_backup_files_from_your_working_directory)

## Problems I faced during install that I haven't solved

## Problems I've managed to overcome

### Saving the swap and backup files in a different directory

[This answer on SO](https://stackoverflow.com/a/1625850) explains how to save the swap and backup files to another directory and the other answers explain what exactly these files do.
