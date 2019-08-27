# Vimspirational
A repo that documents my journey into trying to be a developer who uses Vim as well as a place to keep my current setup.

## Table of Contents
- [Steps to setup on Windows](#steps-to-setup-on-windows)
- [Steps to setup on MaxOS](#steps-to-setup-on-macos)
- [Plugins I'm using](#plugins-im-using)
- [Custom commands and key remaps in my vimrc](#custom-commands-and-key-remaps-in-my-vimrc)
- [Problems I'm sure I can solve but haven't yet](#problems-im-sure-i-can-solve-but-havent-yet)
- [Problems I've managed to overcome](#problems-ive-managed-to-overcome)

## Install
Note: These install instructions are for linux. There are install instructions for windows and MacOS in their appropriate markdown files but they are out of date now as I'm now using linux solely for development

1. Install Hyper Terminal from [here](https://hyper.is/). Installing off that website at the time of writing this installs canary which is what I prefer. It gives the latest features at the potential cost of stability but I haven't had any problems with stability so... The website will give you an AppImage that you have to make executable and then run.
1. Using terminal (NOT HYPERTERM) delete `~/.hyper.js` and symlink the hyper dot files from this repo using something like `ln -s ~/Projects/Vimspirational/.hyper.js ~/.hyper.js`
1. Install OhMyZsh with this script `sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"`
1. Symlink the .zshrc files that are in the Vimspirational repo `ln -s ~/Projects/Vimspirational/.zshrc ~/.zshrc`
1. Symlink the .zshrc files that are specific for linux that get sourced in `ln -s ~/Projects/Vimspirational/.zshrc.linux ~/.zshrc.linux` understand that part of the linux zshrc sets up npm to use a global repo in your home directory so you don't have to sudo install global packages. This means that if you had an npmrc previously it won't overwrite with the correct settings. Checkout the npm global install settings in this file to see what is needed.
1. Install the font SauceCodePro NF from [this github repo](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/SourceCodePro) I used the regular weight.
1. Install some requirements for plugins etc using `sudo apt-get install ack-grep nodejs yarn python3 httpie silversearcher-ag tmux vim-gnome`
1. Symlink .tmux.conf to the one in the repo using the same method as above, for some reason vim goes funny when you open my dot files in anything other than tmux so you'll need to do the rest within tmux.
1. Install gcloud components
```
# Add the Cloud SDK distribution URI as a package source
echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] http://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list

# Import the Google Cloud Platform public key
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -

# Update the package list and install the Cloud SDK
sudo apt-get update && sudo apt-get install google-cloud-sdk
```
1. Install the kubernetes-cli
```
sudo apt-get update && sudo apt-get install -y apt-transport-https
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee -a /etc/apt/sources.list.d/kubernetes.list
sudo apt-get update
sudo apt-get install -y kubectl
```
1. Hook up your gcloud instances, checkout the commands in th GCP console for this, it's a copy pasta job
1. Install kubectx and kubens
```
sudo git clone https://github.com/ahmetb/kubectx /opt/kubectx
sudo ln -s /opt/kubectx/kubectx /usr/local/bin/kubectx
sudo ln -s /opt/kubectx/kubens /usr/local/bin/kubens
mkdir ~/.oh-my-zsh/completions
sudo chmod -R 755 ~/.oh-my-zsh/completions
sudo ln -s /opt/kubectx/completion/kubectx.zsh ~/.oh-my-zsh/completions/_kubectx
sudo ln -s /opt/kubectx/completion/kubens.zsh ~/.oh-my-zsh/completions/_kubens
```
1. Put the `_vimrc` file in the `$HOME` directory and change the `g:pathToVimRc` so that it points to the `mydotfiles.vim` in the folder where you pulled this repo down. Also change the other 
1. Install [vim-plug](https://github.com/junegunn/vim-plug#installation) by opening up vim the dot files will automatically download vim-plug and install all the plugins, you'll have a few error messages to hit enter through but after that, close down 
1. Add my little git alias scripts to your global git config. `edit-unmerged` opens all unmerged changes in vim, helpful for when you have merge conflicts and you want to open them all to edit them. `add-unmerged` adds all the unmerged files to the staged changes for after you've done the merge. `prune-branches` deletes all local branches that no longer have a remote on the server. `prune-branches-force` does the same thing but deletes the branch even if it has unpushed changes, be careful with that second one!
1. Install npm packages globally with `npm i flow prettier cowsay lolcatjs grecent -g`

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
vim-autopairs|https://github.com/jiangmiao/auto-pairs|Just a simple little thing to write a closing bracket after I've typed and opening bracket.
vim-repeat|https://github.com/tpope/vim-repeat|Repeat commands from things like surround and unimpaired with the `.` instead of having to do them again. Should probably look into what other plugins support this if I'm honest because I'm sure there is more from big daddy TPope.
CoC|https://github.com/neoclide/coc.nvim|Completion engine that will give you helpful completions for all types of things 
typescript-vim|https://github.com/leafgarland/typescript-vim|Syntax highlighting and completion for typescript.
vim-jsx-typescript|https://github.com/peitalin/vim-jsx-typescript|Syntax highlighting and completion for JSX inside typescript
vim-buffergator|https://github.com/jeetsukumaran/vim-buffergator|Helps with navigating between the many buffers that you inevitably have open when developing, gives a cool navigator and key bindings to go back through your recently opened buffers.
nerdtree-git-plugin|https://github.com/Xuyuanp/nerdtree-git-plugin|Shows git status icons next to files in nerd tree
vim-merginal|https://github.com/idanarye/vim-merginal|A tool to help navigate between git branches without leaving vim which I should use a lot more than I do
ctrl-p|https://github.com/kien/ctrlp.vim|Fuzzy finder for files in the current working directory also you can navigate between buffers and recent files. Pretty awesome, just have to remember to use it :P
indentPython|https://github.com/vim-scripts/indentpython.vim|I....I mean, come on. It does proper indenting for python right?
vim-flake8|https://github.com/nvie/vim-flake8|Does syntax checking etc. for python
itchy|https://github.com/idbrii/itchy.vim|A plugin to help easily make scratch buffers
Codi|https://github.com/metakirby5/codi.vim|Makes vim a REPL for a number of different languages, quit useful for quick prototyping in node
targets|https://github.com/wellle/targets.vim|Awesome extensions to changing thing within brackets and apostrophes or tags etc.

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
`<leader>y` `<leader>d`|Normal, Visual|Yank or delete into the star register in less keystrokes
`<leader>p` `<leader>P`|Normal, Visual|Put out of the * register in less keystrokes
`<leader>gs`|Normal, Visual|Open a scratch buffer

## Custom commands and key remaps in my zshrc

|Command or Key remap|Mode[filetype]|What it does|Why?|
---|---|---|---
`k`|alias|Does `kubectl` so I don't have to type as much
`kb`|alias|Does `kubens` so I don't have to type as much
`kc`|alias|Does `kubectx` so I don't have to type as much
`kadc`|alias|Kill All Docker Containers because sometimes I have latent containers running that conflict and I don't want to have to close them all manually
`gs`, `ga`, `gc`, `gp`, `gd`, `gr`|alias|Shortcuts for `git status` `git add .` `git commit` `git push` `git diff` and `git reset` with cowsay and lolcat goodness for the status

## Things I've tried and moved away from

## Problems I'm sure I can solve but haven't yet

#### General ideas

- Find a plugin that closes for html tags too so I can work with JSX in a less annoying fashion too
- Look into vim-react-snippets looks like it could save some time. For that you need Ultisnips which has a dependency on YouCompleteMe so start with YouCompleteMe

## Problems I've managed to overcome

See problems I've managed to overcome archived in [v2.0 of my dotfiles](https://github.com/zacbraddy/Vimspirational/blob/v2.0/README.md#problems-ive-managed-to-overcome)

