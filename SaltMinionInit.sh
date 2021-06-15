# Dit is het script om de SaltMinions te installeren.

curl -L https://bootstrap.saltstack.com -o install_salt.sh
sudo sh install_salt.sh
sudo sh -c "echo '10.0.25.36 salt' >> /etc/hosts"