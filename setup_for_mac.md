## Step to setup on MacOS
1. Install Hyper Terminal from [here](https://hyper.is/). Installing off that website at the time of writing this installs canary which is what I prefer. It gives the latest features at the potential cost of stability but I haven't had any problems with stability so... Do not install via homebrew otherwise it will install stable which at the moment has problems for me.
1. Current canary has a problem where when you hold down a button it doesn't repeat the keypress so to fix that run this: `defaults write co.zeit.hyper ApplePressAndHoldEnabled -bool false`
1. Using terminal (NOT HYPERTERM) delete `~/.hyper.js` and symlink the hyper dot files from this repo using something like `ln -s ~/Projects/Vimspirational/.hyper.js ~/.hyper.js`
1. Install OhMyZsh with this script `sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"`
1. Symlink the .zshrc files that are in the Vimspirational repo `ln -s ~/Projects/Vimspirational/.zshrc ~/.zshrc`
1. Symlink the .zshrc files that are specific for mac that get sourced in `ln -s ~/Projects/Vimspirational/.zshrc.mac`
1. Install the font SauceCodePro NF from [this github repo](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/SourceCodePro) I used the regular weight.
1. Install homebrew by executing the following command in hyper `/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"`.
1. Install some requirements for plugins etc using `brew install ack node@8 yarn python3 kubernetes-cli kubectx the_silver_searcher`
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
1. Install npm packages globally with `npm i flow prettier cowsay lolcatjs grecent -g`
