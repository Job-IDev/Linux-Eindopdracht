install syslogng master:
  pkg.installed:
    - pkgs:
      - syslog-ng

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

create dir log:
  file.directory:
    - name: /var/log/syslog-ng
    - user: JobS
    - group: JobS
    - mode: 755
    - makedirs: True

create file log:
  file.managed:
    - name: /var/log/syslog-ng/logs.txt
    - user: JobS
    - group: JobS
    - mode: 755
    - replace: False

syslog-ng:
  service.running:
    - enable: True
    - reload: True