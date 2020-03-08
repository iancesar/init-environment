#!/bin/bash

#VSCODE Extensions 51a22222ed19f23e57b7fd122116c7d3


echo "Criando diretórios"
mkdir -p /home/$USER/init-envoriment /home/$USER/Dev/Java /home/$USER/Dev/Node /home/$USER/Dev/Docker /home/$USER/Dev/ReactNative /home/$USER/Dev/Flutter

cd /home/$USER/init-envoriment

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

echo "Instalando VS Code"

wget https://go.microsoft.com/fwlink/?LinkID=760868 -O vscode.deb
sudo apt install ./vscode.deb -y

echo "Instalando SUBLIME"

echo "deb https://download.sublimetext.com/ apt/stable/" |  tee /etc/apt/sources.list.d/sublime-text.list
echo "deb https://download.sublimetext.com/ apt/dev/" |  tee /etc/apt/sources.list.d/sublime-text.list
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg |  apt-key add -
sudo apt-get update
sudo apt-get install sublime-text -y


echo "Instalando GIT"
sudo apt install git -y

echo "Instalando Git Ahead"
wget "https://github.com/gitahead/gitahead/releases/download/v2.6.1/GitAhead-2.6.1.sh" -O gitahead.sh
sh gitahead.sh

echo "Instalando DBeaver"
wget https://dbeaver.io/files/dbeaver-ce_latest_amd64.deb -O DBeaver.deb
sudo apt install ./DBeaver.deb -y

echo "Instalando o STS"
wget https://download.springsource.com/release/STS4/4.5.1.RELEASE/dist/e4.14/spring-tool-suite-4-4.5.1.RELEASE-e4.14.0-linux.gtk.x86_64.tar.gz -O STS.tar.gz
tar -xvzf STS.tar.gz -C /home/$USER/Dev/Java

echo "Instalando o Maven"
sudo apt-get install maven -y

echo "Compass"
wget https://downloads.mongodb.com/compass/mongodb-compass_1.20.5_amd64.deb -O compass.deb
sudo apt install ./compass.deb -y

echo "Instalando o NVM"
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash

. ~/.nvm/nvm.sh
. ~/.profile
. ~/.bashrc

nvm install v12.16.1

. ~/.nvm/nvm.sh
. ~/.profile
. ~/.bashrc

echo "Instalando o YARN"
npm install yarn

echo "Instalando o Vue Cli"
yarn global add @vue/cli

echo "Instalando o Quasar"
yarn global add @quasar/cli

echo "Instalando o Android Studio"
sudo apt-get install libc6:i386 libncurses5:i386 libstdc++6:i386 lib32z1 libbz2-1.0:i386 -y
wget https://dl.google.com/dl/android/studio/ide-zips/3.6.1.0/android-studio-ide-192.6241897-linux.tar.gz?hl=pt-br -O android-studio.tar.gz
tar -xvzf android-studio.tar.gz -C /home/$USER/Dev

echo 'Criando atalhos'
sudo su
echo 'Postman'
cat << EOF > /usr/share/applications/postman.desktop
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

echo 'STS'
cat << EOF > /usr/share/applications/sts.desktop
[Desktop Entry]
Name=Spring Tool Suite
GenericName=STS 
X-GNOME-FullName=Spring Tool Suite
Comment=Spring Tool Suite
Keywords=dev;
Exec=/home/$USER/Dev/Java/sts-4.5.1.RELEASE/SpringToolSuite4
Terminal=false
Type=Application
Icon=/home/$USER/Dev/Java/sts-4.5.1.RELEASE/SpringToolSuite4/icon.xpm
Categories=Development;Utilities;
EOF

reboot
