#!/bin/bash

sudo apt update && apt upgrade -y
sudo apt install curl socat -y

sudo curl https://get.acme.sh | sh

~/.acme.sh/acme.sh --set-default-ca --server letsencrypt

read -p "Enter your Email: "$'\n'  Email
~/.acme.sh/acme.sh --register-account -m $Email

read -p "Enter your Domain: "$'\n'  Domain
~/.acme.sh/acme.sh --issue -d $Domain --standalone

~/.acme.sh/acme.sh --installcert -d $Domain --key-file ~/private.key --fullchain-file ~/cert.crt

echo "move private.key and cert from: /home/'userdirectory'"
