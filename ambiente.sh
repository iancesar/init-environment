#!/bin/bash

#VSCODE Extensions 51a22222ed19f23e57b7fd122116c7d3


echo "Criando diretórios"
mkdir -p /home/ian/Dev/Java /home/ian/Dev/Node /home/ian/Dev/Docker /home/ian/Dev/ReactNative /home/ian/Dev/Flutter

cd /home/ian/init-envoriment

echo "Atualizando os repositórios"
sudo apt-get update

echo "Instalando Curl e Wget"
sudo apt-get install curl -y
sudo apt-get install wget -y


echo "Instalando OpenJDK 8" 

sudo apt-get remove openjdk*
sudo apt-get remove --auto-remove openjdk*
sudo apt-get purge openjdk*
sudo apt-get purge --auto-remove openjdk*

sudo add-apt-repository ppa:openjdk-r/ppa
sudo apt-get update
sudo apt-get install openjdk-8-jdk -y

echo "Instalando Google Chrome"

wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt-get install ./google-chrome-stable_current_amd64.deb -y

echo "Instalando Postman"

wget https://dl.pstmn.io/download/latest/linux64 -O postman-linux-x64.tar.gz
tar -xvzf postman-linux-x64.tar.gz -C /opt
ln -s /opt/Postman/Postman /usr/bin/postman
cat << EOF > ~/.local/share/applications/postman2.desktop
[Desktop Entry]
Name=Postman
GenericName=API Client
X-GNOME-FullName=Postman API Client
Comment=Make and view REST API calls and responses
Keywords=api;
Exec=/opt/Postman/Postman
Terminal=false
Type=Application
Icon=/opt/Postman/app/resources/app/assets/icon.png
Categories=Development;Utilities;
EOF

echo "Instalando VS Code"

wget https://go.microsoft.com/fwlink/?LinkID=760868 -O vscode.deb
apt install ./vscode.deb -y

echo "Instalando SUBLIME"

echo "deb https://download.sublimetext.com/ apt/stable/" |  tee /etc/apt/sources.list.d/sublime-text.list
echo "deb https://download.sublimetext.com/ apt/dev/" |  tee /etc/apt/sources.list.d/sublime-text.list
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg |  apt-key add -
sudo apt-get update
sudo apt-get install sublime-text -y


echo "Instalando GIT"
apt install git -y

echo "Instalando Git Ahead"
wget "https://github.com/gitahead/gitahead/releases/download/v2.6.1/GitAhead-2.6.1.sh" -O gitahead.sh
sh gitahead.sh

echo "Instalando DBeaver"
wget https://dbeaver.io/files/dbeaver-ce_latest_amd64.deb -O DBeaver.deb
apt install ./DBeaver.deb -y

echo "Instalando Docker e Docker Compose"

# https://docs.docker.com/install/linux/docker-ce/ubuntu/
sudo apt-get install -y \
 apt-transport-https \
 ca-certificates \
 curl \
 gnupg-agent \
 software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
echo -e "\ndeb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable" | sudo tee -a /etc/apt/sources.list

sudo apt-get update
sudo apt-get install docker-ce-cli -y
sudo apt-get autoremove -y

# https://docs.docker.com/compose/install/
sudo curl -L "https://github.com/docker/compose/releases/download/1.24.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/bin/docker-compose
sudo chmod +x /usr/bin/docker-compose

# https://docs.docker.com/compose/completion/
sudo curl -L https://raw.githubusercontent.com/docker/compose/1.24.1/contrib/completion/bash/docker-compose -o /etc/bash_completion.d/docker-compose

# https://docs.docker.com/install/linux/linux-postinstall/
sudo groupadd docker
sudo usermod -aG docker $USER

echo "Instalando o STS"
wget https://download.springsource.com/release/STS4/4.5.1.RELEASE/dist/e4.14/spring-tool-suite-4-4.5.1.RELEASE-e4.14.0-linux.gtk.x86_64.tar.gz -O STS.tar.gz
tar -xvzf STS.tar.gz -C /home/ian/Dev/Java

echo "Instalando o Maven"
sudo apt-get install maven -y

echo "Instalando o NVM"
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash

. ~/.nvm/nvm.sh
. ~/.profile
. ~/.bashrc

nvm install 12.16.1

. ~/.nvm/nvm.sh
. ~/.profile
. ~/.bashrc

echo "Instalando o YARN"
npm install yarn

echo "Instalando o Quasar"
yarn global add @quasar/cli

reboot
