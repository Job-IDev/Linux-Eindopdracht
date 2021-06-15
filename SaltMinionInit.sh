# Dit is het script om de SaltMinions te installeren.

curl -L https://bootstap.saltstack.com -o install_salt.sh
sh install_salt.sh
sh -c "echo '10.0.25.36 salt' >> /etc/hosts"