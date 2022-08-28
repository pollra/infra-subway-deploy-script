#!/bin/bash

function docker_install {
  sudo apt-get update && \
  sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common && \
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - && \
  sudo apt-key fingerprint 0EBFCD88 && \
  sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" && \
  sudo apt-get update && \
  sudo apt-get install -y docker-ce && \
  sudo usermod -aG docker ubuntu && \
  sudo curl -L "https://github.com/docker/compose/releases/download/1.23.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose && \
  sudo chmod +x /usr/local/bin/docker-compose && \
  sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose 
}

function custom_prompt {
  echo "# custom prompt - pollra" >> ~/.bashrc
  echo "USERNAME=SERVER_NAME" >> ~/.bashrc
  echo "PS1='[\e[1;31m$USERNAME\e[0m][\e[1;32m\t\e[0m][\e[1;33m\u\e[0m@\e[1;36m\h\e[0m \w] 
\n\$ \[\033[00m\]'" >> ~/.bashrc
  source ~/.bashrc
}

custom_prompt;
