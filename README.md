# Vimspirational
A repo that documents my journey into trying to be a developer who uses Vim as well as a place to keep my current setup.

## Table of Contents
- [Steps to setup on Windows](#steps-to-setup-on-windows)
- [Steps to setup on MaxOS](#steps-to-setup-on-macos)
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
1. Get the latest version of [vim with python support](https://bintray.com/micbou/generic/vim#) which you'll need for the YouCompleteMe plugin to work (I'm currently running 8.1).
1. Put the symlinked vimrc in the `$VIM` directory and change the `g:pathToVimRc` so that it points to the `mydotfiles.vim` in the folder where you pulled this repo down.
1. Install [vim-plug](https://github.com/junegunn/vim-plug#installation), you only need to put the `.vim` file in the autoload folder of your vimfiles, dead simple
1. Open up vim and use the command `:PI` to install all the plugins probably best to restart VIM after that just to be sure
1. Follow the quick install instructions from the [YouCompleteMe github README](https://github.com/Valloric/YouCompleteMe#windows) you'll need to install Python, CMake and Visual Studio as part of it and then compile the executables using the the install.py with the --js-completer flag. One important distinction from the install README is that in that they compile in the vimfiles/bundle but remember as part of vim-plug we've actually installed the plugin in the vimfiles/plugged folder instead.

## Step to setup on MacOS
1. Install Hyper Terminal from [here](https://hyper.is/). Installing off that website at the time of writing this installs canary which is what I prefer. It gives the latest features at the potential cost of stability but I haven't had any problems with stability so... Do not install via homebrew otherwise it will install stable which at the moment has problems for me.
1. Current canary has a problem where when you hold down a button it doesn't repeat the keypress so to fix that run this: `defaults write co.zeit.hyper ApplePressAndHoldEnabled -bool false`
1. Using terminal (NOT HYPERTERM) delete `~/.hyper.js` and symlink the hyper dot files from this repo using something like `ln -s ~/Projects/Vimspirational/.hyper.js ~/.hyper.js`
1. Install OhMyZsh with this script `sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"`
1. Symlink the .zshrc files that are in the Vimspirational repo `ln -s ~/Projects/Vimspirational/.zshrc ~/.zshrc`
1. Install the font SauceCodePro NF from [this github repo](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/SourceCodePro) I used the regular weight.
1. Install homebrew by executing the following command in hyper `/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"`.
1. Install some requirements for plugins etc using `homebrew install ack node@8 yarn python3`
1. For deoplete to work you have to install the neovim module into your python install so run `pip3 install neovim`
1. Run the following to install vim and macvim linked to update together with hombrew:
```
export PATH=/usr/local/bin:$PATH
brew update
brew install vim && brew install macvim
brew link macvim
```
1. Create a symlink between `mvim` and the `vim` command so you can just type `vim` to get it started. You can do that with this command `ln -s /usr/local/bin/mvim vim`. You can run this command whereever you want but make sure that it's in your User folder somewhere so it doesn't get blown away on startup. I chose to put it in my `.vim` folder.
1. Put the `_vimrc` file in the `$HOME` directory and change the `g:pathToVimRc` so that it points to the `mydotfiles.vim` in the folder where you pulled this repo down. Also change the other 
1. Install [vim-plug](https://github.com/junegunn/vim-plug#installation), you only need to put the `.vim` file in the autoload folder of your `$HOME/.vim` folder, dead simple
1. Open up vim and use the command `:PI` to install all the plugins probably best to restart VIM after that just to be sure
1. Add my little git alias scripts to your global git config. `edit-unmerged` opens all unmerged changes in vim, helpful for when you have merge conflicts and you want to open them all to edit them. `add-unmerged` adds all the unmerged files to the staged changes for after you've done the merge. `prune-branches` deletes all local branches that no longer have a remote on the server. `prune-branches-force` does the same thing but deletes the branch even if it has unpushed changes, be careful with that second one!
1. Install npm packages globally with `npm i flow prettier cowsay lolcatjs -g`

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
vim-closer|https://github.com/rstacruz/vim-closer|Just a simple little thing to write a closing bracket after I've typed and opening bracket.
vim-repeat|https://github.com/tpope/vim-repeat|Repeat commands from things like surround and unimpaired with the `.` instead of having to do them again. Should probably look into what other plugins support this if I'm honest because I'm sure there is more from big daddy TPope.
Deoplete|https://github.com/Shougo/deoplete.nvim|Completion engine that will give you helpful completions for all types of things Note (there are few plugins required for this to work which are folded into the dot files for vim
typescript-vim|https://github.com/leafgarland/typescript-vim|Syntax highlighting and completion for typescript.
vim-jsx-typescript|https://github.com/peitalin/vim-jsx-typescript|Syntax highlighting and completion for JSX inside typescript
vim-buffergator|https://github.com/jeetsukumaran/vim-buffergator|Helps with navigating between the many buffers that you inevitably have open when developing, gives a cool navigator and key bindings to go back through your recently opened buffers.
nerdtree-git-plugin|https://github.com/Xuyuanp/nerdtree-git-plugin|Shows git status icons next to files in nerd tree
vim-merginal|https://github.com/idanarye/vim-merginal|A tool to help navigate between git branches without leaving vim which I should use a lot more than I do

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
`<F2>`, `<leader>nt`|Normal|Runs the `:NERDTreeToggle` command to open NERDTree|Less key presses to open NERDTree
`PS`|Command|Runs the `:PlugStatus` command to check the status of plugin in vim-plug|Because less keystrokes
`PI`|Command|Runs the `:PlugInstall` command to install plugins with vim-plug|Because less keystrokes
`<leader>s`|Normal|Start a command that will replace all instances the word under the cursor with whatever you finish the command with i.e press `<leader>s` then type what you want to replace the word with plus a `/g` and hit enter to replace globally in the doc
`<leader>aj` and `<leader>ak`|Normal|Move to the next or previous ALE error in the document
`<leader>rr|Normal|Replace the current line with the line that is currently in the unnamed register
`<leader>rs`|Normal|Replace the current line with whatever is in the * register


## Custom commands and key remaps in my zshrc

|Command or Key remap|Mode[filetype]|What it does|Why?|
---|---|---|---
`k`|alias|Does `kubectl` so I don't have to type as much
`kadc`|alias|Kill All Docker Containers because sometimes I have latent containers running that conflict and I don't want to have to close them all manually
`gs`, `ga`, `gc`, `gp`, `gd`, `gr`|alias|Shortcuts for `git status` `git add .` `git commit` `git push` `git diff` and `git reset` with cowsay and lolcat goodness for the status

## Problems I'm sure I can solve but haven't yet


#### General ideas

- Find a plugin that closes for html tags too so I can work with JSX in a less annoying fashion too
- Look into vim-react-snippets looks like it could save some time. For that you need Ultisnips which has a dependency on YouCompleteMe so start with YouCompleteMe

## Problems I've managed to overcome

See problems I've managed to overcome archived in [v1.0 of my dotfiles](https://github.com/zacbraddy/Vimspirational/blob/v1.0/README.md#problems-ive-managed-to-overcome)

#### Creating a directory that doesn't exist

I had a problem for a while where I was moving all my swap, undo and backup files to a centralised folder so I didn't have them all over my file system this was fine but I had to create the folders by hand and if I didn't them vim crashed on start up. I found [this SO article](https://stackoverflow.com/a/43880028/5188846) which showed me how to make a directory if it didn't exist so I make the `CreateDirectoryIfNotExist` function in my vimrc and then started using it whenever I wanted to make sure a directory existed.

#### Folding not working for javascript in the JSX files

I was finding that if I loaded up a jsx file for the first time then the code folding didn't work. But if I deleted the buffer and then reloaded it then the folding appeared perfectly. I found this was a problem with these plugins not liking being lazy loaded by vim-plug so I had to have them load on startup.

#### Installed a heap of plugins

- I read [this article](https://hackernoon.com/5-vim-plugins-i-cant-live-without-for-javascript-development-f7e98f98e8d5) and start installed the plugins I thought were cool
