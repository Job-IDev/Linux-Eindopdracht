# Dit zijn de commando's die ik gebruikt heb in de SaltMaster om deze in te stellen als SaltMaster.

apt-get update
apt-get upgrade

apt-get install salt-master salt-minion
hostname salt

wget -O - https://repo.saltstack.com/apt/ubuntu/18.04/amd64/latest/SALTSTACK-GPG-KEY.pub | sudo apt-key add -