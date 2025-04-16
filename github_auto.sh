#!/bin/bash

#check if git is installed
 if ! command -v git &> /dev/null

then
	echo "Git not found. Installing..."
	sudo apt update && sudo apt install git -y
else
	echo "Git already installed"
fi

#Inputs 
read -p "enter your username: " name
read -p "enter your e-mail: " mail

git config --global user.name "$name"
git config --global user.email "$mail"
git config --global init.defaultBranch main

echo -e "\n Git configured successfully!"
echo -e "\n active configs:"

git config --list
#ssh key creation 
while true; do 
	read -p "Do you want to create a ssh key to connect with github? choose 1 or 0 ;P (We will use your mail used above^): " boolean
	
	if [[ "$boolean" == "1" ]]; then

			ssh-keygen -t ed25519 -C "$mail" -f "$HOME/.ssh/id_ed25519" -N ""
			eval "$(ssh-agent -s)"
			ssh-add "$HOME/.ssh/id_ed25519"
			echo "your public key! "
			cat "$HOME/.ssh/id_ed25519"
		fi
	break

done	

for i in {1..3}; do
	clear
	echo "byeee"
	printf "%${i}s\n" | tr ' ' '.'
	sleep 0.9
done

