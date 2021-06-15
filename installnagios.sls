# Nagios installeren, hierbij download ik de nrpe server en de plugins.
install nagios:
  pkg.installed:
    - pkgs:
      - nagios-nrpe-server
      - nagios-plugins