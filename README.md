# Vimispirational
A repo that documents my journey into trying to be a developer who uses Vim as well as a place to keep my current setup.

## Table of Contents
- [Steps to setup on Windows](#steps-to-setup-on-windows)
- [ConEmu settings](#conemu-settings)
- [Problems I'm sure I can solve but haven't yet](#problems-im-sure-i-can-solve-but-havent-yet)
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
1. Install vim-javascript for syntax highlighting [from this github](https://github.com/pangloss/vim-javascript).
1. Install vim-jsx for jsx syntax highlighting [from this github](https://github.com/mxw/vim-jsx).
1. Install vim-flow for flow static type checking [from this github](https://github.com/flowtype/vim-flow). I have a script in the vimrc that will make this plugin us the version of flow installed locally to your repo so no need to install this globally although if you find a problem this may be that this script is failing.
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
1. Install import-js [from this github](https://github.com/galooshi/vim-import-js)
1. Install vim-airline-clock [from this github](https://github.com/enricobacis/vim-airline-clock)
1. Install vim-rooter [from this github](https://github.com/airblade/vim-rooter)
1. Add the `npm-exec.bat` file to the `$VIM\bundle` folder (note when I say `\$VIM` I mean your install directory under the vimfiles folder so for example `C:\Vim\vim\vimfiles\bundle`.
1. Add the `$VIM\bundle` folder to your PATH variable.
1. Add my little git alias scripts to your global git config. `edit-unmerged` opens all unmerged changes in vim, helpful for when you have merge conflicts and you want to open them all to edit them. `add-unmerged` adds all the unmerged files to the staged changes for after you've done the merge. `prune-branches` deletes all local branches that no longer have a remote on the server. `prune-branches-force` does the same thing but deletes the branch even if it has unpushed changes, be careful with that second one!
1. Install ack from the [chocolatey repo](https://chocolatey.org/packages/ack). Note this will automatically install StrawberryPerl, to test this has worked correctly run the comman `perl` in the command line. StrawberryPerl adds things to your path variable to make this possible so if running the `perl` command gives you an inoperable command error then close your command window, open a new one and try again. If that doesn't work maybe try adding the paths StrawberryPerl added to the system path to your private path? Other than that you're on your own.
1. Install ack.vim via pathogen the command is on [their repo](https://github.com/mileszs/ack.vim)
1. Install ALE via pathogen, see [their github for details](https://github.com/w0rp/ale)
1. Install prettier globally `npm i prettier -g`

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

## Custom commands and key remaps in my vimrc

|Command or Key remap|Mode|What it does|Why?|
---|---|---|---
:CAB|Command|Silently deletes all open buffers|When I begin a new problem I like to have a clean slate so I close all my buffers before beginning a new
`<C-J>,` `<C-K>,` `<C-H>,` `<C-L>`|Normal|Moves the cursor between active windows in the appropriate direction|Just didn't want to have to hit <C-W> before each of them, this simplifies things
`<F2>`|Normal|Runs the `:NERDTreeToggle` command to open NERDTree|Less key presses to open NERDTree
`<F3>`|Normal|Runs `:NERDTreeFind`|I thought this was going to be useful in the beginning but now I barely use it because when I open buffers it's normally through NERDTree anyway
`<esc>`|Normal|Runs the `:noh` command|This is to clear the highlighting left behind from a regex search in fewer key presses
`<F4>`|Normal|Runs `:NumbersToggle`|Originally when I started using relative line numbers I thought this would be useful, I barely use it now I'm used of relative line numbers and could probably get rid of it
`<F5>`|Normal|Runs `:NumbersOnOff`|See above
`<F6>`|Normal,Insert|Runs `:set shellslash`|Some plugins I use need `:set noshellslash` to work correctly because I'm on windows however with that set like that when I use ^X^F in insert mode it fills in the wrong slashes for my directories, I needed a quick way to flick between the two
`<F7>`|Normal,Insert|Runs `:set noshellslash`|See above
`<leader>w`, `<leader>h`|Normal|Sets the tab settings to 4 spaces|My work requires me to use 4 spaces when I'm coding but I prefer 2 so I needed a quick way to switch between the two when I'm switching between doing my own coding and works
,cd|Normal|Sets the pwd to the the directory of the currently open buffer|This helps for when you are trying to use ^X^F that's what it was there for before, although now I'm using vim-rooter I wonder if I don't need this anymore....hmmm....I'll have to test this.
;n|Insert,Visual|Presses esc i.e. changes back to normal mode|Just wanted to try and avoid having to leave the home row to press esc as often as I could
`<leader>fm`, `<leader>fi`|Normal|Sets the fold method to marker or indent as appropriate|Just so I can flick on and off folding in my code if I wanted to. Rarely used but still useful

## Problems I'm sure I can solve but haven't yet

- vim-rooter seems to only change the pwd after syntastic as already made it's check which means the first file you open for any project won't automatically get linted because syntastic falls over the background, every subsequent file opened doesn't have this problem because the root has already been changed. This would be a pretty big problem if you were working on two projects at the same time and flicking back and forth but as it stands this is a minor inconvenience for me so I'm leaving it as a problem to solve another day.

#### General ideas

- Read [this article](https://hackernoon.com/5-vim-plugins-i-cant-live-without-for-javascript-development-f7e98f98e8d5) and start installing summa dem sweet plugins!
- Checkout [YouCompleteMe](https://github.com/Valloric/YouCompleteMe) for code completion. Looks pretty cool!
- Making it so that the backup, undo and swap directories are created automatically. Some [ideas for this can be found here](http://vim.wikia.com/wiki/Remove_swap_and_backup_files_from_your_working_directory)

## Problems I've managed to overcome

#### Saving the swap and backup files in a different directory

[This answer on SO](https://stackoverflow.com/a/1625850) explains how to save the swap and backup files to another directory and the other answers explain what exactly these files do.

#### Make it so that when I press escape the highlighting from a search goes away

[This answer on SO](https://stackoverflow.com/a/1037182) explains how to map the esc key to the command `:noh` which clears the search history

#### make it so that tabs are spaces and fix issues where indenting goes screwy

[This answer on SO](https://stackoverflow.com/a/1878983) explains what all the settings are in the vimrc to make all this magic happen

#### Paths with regards to import statements in javascript

I have included in my vimrc a motion to set the pwd to the directory of the file in the currently selected buffer, to do this you can use `,cd` this helps when you are wanting to do autocompletion with ^X^F and it also helps when you are wanting to use import-js with <Leader>j to find local modules to import. I've found it exceedingly difficult to do either of these with modules brought in with npm as the project I work on can have very deeply nested folder structures and it's not always convenient to work on the root level of the project.

#### Getting Airline to look pretty

I found that the airline theme mixing with the cmdr colours was a bit of a pain. The Airline theme definitely has some affect on the colours but basically I just had to choose an airline theme that was close to what I wanted and then tweak my cmdr colours until I got something I liked. What I found that sucked is that the cmdr uses the same colour for both Insert and Visual mode so I couldn't choose different colours for them but hey ho. As for the symbols needed to make airline look pretty I was able to use [this SO article answer](https://vi.stackexchange.com/questions/3359/how-do-i-fix-the-status-bar-symbols-in-the-airline-plugin) to make the changes I needed to the vimrc. I skipped the installing the appropriate fonts bit because my SauceCode Nerd Font works fine. I also deleted the first line out of every two in the vimrc lines in the stack overflow article because they were duplicates and did nothing for the config anyway.

#### ALE falling over and not linting or fixing

I had this problem whereby it ALE just stopped working all together. I found after a while that it looked like ALE was finding the global eslint for linting but then trying to execute a local one, which was a problem if you didn't have a local one. IN the end I found that stuff I'd tried to do for syntatic below was getting in the way, particularly these line in the in the `_vimrc`:

```
set shell=cmd
set shellcmdflag=/c
```
I removed these and ALE came back to life.

## Things I've tried that didn't work out for me

I had a quick try of Ctrl+P but I found it a bit hard to get my head around and when I was able to make it do what I needed it to I found it quite slow. It's entirely possible this was my fault and lack of understanding, it might be worth revisiting it when I have more experience.

I also tried EasyGrep, again I found that when I finally got it to do what I wanted it to do it was prohibitively slow. I could have spent more time figuring out what I needed to do to optimise it but then I found a post from the creator of EasyGrep who suggested Ack. This worked perfectly. I should clarify, what I wanted EasyGrep to do was search for tokens in all files in my project for this I found it was far too slow, however the basic functions mapped to the leader keys for grepping across the buffers that were open or active window were excellent, but then I could probably get then from mappings in my vimrc pretty easily.

The below is no longer a problem as after using syntastic for some time I found it slowed opening and saving my files down way too much. I may have configured it wrong but none the less it just didn't help me. I found ALE and this was a much better alternative for me as it just worked out of the box.

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

I spent bloody ages trying to get syntasic to work with the linting in my work's project. Because I had installed everything for eslint globally and used that instead of trying to hack around and make it use the local eslint it means that you needed to make sure that I had all the same versions of eslint and it's plugins installed globally as my project did locally. I did this for a while but I eventually found a way to make the local install work. This involved using the `npm-exec.bat` that I foudn [here](https://gist.github.com/joeyespo/a532500f5615bf3a4bacf1f410407115) and the also installing vim-rooter to change the root path for me as I opened files so I didn't have to do it myself with the `,cd` command I had for myself. 

Whilst I was investigating all this I also found that a useful command `set noshellslash` can help Windows to understand the different slashes that are used in paths in vim. There's lots of info about problems with shell setting as they pertain to windows machines [here](https://github.com/airblade/vim-system-escape). In the end I only needed the `noshellslash`

