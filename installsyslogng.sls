# Dit is de installatie file voor syslog-ng. Alleen syslog-ng wordt hierin geïnstalleerd.
install syslog-ng:
  pkg.installed:
    - pkgs:
      - syslog-ng