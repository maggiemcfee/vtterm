#!/bin/bash
clear
cat<<'EOF'


██╗   ██╗████████╗    ████████╗███████╗██████╗ ███╗   ███╗
██║   ██║╚══██╔══╝    ╚══██╔══╝██╔════╝██╔══██╗████╗ ████║
██║   ██║   ██║          ██║   █████╗  ██████╔╝██╔████╔██║
╚██╗ ██╔╝   ██║          ██║   ██╔══╝  ██╔══██╗██║╚██╔╝██║
 ╚████╔╝    ██║          ██║   ███████╗██║  ██║██║ ╚═╝ ██║
  ╚═══╝     ╚═╝          ╚═╝   ╚══════╝╚═╝  ╚═╝╚═╝     ╚═╝


EOF

PS3="START TERMINAL - CHOOSE TERM OPTION: "

select term in 115200 9600 2400 APC-UPS Exit
do
    case $term in
            "115200")
            echo "Starting minicom at 115200 baud"
            minicom -c on -b 115200 -o -D /dev/ttyUSB0
            exec $0;;
            "9600")
           echo "Starting minicom at 9600 baud"
           minicom -c on -b 9600 -o -D /dev/ttyUSB0
           exec $0;;
           "2400")
            echo "Starting minicom at 2400 baud"
            minicom -c on -b 2400 -o -D /dev/ttyUSB0
            exec $0;;
            "APC-UPS")
            echo "Starting minicom for APC USB cable"
            minicom -c on -b 115200 -o -D /dev/ttyUSB0
            exec $0;;
            "Exit")
           echo "Exiting to shell"
           break;;
        *)
           echo "Unknown option"
           
           exec $0;;
    esac
done