# Dit is de configuratie file voor nagios. Hierin wordt de configuratie ingesteld.
# Als eerste komt hier de plek van het bestand.
# Daarna wordt de hoofdserver toegevoegd (de salt master)
# Uiteindelijk wordt de service gerestart om zeker van de installatie te zijn.

client address:
  file.line:
    - name: /etc/nagios/nrpe.cfg
    - content: server_address={{ salt['grains.get']('fqdn_ip4')[0] }}
    - match: server_address=127.0.0.1
    - mode: replace

Toevoegen van nagios server address:
  file.line:
    - name: /etc/nagios/nrpe.cfg
    - content: allowed_hosts=127.0.0.1,::1,10.0.25.36
    - match: allowed_hosts=127.0.0.1,::1
    - mode: replace

Toevoegen commands aan nrpe_local:
  file.append:
    - name: /etc/nagios/nrpe_local.cfg
    - text:
      - command[check_root]=/usr/lib/nagios/plugins/check_disk -w 20% -c 10% -p /
      - command[check_ping]=/usr/lib/nagios/plugins/check_ping -H {{ salt['grains.get']('fqdn_ip4')[0] }} -w 100.0,20% -c 500.0,60% -p 5
      - command[check_ssh]=/usr/lib/nagios/plugins/check_ssh -4 {{ salt['grains.get']('fqdn_ip4')[0] }}
      - command[check_http]=/usr/lib/nagios/plugins/check_http -I {{ salt['grains.get']('fqdn_ip4')[0] }}
      - command[check_apt]=/usr/lib/nagios/plugins/check_apt

nagios-nrpe-server:
  service.running:
    - enable: True
    - reload: True