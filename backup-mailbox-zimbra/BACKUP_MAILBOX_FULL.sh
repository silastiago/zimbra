#!/bin/bash

LISTA=$1

DIRETORIO=$(cat /usr/local/bin/$LISTA)

for EMAIL  in $DIRETORIO; do

COMANDO="zmmailbox -z -m $EMAIL getRestURL '//?fmt=tgz' > /backup/$EMAIL.tar.gz"

expect -c "
spawn ssh -o StrictHostKeyChecking=no root@example.com.br
send \"su - zimbra\r\"
send \"$COMANDO\r\"
send \"exit\r\"
send \"exit\r\"
interact
"


done


