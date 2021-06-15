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