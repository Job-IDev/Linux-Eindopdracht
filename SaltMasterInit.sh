# Dit zijn de commando's die ik gebruikt heb in de SaltMaster om deze in te stellen als SaltMaster.
# Als eerste wordt hier een update en upgrade gedaan om zeker te weten dat je op de latest version zit en dat deze gelijk is aan de andere machines
# Hierna stel ik de hostname in als salt en installeer ik de saltstack library.

sudo apt-get update
sudo apt-get upgrade -y

sudo hostname salt

curl -L https://bootstrap.saltstack.com -o install_salt.sh
sudo sh install_salt.sh