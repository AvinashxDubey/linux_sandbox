#!/bin/bash

if [ $# -eq 0 ]; then
	echo "Error: No package name provided."
	echo "Usage: ./package_installer.sh <package-name> [more-packages...]"
	exit 1
fi

echo "refreshing package list from repositories..."
sudo apt update -y

# loop through all the package arguments
for package in "$@"; do
	echo "installling: $package..."
	sudo apt install -y "$package"

	if [ $? -eq 0 ]; then
		echo "$package installed successfully!"
	else
		echo "failed to install $package"
	fi
done
