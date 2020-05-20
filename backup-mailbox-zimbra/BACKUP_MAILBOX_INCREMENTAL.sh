#!/bin/bash

LISTA=$1

DIRETORIO=$(cat /usr/local/bin/$LISTA)
MES=$(date +"%m")
MESANTERIOR=$(date +"%m" -d "-1 month")
ANO=$(date +"%Y")
ANOANTERIOR=$(date +"%Y" -d "-1 year")
DIA=$(date +"%d")
DIAANTERIOR=$(date +"%d" -d "-1 days")
DATA="$MES/$DIA/$ANO"

echo $DATA
echo $DATAANTERIOR

if [ "$DIA" -eq "01" ] && [ "$MES" -eq "01"  ]
then 

echo "if"
DATAANTERIOR="$MESANTERIOR/$DIAANTERIOR/$ANOANTERIOR"

for EMAIL  in $DIRETORIO; do

#query="&query=after:$DATAANTERIOR"
query="&query=after:12/31/2015 before:01/01/2016"
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

elif [ "$DIA" -eq "01" ]
then

DATAANTERIOR="$MESANTERIOR/$DIAANTERIOR/$ANO"
for EMAIL  in $DIRETORIO; do

query="&query=after:$DATAANTERIOR"
#query="&query=after:04/30/2017 before:07/01/2019"
COMANDO="zmmailbox -z -m $EMAIL getRestURL '//?fmt=tgz$query' > /backup/$EMAIL.tar.gz"
#echo $COMANDO

expect -c "
spawn ssh -o StrictHostKeyChecking=no root@example.com.br
send \"su - zimbra\r\"
send \"$COMANDO\r\"
send \"exit\r\"
send \"exit\r\"
interact
"

done


else


DATAANTERIOR="$MES/$DIAANTERIOR/$ANO"
for EMAIL  in $DIRETORIO; do


query="&query=after:$DATAANTERIOR"
#query="&query=after:04/30/2017 before:07/01/2019"
COMANDO="zmmailbox -z -m $EMAIL getRestURL '//?fmt=tgz$query' > /backup/$EMAIL.tar.gz"
#echo $COMANDO

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


