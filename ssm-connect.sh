#!/bin/bash

read -p "Enter target (instance ID): " target
read -p "Enter profile : " profile

if [[ -z "$target" || -z "profile" ]]; then
	echo "Error: both target and profile are requiered."
else
	echo "Press CTRL + C to close..."

	aws ssm start-session --target "$target" --profile "$profile"
fi

