#!/bin/bash
PHPSESSID=`curl -s -D - -d "Name=bgov&Passwort=$1" -u "bgovmv:$2" -k https://www.dgob.de/mv/anmeldung_ueberpruefung.php | grep PHPSESSID | cut -f2 -d"=" | cut -f1 -d";"`
HTML=`curl -s -X POST --data 'LVID=09' -u "bgovmv:$2" -k -H "Cookie: PHPSESSID=$PHPSESSID" -D - https://www.dgob.de/mv/daten/anzeigen_mitglieder.php`
echo -n $HTML | node parse_members.js 
