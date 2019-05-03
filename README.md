#Documentacio POP3 y POP3S

#Arquitectura

Disposem de un servidor de correu que funcionan amb els protocols pop3 (port 110) i pop3s (995). Aquest servidor estará localitzat en la nostra maquina de amazon AWS en una xarxa anomenada popnet.

popnet --> Xarxa on estará el nostre servidor de correu

raulbaena/m11raul:v1 --> Servidor de correu pop3 y pop3. Amb l'usuari pere i l'usuaria marta.


#Implementació

Dintre de amazon obrim els ports 995 i 110.
Ens trobem en la nostra maquina de amazon, lo primer que farem será la xarxa on estara situat el nostre servidor de correu. En aquest cas s'anomenará "popnet". Per poder crear aquesta xarxa executarem la seguent comanda:
```
docker network create popnet
```
Un cop creada la nostra xarxa ens dispondrem a descarregar el nostre servidor de correu. El nostre correu s'anomenará "popserver". Per executar-lo fem la següent comanda:
```
 docker run --rm --name popserver -h popserver -p 110:110 -p 995:995 --network popnet -d raulbaena/m11raul:v1
```
Ja un cop estigui el servidor en execució comprovem que s'han obert els ports correctament de la nostra maquina de amazon
```
[root@ip-172-31-19-108 fedora]# nmap localhost

Starting Nmap 7.60 ( https://nmap.org ) at 2019-05-03 09:32 UTC
Nmap scan report for localhost (127.0.0.1)
Host is up (0.0000070s latency).
Other addresses for localhost (not scanned): ::1
Not shown: 997 closed ports
PORT    STATE SERVICE
22/tcp  open  ssh
110/tcp open  pop3
995/tcp open  pop3s
```


#Troubleshooting

Farem la primera comprobació del funcionament del nostre servidor de correu. Ens situem en el nostre host del aula i ens dispondrem a connectarnos al notre servidor de correu mitjançant telnet. En aquesta proba utilitzarem el famos usuari "pere" amb el qual ens conectarem al servidor desde el host del aula. En aquest cas pere no te cap missatge per llegir
```
[isx53320159@i12 ~]$ telnet 18.130.46.1 110
Trying 18.130.46.1...
Connected to 18.130.46.1.
Escape character is '^]'.
+OK POP3 popserver 2007f.104 server ready
USER pere
+OK User name accepted, password please
PASS pere
+OK Mailbox open, 0 messages
RATR 1
-ERR Unknown TRANSACTION state command
RETR 1
-ERR No such message
```