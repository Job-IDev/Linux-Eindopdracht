# Dit is het script om de SaltMinions te installeren.
# Als eerste haal ik de saltstack library op en installeer ik deze.
# Vervolgens wordt het ip van de salt master ingesteld als 'salt' zodat de machines automatisch verbinden.

curl -L https://bootstrap.saltstack.com -o install_salt.sh
sudo sh install_salt.sh
sudo sh -c "echo '10.0.25.36 salt' >> /etc/hosts"