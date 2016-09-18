#!/bin/bash -e

# installs Ansible on Ubuntu. Run as root.
# Don't install via repo to prevent accidential update surprises

UBUNTU_RELEASE=trusty
ANSIBLE_PPA_ARCHIVE=https://launchpad.net/~ansible/+archive/ubuntu/ansible/+files
ANSIBLE_INSTALL_VERSION=2.1.1.0
ANSIBLE_DEB_NAME=ansible_${ANSIBLE_INSTALL_VERSION}-1ppa~${UBUNTU_RELEASE}_all.deb

if [ "$(whoami)" != "root" ]; then
    echo "$0 needs to be run as root!"
    exit 1
fi

export DEBIAN_FRONTEND=noninteractive
apt-get update
apt-get install --yes gdebi-core 
curl --silent --show-err --location --output /tmp/${ANSIBLE_DEB_NAME} ${ANSIBLE_PPA_ARCHIVE}/${ANSIBLE_DEB_NAME}
gdebi --non-interactive --quiet /tmp/${ANSIBLE_DEB_NAME}
