#Exit the script if any individual command fails
set -e

#Un-comment this next line if you want to see exactly what this script is doing
#set -x

if [ "$(whoami)" != "root" ]
then
  	echo "You must run this script with sudo."
  	exit 1
fi

#Assign a default value if the network adapter name is missing
adapter=${2-en0}

#Check the number of arguments and confirm with user if they are correct
if [ $# -lt 1 ]
        then echo "At least one argument must be specified: <REQUIRED: File containing MAC list> <OPTIONAL: Network adapter name (Default is 'en0')>"
                exit 1
        else
			while IFS=, read mac; do
			echo "Setting mac address to ${mac}"
			ifconfig ${adapter} ether ${mac}

			echo "Enabling ICS and sleeping for 5 minutes"
			if [ ! -f /System/Library/LaunchDaemons/com.apple.InternetSharing.plist ]
			    then
			        osascript toggleSharing.scpt
			    else
			        sudo launchctl load -w /System/Library/LaunchDaemons/com.apple.InternetSharing.plist
			fi
			sleep 300

			echo "Disabling adapter and sleeping for 10s"
			networksetup -setairportpower ${adapter} off
			sleep 10

			echo "Enabling adapter and sleeping for 10s"
			networksetup -setairportpower ${adapter} on
			sleep 10

			echo "Disabling ICS and sleeping for 10s"
			if [ ! -f /System/Library/LaunchDaemons/com.apple.InternetSharing.plist ]
			    then
			        osascript toggleSharing.scpt
			    else
			        sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.InternetSharing.plist
			fi
			sleep 10

			done <$1
fi


