#!/bin/bash

# Prompt for username
echo "Enter your username:"
read username

# PSQL command
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

