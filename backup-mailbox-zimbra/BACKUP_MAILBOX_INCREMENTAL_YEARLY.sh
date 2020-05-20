#!/bin/bash

LISTA=$1

DIRETORIO=$(cat /usr/local/bin/$LISTA)
ANO=2019
ANOAFTER="12/31/2018"
ANOBEFORE="01/01/2020"



for EMAIL  in $DIRETORIO; do

query="&query=after:$ANOAFTER before:$ANOBEFORE"
COMANDO="zmmailbox -z -m $EMAIL getRestURL '//?fmt=tgz$query' > /backup/$EMAIL.tar.gz"

expect -c "
spawn ssh -o StrictHostKeyChecking=no root@example.com.br
send \"su - zimbra\r\"
send \"$COMANDO\r\"
send \"exit\r\"
send \"exit\r\"
interact
"

done



