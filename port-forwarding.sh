#!/bin/bash

read -p "Enter target (Instance ID):" target
read -p "Enter port you want to forward (Example '13389'): " localportnumber
read -p "Enter profile: " profile

if [[ -z "$target" || -z "$localportnumber" || -z "$profile" ]]; then
	echo "Error: you are missing a parameter"
else

	echo "Press CTRL + C to close..."

	aws ssm start-session --target "$target" --document-name AWS-StartPortForwardingSession --parameters portNumber=3389,localPortNumber="$localportnumber" --profile "$profile"
fi

