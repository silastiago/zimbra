#!/bin/bash

#Escolha o dominio para trazer a lista de todos os usuários.

DOMINIO=interjato.com.br
SUBJECT=teste
for conta in $(zmprov -l gaa $DOMINIO); do

# Na variavel MENSAGEM, preencha o from e o subject da mensagem a ser deletada.

MENSAGEM=$(zmmailbox -z -m "$conta" s -l 999 -t message "from:fulano@empresa.com.br Subject: $SUBJECT" | tail -n2 | head -n1 | awk '{print $2}')


if [ "$MENSAGEM" = "0," ]

then

echo -e "\n conta $conta nao tem a mensagem "

else

# Confirmando antes de apagar a mensagem se o script está funcionando

echo -e "\n  $conta dm $MENSAGEM "


# Para deletar a mensagem de fato, descomente a linha abaixo :

zmmailbox -z -m $conta dm $MENSAGEM


fi

 done
