# De top.sls wordt gebruikt als begin, hierin staan de verwijzingen naar de overige .sls bestanden

base:
    '*':
    - installnagios
    - nagiosconf
    - installsyslogng
	- syslogngconf
    'saltminion1*':
    - installwordpress
    'saltminion2*':
    - installdocker
	'saltmaster*':
	- installsyslogngmaster