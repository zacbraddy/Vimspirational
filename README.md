# Vimspirational
A repo that documents my journey into trying to be a developer who uses Vim as well as a place to keep my current setup.

## Table of Contents
- [Steps to setup on Windows](#steps-to-setup-on-windows)
- [ConEmu settings](#conemu-settings)
- [Plugins I'm using](#plugins-im-using)
- [Custom commands and key remaps in my vimrc](#custom-commands-and-key-remaps-in-my-vimrc)
- [Problems I'm sure I can solve but haven't yet](#problems-im-sure-i-can-solve-but-havent-yet)
- [Problems I've managed to overcome](#problems-ive-managed-to-overcome)

## Steps to setup on Windows
1. Install ConEmu, my favourite flavour is [cmder](http://cmder.net/)
1. Pull down my ConEmu settings to give you a basic setup. You need to pull down [this xml file](https://github.com/zacbraddy/Vimispirational/blob/master/con_emu_settings.xml) and then import it into ConEmu through the import functionality available from the settings menu which you can pull up in ConEmu using the shortcut `Win+Alt+P`
1. There are some setting in the ConEMU settings which point to paths on my local machine. Most notably the background image and the path to the vim exectuable for the VIM startup task you'll need to go change them for those to work.
1. Install clink into ConEmu. Download the zip file from [here](https://mridgers.github.io/clink/) then unzip the files directly into `%cmderinstallfolder%\cmder\vendor\conemu-maximus5\ConEmu\clink`. Clink is used to give you advanced autocomplete within the command line. Nothing really to do with vim it just makes ConEmu more powerful.
1. Install the font SauceCodePro NF from [this github repo](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/SourceCodePro) I used the regular weight.
1. Install ack from the [chocolatey repo](https://chocolatey.org/packages/ack). Note this will automatically install StrawberryPerl, to test this has worked correctly run the comman `perl` in the command line. StrawberryPerl adds things to your path variable to make this possible so if running the `perl` command gives you an inoperable command error then close your command window, open a new one and try again. If that doesn't work maybe try adding the paths StrawberryPerl added to the system path to your private path? Other than that you're on your own.
1. Add my little git alias scripts to your global git config. `edit-unmerged` opens all unmerged changes in vim, helpful for when you have merge conflicts and you want to open them all to edit them. `add-unmerged` adds all the unmerged files to the staged changes for after you've done the merge. `prune-branches` deletes all local branches that no longer have a remote on the server. `prune-branches-force` does the same thing but deletes the branch even if it has unpushed changes, be careful with that second one!
1. Install flow globally with `npm i flow -g`
1. Install prettier globally `npm i prettier -g`
1. Got to [vim.org](http://vim.org/) and get the self-installing executable for vim. Install this whereever you wish but remember the path.
1. Put the symlinked vimrc in the `$VIM` directory and change the `g:pathToVimRc` so that it points to the `vimrc` in the folder where you pulled this repo down.
1. Install [vim-plug](https://github.com/junegunn/vim-plug#installation), you only need to put the `.vim` file in the autoload folder of your vimfiles, dead simple
1. Open up vim and use the command `:PI` to install all the plugins probably best to restart VIM after that just to be sure

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

## Plugins I'm using

|Plugin name|Link|Why?|
---|---|---
Sensible|https://github.com/tpope/vim-sensible|The defaults on vim are showing their age a bit and sensible makes vim at it's core behave a little more like you'd expect a modern editor to act.
NERDTree|https://github.com/scrooloose/nerdtree|A file tree for exploring folders and opening up files, I know we're editing in a terminal but there's no need to go overboard here! I don't want to have to type out every file I want to open.
vim-devicons|https://github.com/ryanoasis/vim-devicons|Pretty icons for use in NERDTree to show for different files and obviously I can use these for other places that need icons as well
vim-gitgutter|https://github.com/airblade/vim-gitgutter|Shows icons for lines that have been modified and added in files that I open that are in a git repo. This opens up the ability to us `[c` and `]c` to jump between hunks in a buffer. Might be work looking at the readme on the vim-gitgutter repo as well because there is some cool extensions that might be useful there
Fugitive|https://github.com/tpope/vim-fugitive|I use so much less of this than I should, basically it gives you a heap of super powerful Git based commands to do things like blaming and diffing etc.
Unimpaired|https://github.com/tpope/vim-unimpaired|Give you handy little shortcuts based on `[` and `]` to do things like swap lines and add blank lines above and below etc
vim-javascript|https://github.com/pangloss/vim-javascript|For some of that extra syntax highlighting for javascript and improved indenting
vim-jsx|https://github.com/mxw/vim-jsx|For some of that extra syntax highlighting for JSX etc. etc.
vim-flow|https://github.com/flowtype/vim-flow|Does flow checking when you save a file that is flow enabled and also add some omnicompletion functionality. I have a script in the vimrc that searched for local installs of flow when you open a javascript file and sets the flow path to that install rather than the global one. This might cause problems if you are working on multiple projects with different flow settings but works fine in my situation.
vim-airline|https://github.com/vim-airline/vim-airline|Gives you a nice status bar along the button to show you things about the file you have open and a tab bar along the top that shows all the buffers you have open so you can more easy swithc between buffers at a glance with `:b#` or `[b` or `]b` (the motion commands come from unimpaired)
vim-airline-themes|https://github.com/vim-airline/vim-airline-themes|A plugin to do some extra cool stuff with airline, like different colours etc.
vim-surround|https://github.com/tpope/vim-surround|Does a little more than my little scripts that surrounds a word with quotes, this will change surrounding characters, delete them etc. Basicallty it defines some operator pending bindings that allow you to modify surrouding characters. Again I should us this more than I do.
ack.vim|https://github.com/mileszs/ack.vim|Ack is a code anaylsis and searching tool that you can integrate into vim. This is by far the best way I've found to search and entire project for something.
ALE|https://github.com/w0rp/ale|Asynchronous Linting Engine, does what it says on the tin, tries to lint everything as you type. Thing is either I'm not using it right or this thing isn't asynchronous enough because on my work computer this slows things down a fair bit. Still gotta have something in this department because the alternative is annoying as hell so till I find a better one this is it.
vim-autoclose|https://github.com/townk/vim-autoclose|Just a simple little thing to write a closing bracket after I've typed and opening bracket, still working this into my flow but I can work with it without it getting annoying probably 80% of the time now.

## Custom commands and key remaps in my vimrc

|Command or Key remap|Mode[filetype]|What it does|Why?|
---|---|---|---
`<c-u>`|Normal,Insert|Toggles the case on the current word
`<leader>"`|Normal|Put double quotes around the current word
`<leader>'`|Normal|Put single quotes around the current word
`<localleader>c`|Normal[javascript]|Comment out this line of code
`<localleader>u`|Normal[javascript]|Uncomment this line of code
`jk`|Normal, Visual|Change back to normal mode to save me having to use Esc
`in(`|Operator|Do something with what's in the next set of parentheses on the line
`il(`|Operator|Do something with what's in the previous (last) set of parentheses on the line
`an(`|Operator|Do something with what's in the next set of parentheses on the line, including the parentheses
`al(`|Operator|Do something with what's in the previous (last) set of parentheses on the line, including the parentheses
`<leader>ev`|Normal|Edit the vimrc that vim is currently using
`<leader>sv`|Normal|Source the vimrc again to reload it after making settings changes and the like
`<c-j>,` `<c-k>,` `<c-h>,` `<c-l>`|Normal|Moves the cursor between active windows in the appropriate direction|Just didn't want to have to hit <C-W> before each of them, this simplifies things
:CAB|Command|Silently deletes all open buffers|When I begin a new problem I like to have a clean slate so I close all my buffers before beginning a new
`<esc>`|Normal|Clear highlighting in normal mode to clear that annoying highlighting you get after doing a find
`<F6>`|Normal,Insert|Runs `:set shellslash`|Some plugins I use need `:set noshellslash` to work correctly because I'm on windows however with that set like that when I use ^X^F in insert mode it fills in the wrong slashes for my directories, I needed a quick way to flick between the two
`<F7>`|Normal,Insert|Runs `:set noshellslash`|See above
`<leader>w`, `<leader>h`|Normal|Sets the tab settings to 4 spaces also turns pretiier on and off|My work requires me to use 4 spaces when I'm coding but I prefer 2 so I needed a quick way to switch between the two when I'm switching between doing my own coding and works.
`<leader>cd`|Normal|Sets the pwd to the the directory of the currently open buffer|This helps for when you are trying to use ^X^F that's what it was there for before, although now I'm using vim-rooter I wonder if I don't need this anymore....hmmm....I'll have to test this.
`<F2>`|Normal|Runs the `:NERDTreeToggle` command to open NERDTree|Less key presses to open NERDTree
`PS`|Command|Runs the `:PlugStatus` command to check the status of plugin in vim-plug|Because less keystrokes
`PI`|Command|Runs the `:PlugInstall` command to install plugins with vim-plug|Because less keystrokes

## Problems I'm sure I can solve but haven't yet

- vim-rooter seems to only change the pwd after syntastic as already made it's check which means the first file you open for any project won't automatically get linted because syntastic falls over the background, every subsequent file opened doesn't have this problem because the root has already been changed. This would be a pretty big problem if you were working on two projects at the same time and flicking back and forth but as it stands this is a minor inconvenience for me so I'm leaving it as a problem to solve another day.

- nertree-git-plugin was a plugin that worked with mixed results in the past but I've found that since moving to vim-plug it has stopped working altogether. Not sure which plugin's fault it is as yet, maybe later I can find out what the problem is and try and solve it. For now I'm not so bothered I have vim-gitgutter anyway. I tried everything in [this issue](https://github.com/Xuyuanp/nerdtree-git-plugin/issues/75) but to no avail as at 10/7/2018.

#### General ideas

- Read [this article](https://hackernoon.com/5-vim-plugins-i-cant-live-without-for-javascript-development-f7e98f98e8d5) and start installing summa dem sweet plugins!
- Checkout [YouCompleteMe](https://github.com/Valloric/YouCompleteMe) for code completion. Looks pretty cool!
- Look into ctags again and see if it's worth looking back into, I had it once but barely used it. Maybe I was too quick to judge. Only look after you've looked at YouCompleteMe because that might do everything I wanted ctags to do
- Look into vim-import-js again, seemed like a good pacakage but I barely used it, but then that was before I started coding in JS exclusively so maybe it wil lbe more useful than I thought.
- Would be super cool if I could get the current playing song in spotify into my airline status bar
- I've only just discover <c-w>+<capital H,J,K,L> for changing window positions but before that I was using vim-windowswap but after finding the native functionality this just seemed overkill. If I decide later it was worth it I could reinstall it.
- Find a plugin that closes for html tags too so I can work with JSX in a less annoying fashion too
- Look into vim-react-snippets looks like it could save some time. For that you need Ultisnips which has a dependency on YouCompleteMe so start with YouCompleteMe

## Problems I've managed to overcome

See problems I've managed to overcome archived in [v1.0 of my dotfiles](https://github.com/zacbraddy/Vimspirational/blob/v1.0/README.md#problems-ive-managed-to-overcome)

#### Creating a directory that doesn't exist

I had a problem for a while where I was moving all my swap, undo and backup files to a centralised folder so I didn't have them all over my file system this was fine but I had to create the folders by hand and if I didn't them vim crashed on start up. I found [this SO article](https://stackoverflow.com/a/43880028/5188846) which showed me how to make a directory if it didn't exist so I make the `CreateDirectoryIfNotExist` function in my vimrc and then started using it whenever I wanted to make sure a directory existed.

#### Folding not working for javascript in the JSX files

I was finding that if I loaded up a jsx file for the first time then the code folding didn't work. But if I deleted the buffer and then reloaded it then the folding appeared perfectly. I found this was a problem with these plugins not liking being lazy loaded by vim-plug so I had to have them load on startup.
