#!/bin/bash

# Prompt for username
echo "Enter your username:"
read username

# PSQL command
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

# Check if username exists in database
USER_INFO=$($PSQL "SELECT games_played, best_game FROM users WHERE username = '$username'")

if [[ -z $USER_INFO ]]
then
  # If username doesn't exist
  echo "Welcome, $username! It looks like this is your first time here."
  $PSQL "INSERT INTO users (username) VALUES ('$username')"
else
  # If username exists
  GAMES_PLAYED=$(echo $USER_INFO | cut -d '|' -f 1 | xargs)
  BEST_GAME=$(echo $USER_INFO | cut -d '|' -f 2 | xargs)
  echo "Welcome back, $username! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi