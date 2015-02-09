cd $HOME

# Install fasd for j jump in zsh
wget -qO- https://codeload.github.com/clvv/fasd/legacy.zip/1.0.1 > fasd.zip
unzip fasd.zip
cd clvv-fasd-4822024
sudo make install
cd ~/
rm -rf clvv-fasd-4822024
rm -f fasd.zip

# To get the great arrows
cd .zprezto/modules/prompt/functions
wget https://raw.githubusercontent.com/paradox460/prezto/paradox/modules/prompt/functions/prompt_paradox_setup

cd $HOME
mkdir .fonts
wget https://gist.github.com/qrush/1595572/raw/51bdd743cc1cc551c49457fe1503061b9404183f/Inconsolata-dz-Powerline.otf
wget https://gist.github.com/qrush/1595572/raw/417a3fa36e35ca91d6d23ac961071094c26e5fad/Menlo-Powerline.otf
wget https://gist.github.com/qrush/1595572/raw/2eb22321d590265799aac5b166cd19f8358b0db1/mensch-Powerline.otf

# source completion file for tmuxinator
#source .tmuxinator/tmuxinator.bash

# Install sails.js MVC framework for node.js (commented since ubismart now installs it)
#sudo npm -g install sails

# Install MQTT tools
#sudo apt-get install -y mosquitto python-mosquitto mosquitto-clients
#sudo rm /etc/init/mosquitto.conf # because I don't want mosquitto as a startup service
#sudo npm -g install mosca # mosca installed globally if not included in ubismart

# Install i386 architecture & system-level 32bit libs to run yap (eye)
# This bit is Ubuntu 14.04 specific!
#sudo dpkg --add-architecture i386
#sudo apt-get update
#sudo apt-get install -y libc6:i386 libncurses5:i386 libstdc++6:i386
# Install yap specific 32bit lib
#sudo apt-get install -y zlib1g:i386


# config for efficient git
git config --global user.name "clemPal"
git config --global user.email "clement.palliere@hotmail.fr"
ssh-keygen -t rsa -N "" -C "clement.palliere@hotmail.fr" -f ~/.ssh/id_rsa
ssh-add id_rsa
echo "You should copy the next line into a new ssh key on github (https://github.com/settings/ssh)."
cat ~/.ssh/id_rsa.pub
echo "Then you can run 'ssh -T git@github.com' to check that the connection is working."
