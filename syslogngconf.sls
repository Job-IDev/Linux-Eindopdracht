# Dit is de configuratie file van syslog-ng.
# Als eerste wordt er een back-up gemaakt van het bestand.
# Daarna wordt er een nieuwe config file aangemaakt met de laatste updates.
# Uiteindelijk wordt de syslog-ng service opnieuw opgestart.
backup conf file:
  file.rename:
    - name: /etc/syslog-ng/syslog-ng.conf.BAK
    - source: /etc/syslog-ng/syslog-ng.conf

syslog-ng conf:
  file.append:
    - name: /etc/syslog-ng/syslog-ng.conf
    - text: |
        @version: 3.5
        @include "scl.conf"
        @include "`scl-root`/system/tty10.conf"
        source s_local { 
             system(); internal(); 
        };
        source s_apache2 {
             file("/var/log/apache2/access_log");
             file("/var/log/apache2/error_log");
        };
        source s_mysql {
             file("/var/log/mysql/error_log");
        };
        destination loghost { syslog("salt" transport("tcp") port(514)); };
        log { source(s_local); destination(loghost); };

syslog-ng:
  service.running:
    - enable: True
    - reload: True