#!/bin/bash

# Reset color
RS="\e[0m"
# Basic Colors
BLACK="\e[0;30m"
RED="\e[0;31m"
GREEN="\e[0;32m"
YELLOW="\e[0;33m"
BLUE="\e[0;34m"
PURPLE="\e[0;35m"
CYAN="\e[0;36m"
WHITE="\e[0;37m"

function_message_title () {
  echo -e "${CYAN}"
  echo -e "# | ::::::::::::::::::::::::::::::::::::::::::::: | #"
  echo -e "# |      ${RS} $1 ${CYAN}"
  echo -e "# | ::::::::::::::::::::::::::::::::::::::::::::: | #"
  echo -e "${RS}"
}

function_check_intall () {
    type -P $1 &>/dev/null && echo -e  "- Installed - ${GREEN} Ok ${RS} - $1" || echo -e  "- Install - ${RED} No ${RS} - $1"
}

SCRIPT_PATH=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )


# install docker
function_message_title '- **Install Docker**'
curl -sSL https://get.docker.com/ | sudo sh

# add my user to docker group
sudo gpasswd -a ${USER} docker

# restart docker
sudo service docker restart

# tell the current terminal about the new docker group changes
newgrp docker

# Install Docker Compose
function_message_title '- **Install Docker Compose**'
sudo apt install python-pip
sudo pip install docker-compose

function_check_intall docker
function_check_intall docker-compose
