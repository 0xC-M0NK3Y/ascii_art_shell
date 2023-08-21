# ascii_art_shell
Prettify your shell by adding rainbows ascii arts to it.

# What you will install
  
When you launch a terminal it will display random rainbow ascii arts.  
To stop just press any key.  
  
  
https://github.com/0xC-M0NK3Y/ascii_art_shell/assets/102142537/30763fbe-ddee-4242-a848-647e0ad3b875

  
# Installation
  
To install the ascii art in your shell, its simple !  
- Ensure you have python3 and pip installed.  
- Then just launch install.sh giving it your shell config file.
  
For example if you are using bash, your config file is by default in your home folder (~) in .bashrc.  
So if you are using bash you should do like this:  
  
```sh
    $ git clone https://github.com/0xC-M0NK3Y/ascii_art_shell
    $ cd ascii_art_shell
    $ ./install.sh ~/.bashrc
```
  
Then to test it just launch a new shell !  
  
# What does it need ?
  
It will first install some python dependencies  
Then you'll need sudo rights to install lolcat and to add the pretty_ascii_print in /usr/bin  
(you will be prompted the password)  
Then it will scrap https://www.asciiart.eu/ website and download ascii arts from there (in ~/.ascii_art).  
I really suggere you to take a look at install.sh and configure if needed the MAX_WIDTH and MAX_HEIGHT variables.  
Indication to do it are in the script.  
  
# Uninstallation
  
To uninstall its really easy just remove this from your shell config file:  
(the one passed in parameter of install.sh)  
```
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
```
Then to remove the ascii arts and the script needed:    
```sh
    $ rm -rf ~/.ascii_art
    $ sudo rm /usr/bin/pretty_ascii_print
```
If you want to purge all dependencies do:  
```sh
    $ sudo apt remove lolcat
    $ sudo apt autoremove
    $ pip uninstall requests
    $ pip uninstall beautifulsoup4
    $ pip uninstall argparse
```

# The scrapper
  
Take a look at ascii_scrapper if you want to download personnalized ascii arts by remove auto.  
  
```sh
    $ ./ascii_scrapper -h
    usage: ascii_scrapper [-h] [-a] [--min_width MIN_WIDTH] [--max_width MAX_WIDTH]
                          [--min_height MIN_HEIGHT] [--max_height MAX_HEIGHT] [--show]
                          dest
    
    Ascii art scrapper (https://www.asciiart.eu)
    
    positional arguments:
      dest                  Destination folder for the ascii images.
    
    options:
      -h, --help            show this help message and exit
      -a, --auto            Scrap automaticly all asciis that fit in between
                            [min_width,max_width] and [min_height,max_height], you won't be
                            prompted.
      --min_width MIN_WIDTH
                            Min width of the ascii to scrap, automatique or not the paramter
                            count (default 0).
      --max_width MAX_WIDTH
                            Max width of the ascii to scrap, automatique or not the paramter
                            count (default 1000).
      --min_height MIN_HEIGHT
                            Min height of the ascii to scrap, automatique or not the paramter
                            count (default 0).
      --max_height MAX_HEIGHT
                            Max height of the ascii to scrap, automatique or not the paramter
                            count (default 1000).
      --show                If auto is set, show the ascii art with lolcat while saving them,
                            if auto is not set this paramter is ignored.

```
