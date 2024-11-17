#!/bin/bash

# xattr -d com.apple.quarantine /Users/server/Desktop/vpnCheck.sh
# */10 * * * * ~/vpnCheck.sh >/tmp/stdout.log 2>/tmp/stderr.log

#check if VPN is on and connected
if (( $(/sbin/ifconfig | grep -c 10.100.0.2) == 1 )); then
	echo "VPN is on!"

	echo "Checking if Transmission is already running"

	if (ps aux | grep Transmission | grep -v grep > /dev/null)
	then
		  echo "it is"
		  exit 0
	else
		  echo "it is not!"
	fi

	echo "Opening Transmission"
	open /Applications/Transmission.app
	exit 0

else
	echo "VPN is off!"


	echo "Checking if NordVPN is running"

	if (ps aux | grep NordVPN | grep -v grep > /dev/null)
	then
		echo "it is!"
	
		echo "Asking NordVPN to quit"
		#osascript -e 'quit app "NordVPN"'

		echo "Waiting 10 seconds"
		sleep 10
	
		if (ps aux | grep NordVPN | grep -v grep > /dev/null)
		then
			echo "Telling NordVPN to quit"
			#killall NordVPN
			#echo "Waiting 10 seconds"
			#sleep 10
		fi
	  
	else
		  echo "it is not!"
	fi

	#nord VPN is not running now
	
	echo "Opening NordVPN"
	open /Applications/NordVPN.app
	
	echo "Waiting 30 Seconds"
	sleep 30

	echo "Checking if VPN is connected now"
	
	#check if VPN is on and connected
	if (( $(/sbin/ifconfig | grep -c 0xffffff00) == 1 )); then
		echo "VPN is on!"

		# open transmission
		open /Applications/Transmission.app
		
	else
		echo "VPN is still not connected. Ending"

	fi

fi