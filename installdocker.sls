# Dit is het installatie bestand voor de docker. Hier wordt docker.io gedownload en de service herstart.
install docker:
  pkg.installed:
    - pkgs:
      - docker.io
docker:
  service.running:
    - enable: True
    - reload: True