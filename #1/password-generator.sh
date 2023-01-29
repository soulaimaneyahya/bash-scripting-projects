#!/bin/bash

# simple-password-generator
echo "=== simple-password-generator ==="
read -p "Please enter the length of the password: " PASS_LENGTH
read -p "How many passwords you want to be generated: " PASS_COUNT
# generates a sequence nbr of pswds
for p in $(seq 1 $PASS_COUNT); do
	# openssl will generate random base64 48 chars, cut from first char - length of pswd.
	openssl rand -base64 48 | cut -c1-$PASS_LENGTH
done

# Set the length of the password
# length=12
# # Generate a random password using tr and /dev/urandom
# password=$(tr -dc A-Za-z0-9 < /dev/urandom | head -c $length)
# # Print the generated password
# echo "Generated password: $password"
