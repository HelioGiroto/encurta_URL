#!/bin/bash

function instala() {
	cp encurta.sh encurta
	chmod +x encurta
	sudo mv encurta /bin
	sed -i 's/^instala/#instala/' encurta.sh
}

function HELP() {
	echo "----------------------" 
	echo "BEM VINDO AO ENCURTA!!"
	echo "----------------------"
	echo "Faltou colocar o URL da página que deseja encurtar. Ex.:"
	echo "$ encurta www.facebook.com"
	echo 
	exit
}

instala
if [[ $1 == "" ]]; then HELP; fi
url=$1
if [[ $(echo $1 | grep -Eo "^[h]ttp[s]?://") == "" ]]; then url="http://"$1; fi
new=$(curl -s http://tinyurl.com/api-create.php?url=$url;echo)
echo $new | xclip -selection clipboard
echo "URL encurtado é: $new"
echo "Já está no seu clipboard!! Basta pressionar Ctrl + V"
echo

# Sobre o xclip :
# https://stackoverflow.com/questions/5130968/how-can-i-copy-the-output-of-a-command-directly-into-my-clipboard#5130969

# AUTOR: Helio Giroto
