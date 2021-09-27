#!/bin/sh

# General principles.
# Domanin services in

# Can I setup Users 
# All software is to be installed at the top of the users home directory.

# Make sure we are in the user directory
cd

###################################################
# Start by updating the database
sudo apt update -yy
sudo apt upgrade -yy
sudo apt-get update -yy
sudo apt-get upgrade -yy

echo "Log Begin" | cat >> theLog.txt
echo $(date) | cat >> theLog.txt
echo "" | cat >> theLog.txt

###################################################
# No, not a best practice  - Create root password
# Yes - Create M21 password
# Yes -Create Ubuntu password
# Create Other User?
# Add many21ai to the admins group
# why is my login able to act as sudo without having a password set

# /home/many21ai/.local/bin/blueprint

###################################################
# Make a connection to python3
# sudo apt install python-is-python3
# sudo apt install python3-pip

# http://devstructure.com/blueprint/
# python --version
# pip install blueprint

# Add utilities
# https://phoenixnap.com/kb/install-rpm-packages-on-ubuntu
sudo apt-get install alien -yy

sudo apt install mlocate -yy
sudo apt install tree -yy

# utilities
# https://stackoverflow.com/questions/1152362/how-to-send-data-to-local-clipboard-from-a-remote-ssh-session


###################################################
# Install Java from command line
# Java
# https://stackoverflow.com/questions/10268583/downloading-java-jdk-on-linux-via-wget-is-shown-license-page-instead
sudo mkdir /usr/java/
cd /usr/java/
sudo wget --no-check-certificate -c --header "Cookie: oraclelicense=accept-securebackup-cookie" https://download.oracle.com/otn-pub/java/jdk/16.0.2%2B7/d4a915d82b4c4fbb9bde534da945d746/jdk-16.0.2_linux-x64_bin.rpm
sudo alien jdk-16.0.2_linux-x64_bin.rpm -yy 
sudo dpkg -i jdk-16.0.2_16.0.2-1_amd64.deb -yy
# Clean up files
sudo rm -r jdk-16.0.2_linux-x64_bin.rpm 
sudo rm -r jdk-16.0.2_16.0.2-1_amd64.deb 
cd #return to home directory
# Do i need to add a user?
# Do i need to check the path

###################################################
# Docker
	# https://docs.docker.com/engine/install/ubuntu/
sudo apt-get remove docker docker-engine docker.io containerd runc
sudo apt-get update
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    lsb-release -yy
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
#less /etc/apt/sources.list.d/docker.list
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io -yy
sudo groupadd docker
sudo usermod -aG docker $USER
sudo rm -r ~/.docker/
# https://docs.docker.com/config/daemon/systemd/
# You will need to log out for changes to take effect

###################################################
# google cloud
# python --version
# python3 --version
# curl -O https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-351.0.0-linux-x86_64.tar.gz
# I have a version of this in my snap folder.
# I am going to hold off on install.
# locate docker | less
# https://cloud.google.com/code/docs/intellij/client-libraries#for-all-other-projects
# https://cloud.google.com/code/docs/intellij/client-libraries#cloud-run_1

# google cloud python

# miniKube
# Log into google Cloud account
# Running Gcloud --version tells me miniKube it is already there.

###################################################
# Install Gnome Shell
# https://subscription.packtpub.com/book/big_data_and_business_intelligence/9781788474221/1/ch01lvl1sec15/installing-and-configuring-ubuntu-desktop-for-google-cloud-platform
sudo apt-get update -yy
sudo apt-get upgrade -yy
sudo apt-get install gnome-shell -yy
sudo apt-get install ubuntu-gnome-desktop -yy
sudo apt-get install autocutsel  -yy
sudo apt-get install gnome-core -yy
sudo apt-get install gnome-panel  -yy
sudo apt-get install gnome-themes-standard -yy

###################################################
# Install I3
# https://www.tecmint.com/i3-tiling-window-manager/
sudo apt update -yy
sudo apt install i3 -yy


#####################################################
# Chrome Remote Desktop
wget https://dl.google.com/linux/direct/chrome-remote-desktop_current_amd64.deb -P /tmp
sudo apt install /tmp/chrome-remote-desktop_current_amd64.deb


###################################################
# Chrome
# https://kifarunix.com/install-google-chrome-browser-on-ubuntu-20-04/
sudo wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -P /tmp
sudo apt install /tmp/google-chrome-stable_current_amd64.deb -yy

#Log into the newly created vm

###################################################
# Install tools app
# Install Pycharm
#	Enable the google cloud code plog-in

###################################################
# Resources
# https://linuxize.com/post/how-to-install-python-3-7-on-ubuntu-18-04/

# VM and google Cloud
# https://cloud.google.com/architecture/chrome-desktop-remote-on-compute-engine
# https://remotedesktop.google.com/headless
# https://kifarunix.com/install-and-setup-chrome-remote-desktop-on-ubuntu-20-04/
# https://subscription.packtpub.com/book/big_data_and_business_intelligence/9781788474221/1/ch01lvl1sec15/installing-and-configuring-ubuntu-desktop-for-google-cloud-platform


# sys admin
# https://tldp.org/LDP/lame/LAME/linux-admin-made-easy/changing-user-passwords.html
# https://www.baeldung.com/linux/path-variable
# https://unix.stackexchange.com/questions/241215/how-can-i-find-out-which-users-are-in-a-group-within-linux
# getent group name_of_group
# https://serverfault.com/questions/3852/what-tool-do-you-recommend-to-track-changes-on-a-linux-unix-server
# https://www.youtube.com/watch?v=oxuRxtrO2Ag
# https://linuxhint.com/change_users_password_linux/


# Cloud run
# https://kubernetes.io/docs/tasks/tools/
# https://docs.gitlab.com/charts/development/minikube/
# https://minikube.sigs.k8s.io/docs/handbook/vpn_and_proxy/
# https://community.spiceworks.com/topic/2206557-chrome-remote-desktop-what-specific-udp-port-ranges-need-to-be-opened
# https://cloud.google.com/container-registry
# https://cloud.google.com/logging/docs/reference/tools/gcloud-logging


# Windows Managers / Display
# https://i3wm.org/docs/userguide.html
# https://kifarunix.com/install-and-setup-i3-windows-manager-on-ubuntu-20-04/
# https://www.keyxl.com/aaae677/56/Linux-Gnome-Window-Manager-keyboard-shortcuts.htm
# https://www.linuxtrainingacademy.com/install-desktop-on-ubuntu-server/
# Unity (The Default Desktop)
# sudo apt install ubuntu-desktop
# LXDE (Lubuntu)
# sudo apt-get install lubuntu-desktop
# MATE
# sudo apt-get install mate-desktop
# Gnome
# sudo apt-get install ubuntu-gnome-desktop
# XFCE (Xubuntu)
# sudo apt-get install xubuntu-desktop
#
# https://devanswers.co/how-to-fix-authentication-is-required-to-create-a-color-profile-managed-device-on-ubuntu-20-04-20-10/

# Remote desktop
# https://www.linuxbabe.com/ubuntu/apache-guacamole-remote-desktop-ubuntu-20-04
# https://computingforgeeks.com/install-and-use-guacamole-on-ubuntu/

