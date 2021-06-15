# Dit zijn de commando's die ik gebruikt heb in de SaltMaster om deze in te stellen als SaltMaster.

sudo apt-get update
sudo apt-get upgrade

sudo apt-get install salt-master salt-minion
sudo hostname salt

curl -L https://bootstrap.saltstack.com -o install_salt.sh
sudo sh install_salt.sh