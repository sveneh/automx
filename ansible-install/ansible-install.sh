#!/bin/bash

# installs Ansible on Ubuntu. Run as root
# http://docs.ansible.com/intro_installation.html#latest-releases-via-apt-ubuntu

if [ "$(whoami)" != "root" ]; then
	echo "$0 needs to be run as root!"
	exit 1
fi

apt-get install --yes software-properties-common
apt-add-repository --yes ppa:ansible/ansible
apt-get update
apt-get install --yes ansible

