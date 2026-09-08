#!/bin/bash
set -euo pipefail

(echo "Welcome to the SSM Connect tool!"

read -p "Which AWS profile do you want to use?: " AWSPROFILE
if [ -z "$AWSPROFILE" ]; then
    echo "Error: profile cannot be empty" >&2
    exit 1
fi

aws ec2 describe-instances --profile "$AWSPROFILE" \
  --query 'Reservations[*].Instances[*].{ID:InstanceId,Name:Tags[?Key==`Name`]|[0].Value}' \
  --output table

read -p "What EC2 instance do you want to connect to (use the ID, e.g. i-xxxxxxxx)?: " INSTANCE
if [ -z "$INSTANCE" ]; then
    echo "Error: instance ID cannot be empty" >&2
    exit 1
fi

aws ssm start-session --target "$INSTANCE" --profile "$AWSPROFILE")
