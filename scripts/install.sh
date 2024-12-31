#!/bin/bash

# Install Docker
curl https://desktop.docker.com/mac/main/arm64/Docker.dmg --output Docker.dmg
sudo hdiutil attach Docker.dmg
sudo /Volumes/Docker/Docker.app/Contents/MacOS/install --accept-license --user=$USER
sudo hdiutil detach /Volumes/Docker
sudo rm Docker.dmg

# Install k3d
brew install k3d

# Install Helm
brew install helm