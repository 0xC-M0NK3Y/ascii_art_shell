#!/bin/bash

if [ $# -ne 1 ]
then
	echo "Usage $0 <shell config file>"
	echo "It will add at the bottom the lines needed to prettify your terminal with rainbow asciis"
	exit
fi

# CHANGE THESE VALUES TO FIT YOUR TERMINAL SIZE WHEN LAUNCHED !!!
# use the tput cols for MAX_WIDTH and tput lines for MAX_HEIGHT
# do as you prefere for MIN_WIDTH and MIN_HEIGHT
MIN_WIDTH=10
MAX_WIDTH=189
MIN_HEIGHT=0
MAX_HEIGHT=44

# install python dependencies
echo "Installing python dependencies"
pip install requests
pip install beautifulsoup4
pip install argparse

# install lolcat and pretty_ascii_print
echo "Needing sudo to install lolcat and install the pretty_ascii_print"
sudo apt install lolcat
sudo cp -v pretty_ascii_print /usr/bin/

echo "Yeah now we need to download some asciis !" | lolcat
echo ""
if [ -d ~/.ascii_art ]
then
	echo "You have already a ~/.ascii_art folder" | lolcat
	echo ""
	echo "Change this script to install the asciis in a different directory or remove/rename the ~/.ascii_art folder" | lolcat
	echo ""
	echo 'Use: sed -i "s/~\/.ascii_art/<path where to install>/g" install.sh' | lolcat
	echo "Don't forget to escape the /" | lolcat
	exit
fi

mkdir ~/.ascii_art
echo "Now be patient and wait for the ascii art to come to you" | lolcat
echo ""
./ascii_scrapper ~/.ascii_art/ -a --show --min_width $MIN_WIDTH --max_width $MAX_WIDTH --min_height $MIN_HEIGHT --max_height $MAX_HEIGHT

# This will be added into your shell config file
cat << EOF >> $1
# Added by ascii shell
while [ 1 ]
do
	clear
	pretty_ascii_print ~/.ascii_art
	sleep 0.5
	read -r -t 0.01 -s -n 1
	if [ \$? -eq 0 ]
	then
		break
	fi
done
EOF
