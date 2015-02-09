#!/bin/bash
# Simple setup.sh for configuring Ubuntu 14.04 LTS EC2 instance
# for headless setup. 

# Correct locale setting (since .bash_profile not used yet for this session)
#export LANGUAGE=en_US:en
#export LANG=en_US.UTF-8
#export LC_ALL=en_US.UTF-8
#locale-gen en_US.UTF-8
#sudo dpkg-reconfigure locales

# Install node.js via package manager (npm is included in chris lea's nodejs package)
# https://github.com/joyent/node/wiki/Installing-Node.js-via-package-manager
#sudo apt-get install -y software-properties-common
#sudo apt-get install -y python-software-properties python g++ make
#sudo add-apt-repository -y ppa:chris-lea/node.js
#sudo apt-get -qq update
#sudo apt-get install -y nodejs

# Install zeromq-node binaries so that npm install zmq works
# https://github.com/JustinTulloss/zeromq.node/wiki/Installation
#sudo add-apt-repository -y ppa:chris-lea/zeromq
#sudo add-apt-repository -y ppa:chris-lea/libpgm
#sudo apt-get update
#sudo apt-get install -y libzmq3-dev

# Install jshint to allow checking of JS code within emacs
# http://jshint.com/
#sudo npm install -g jshint

# Install rlwrap to provide libreadline features with node
# See: http://nodejs.org/api/repl.html#repl_repl
#sudo apt-get install -y rlwrap

# Install emacs24
# https://launchpad.net/~cassou/+archive/emacs
#sudo add-apt-repository -y ppa:cassou/emacs
#sudo apt-get -qq update
#sudo apt-get install -y emacs24-nox emacs24-el emacs24-common-non-dfsg

# Install tmuxinator (help for setting tmux sessions)
#sudo gem install tmuxinator

# Install Heroku toolbelt
# https://toolbelt.heroku.com/debian
#wget -qO- https://toolbelt.heroku.com/install-ubuntu.sh | sh

# git pull and install dotfiles as well

cd $HOME

# Install git
sudo apt-get install -y git

# Install vim
sudo apt-get install vim

# Creat the vim directory
mkdir .vim 
cd .vim
mkdir backup 
mkdir bundle
mkdir doc
mkdir tmp

# Dowload the color for vim
git clone https://github.com/Anthony25/gnome-terminal-colors-solarized
cd gnome-terminal-colors-solarized
sudo sh install.sh

cd $HOME
if [ -d ./dotfiles/ ]; then
    mv dotfiles dotfiles.old
fi
#if [ -d .emacs.d/ ]; then
#    mv .emacs.d .emacs.d~
#fi
git clone https://github.com/clemPal/dotfiles dotfiles
ln -sb dotfiles/.bash_profile .
ln -sf dotfiles/.bashrc .
ln -sb dotfiles/.git-prompt.sh .
ln -sb dotfiles/.gitconfig .
ln -sb dotfiles/.install.sh .
ln -sf dotfiles/.vimrc .

# update bash profile
. ~/.bash_profile

git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
source ~/.bashrc
source ~/.vimrc


# Install Zsh
sudo apt-get install zsh

git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

# Create a new Zsh configuration by copying the Zsh configuration files provided
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

# Set Zsh as your default shell
chsh -s /bin/zsh

echo Open a new Zsh terminal window, adapt the .zpreztorc file with zsh-conf.txt, run the setup2.  
