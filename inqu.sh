#!/bin/bash

#Inquisitione tool 
: 'Flags:

- `-h --help` - Showcase all the flags
- Example command: ./main.sh 10.10.10.10 -os linux -l3 -s -o /home/bros10 
- `-os linux/windows --operating_system linux/windows`  - 2 options are linux or windows. Default value = linux
- `-l1,-l2,-l3,-l4 --level`  - This will affect the amount of ports scanned, wordlists used for web enum etc
- `-s --split` - Whether to use tmux to split and create multiple terminals. If this flag is set it will split
- `-o --output` - Path to directory where all the scans will be outputted
'

display_help() {
    echo "Usage: inqu -i IP_ADDRRESS [OPTIONS]"
    echo "EXAMPLES:"
    echo "inqu -i 10.10.10.10 -os linux -l3 -s -o /home/bros10"
    echo "-h --help - Showcase all the flags"
    echo "- Example command: ./main.sh 10.10.10.10 -os linux -l3 -s -o /home/bros10"
    echo "- -os linux/windows --operating_system linux/windows  - 2 options are linux or windows. Default value = linux"
    echo "- -l1,-l2,-l3,-l4 --level  - This will affect the amount of ports scanned, wordlists used for web enum etc"
    echo "- -s --split - Whether to use tmux to split and create multiple terminals. If this flag is set it will split"
    echo "- -o --output - Path to directory where all the scans will be outputted"
}

# Default values of arguments
OPERATING_SYSTEM=0 #0 == Linux, 1 == Windows
SHOULD_SPLIT=0
SHOW_HELP=0
OUTPUT_DIRECTORY="/tmp"
LEVEL=1
IP_ADDRESS=""


# Loop through arguments and process them


for arg in "$@"
do
    case $arg in
        -h|--help)
        SHOW_HELP=1
        echo "$(display_help)"
        shift
        ;;
        -i|--ip_address)
        IP_ADDRESS="$2"
        shift
        shift
        ;;
        -os|--operating_system)
        if [[ "$2" == "windows" ]]; then
            OPERATING_SYSTEM=1
        fi
        shift
        shift
        ;;
        -l*|--level*)
        LEVEL=${arg#*l}
        shift # Removing -level from processing
        ;;
        -s|--split)
        SHOULD_SPLIT=1
        shift # Remove --split from processing
        ;;
        -o|--output)
        OUTPUT_DIRECTORY="$2"
        shift # Remove argument name from processing
        shift # Remove argument value from processing
        ;;
    esac
done


echo "IP $IP_ADDRESS"
echo "help : $SHOW_HELP"
echo "os: $OPERATING_SYSTEM"
echo "output: $OUTPUT_DIRECTORY"