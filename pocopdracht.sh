#Dit zijn de commando's om via salt de verschillende services werkende te krijgen
sudo salt 'saltminion2*' cmd.run 'docker run -t ubuntu' # de -t opent een oneindige sessie. Als andere optie is er -d voor een kortere sessie.
nmap -p 80 10.0.25.43 #Hierbij is de 10.0.25.43 de webserver en de 80 poort duid een website aan.