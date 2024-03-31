#!/bin/bash -e

yum install -y curl git
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.14.0
. ./CommonInstall.sh
