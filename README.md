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
1. Install Nerdtree using pathogen by git cloning the nerdtree solution into the bundle folder created during the install of pathogen. This is as per the NERDTree [github repo](https://github.com/scrooloose/nerdtree). When setting the help tags as per the installation instructions on the nerd tree github us `$VIM\bundle\nerdtree\doc\` in place of `~/.vim/bundle/nerdtree/doc/`. This makes the nerd tree reference files work correctly.
1. Create a `vimtmp` folder in the vimfiles directory then add a folder called `backup` one called `swap` and another called `undo`. This is where the swap, undo and backup files for vim are going to be stored so that we don't pollute our `pwd` with them when working. If you don't create this directory then you will get all the swap, undo and backup files being created in the `pwd` as normal.
1. Install Fugitive using the install instructions on the [github repo](https://github.com/tpope/vim-fugitive).
1. Install unimpaired using the install instruction on the [github repo](https://github.com/tpope/vim-unimpaired).
1. Install the font SauceCodePro NF from [this github repo](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/SourceCodePro) I used the regular weight.
1. Install vim-devicon installation instruction [can be found here](https://vimawesome.com/plugin/vim-devicons). Note that because you installed the font in the last step and the third step is to make changes to the vimrc you only really need to clone the plugin to make this work.
1. Install nerdtree-git-plugin using pathogen as per [github repo instructions](https://github.com/Xuyuanp/nerdtree-git-plugin).
1. Install syntastic using pathogen as per [this vim awesome article](https://vimawesome.com/plugin/syntastic).
1. After installing syntactic you'll need to make sure that eslint is setup for it to work with js files. Install eslint with `npm i -g eslint` then if you're using create-react-app you'll also need to install their config files globally `npm i -g eslint-config-react-app` then you're gonna need all the dependencies `npm i -g eslint-plugin-import eslint-plugin-flowtype eslint-plugin-jsx-a11y eslint-plugin-react babel-eslint`.
1. Install vim-javascript for syntax highlighting [from this github](https://github.com/pangloss/vim-javascript).
1. Install vim-jsx for jsx syntax highlighting [from this github](https://github.com/mxw/vim-jsx).
1. Install vim-gitgutter [from this article](https://vimawesome.com/plugin/vim-gitgutter).
1. Install vim-airline [from this article](https://vimawesome.com/plugin/vim-airline).
1. Install vim-airline-themes [from this article](https://vimawesome.com/plugin/vim-airline-themes).
1. Install numbers.vim [from this githum](https://github.com/myusuf3/numbers.vim).
1. Install surround.vim [from this article](https://vimawesome.com/plugin/surround-vim).
1. Download the latest release of universal ctags from [this repo](https://github.com/universal-ctags/ctags-win32/releases)
1. Extract the zip and place it in your vimfiles under a folder called ctags.
1. Add the ctags directory to your PATH variable.
1. Add ctags to your global gitignor by running this command `git ignore tags -g`
1. Go to the folder that you want to have ctags for and run `ctags -R --map-javascript=.jsx`
1. Install Ctrl+P [from this github](https://github.com/ctrlpvim/ctrlp.vim) (<--- I never use this, consider removing it)
1. Install import-js [from this github](https://github.com/galooshi/vim-import-js)
1. Install EasyGrep [from this github](https://github.com/dkprice/vim-easygrep)
1. Install vim-airline-clock [from this github](https://github.com/enricobacis/vim-airline-clock)

## ConEmu Settings

|Setting Name|Value|
---|---
Features > Colors | Current Colour Scheme (Custom one that I made to work well with the deus airline them)
Features > Status bar > Show status bar | off
Features > In-console options > Use Clink in prompt | On
Features > Transparency > Alpha transparency > Active window transparency | Off
Main > Main console font | SauceCodePro NF
Main > Main console font size | 12
Main > Background > Background Image | [I use this image](https://wallpaperscraft.com/image/panda_art_apofiss_night_94616_1920x1080.jpg)
Main > Background Placement | Stretch-Fill
Main > Background Darkening | 51
Main > Font Face | Consolas
Main > Quake style > Quake style slide down turned | on
Main > Quake style > Animation time (ms) | 300
Main > Quake style > Appear delay | 100
Main > Quake stlye > Disappear | 100
Main > Size & Position > Window position (pixels) | Centered
Main > Size & Position > Window size | Maximized 
Main > Size & Position > Alignment > Restore to active monitor | On
Main > Tab bar > Tabs on Bottom | On
Main > Update > Do automatic check on | Startup
Main > Update > Preferred release type | Stable
Startup > Startup options > Specified named task | {Bash::Git bash}
Startup > Environment | Added the line `set projects=<projects folder path>`
Startup > Tasks | Added a Tools::Vim task I also set the hotkey for this task to Alt+N
Startup > Tasks > Bash::Git bash | Set the HotKey to LCtrl+Shift+T and also set the startup Project to my projects folder and set as Default task for new console

## Problems I'm sure I can solve but haven't yet

#### Setup eslint and syntastic properly for linting

There are ways in which you can setup eslint to use the install in the node_modules local to your repo one way is to use this plugin called [syntastic-local-vim](https://github.com/mtscout6/syntastic-local-eslint.vim) but I found that on windows this actually breaks with something about ''C:' being an inoperable command, my guess is that there is a space in the path of something that this package tries to run which causes the error but I can't work out what. Because in the above instructions we install eslint globally this should all work correctly but there is a limitation in that we can only have one version of eslint installed globally and if we are workin gon multiple projects with differing versions of eslint then this could be a problem particularly if there are braking changes between the versions. For now this isn't a problem for me but it may be a problem that I have to try and solve later.

#### General ideas

- Making it so that the backup, undo and swap directories are created automatically. Some [ideas for this can be found here](http://vim.wikia.com/wiki/Remove_swap_and_backup_files_from_your_working_directory)
- Get autocompletion for C#

## Problems I've managed to overcome

#### Saving the swap and backup files in a different directory

[This answer on SO](https://stackoverflow.com/a/1625850) explains how to save the swap and backup files to another directory and the other answers explain what exactly these files do.

#### Make it so that when I press escape the highlighting from a search goes away

[This answer on SO](https://stackoverflow.com/a/1037182) explains how to map the esc key to the command `:noh` which clears the search history

#### make it so that tabs are spaces and fix issues where indenting goes screwy

[This answer on SO](https://stackoverflow.com/a/1878983) explains what all the settings are in the vimrc to make all this magic happen

#### Setup eslint and syntastic properly for linting

[Here's a blog post](https://medium.com/usevim/in-editor-linting-with-syntastic-6814122bdbec) that I worked with to try and get eslint running the create-react-app stuff was more trial and error than anything else and I'd like to see if there's a way I can do that better.

I was havin some problems with eslint whereby the plugin was saying that it couldn't get permission to access a file in my user directory with file name `.tmp`. I fixed this following the advice of [this github issue](https://github.com/mattn/gist-vim/issues/48) in which he says:

```
This is not a permissions problem, and windows DOES in fact unset read-only. It's just a GUI bug that it thinks the bit is set. If you don't believe me, bring up the command prompt, cd to where the folder is, then do: dir /a:r. The folder you turned read-only off will not appear, because it really IS off.

The problem is really with the system() call. Just doing this from within vim will reproduce it:
:echo system("echo hi")

The problem is because some shell like cygwin shell is being used. I put these commands at the top of my _vimrc file to solve the problem:
set shell=cmd
set shellcmdflag=/c

This problem is solved now. I am not certain why this fixes it, because it seems like a race condition where the tmp file is created and closed before the process is done using it. The tmp file is in fact created successfully (I saw this with procmon), but it is closed/deleted before it's truely done with it.
```

#### Paths with regards to import statements in javascript

I have included in my vimrc a motion to set the pwd to the directory of the file in the currently selected buffer, to do this you can use `,cd` this helps when you are wanting to do autocompletion with ^X^F and it also helps when you are wanting to use import-js with <Leader>j to find local modules to import. I've found it exceedingly difficult to do either of these with modules brought in with npm as the project I work on can have very deeply nested folder structures and it's not always convenient to work on the root level of the project.
