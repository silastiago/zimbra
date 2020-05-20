#!/bin/bash

LISTA=$1

DIRETORIO=$(cat /usr/local/bin/$LISTA)
MES=$(date +"%m")
MESANTERIOR=$(date +"%m" -d "-1 month")
MESANTERIOR2=$(date +"%m" -d "-2 month")
ANO=$(date +"%Y")
ANOANTERIOR=$(date +"%Y" -d "-1 year")
DIA=$(date +"%d")
DIAANTERIOR=$(date --date "`date +%m/01/%Y` yesterday" +%d)
DATA="$MES/$DIA/$ANO"

if [ "$MES" -eq "01"  ]
then

echo "if"
DATAANTERIOR="$MESANTERIOR2/01/$ANOANTERIOR"
echo $DATAANTERIOR

for EMAIL  in $DIRETORIO; do

query="&query=after:$DATAANTERIOR"
#query="&query=after:12/31/2015 before:01/01/2016"
COMANDO="zmmailbox -z -m $EMAIL getRestURL '//?fmt=tgz$query' > /backup/$EMAIL.tar.gz"
#echo $COMANDO

expect -c "
spawn ssh -o StrictHostKeyChecking=no root@mail.interjato.com.br
send \"su - zimbra\r\"
send \"$COMANDO\r\"
send \"exit\r\"
send \"exit\r\"
interact
"

done

else

echo "else"

DATAANTERIOR="$MESANTERIOR2/$DIAANTERIOR/$ANOANTERIOR"
echo $DATAANTERIOR

for EMAIL  in $DIRETORIO; do

query="&query=after:$DATAANTERIOR"
#query="&query=after:04/30/2017 before:07/01/2019"
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


fi


