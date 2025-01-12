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
  GAMES_PLAYED=0
  BEST_GAME="N/A"
else
  # If username exists
  GAMES_PLAYED=$(echo $USER_INFO | cut -d '|' -f 1 | xargs)
  BEST_GAME=$(echo $USER_INFO | cut -d '|' -f 2 | xargs)

  # If best_game is null, set it to N/A
  if [[ -z $BEST_GAME || $BEST_GAME == 'NULL' ]]
  then
    BEST_GAME="N/A"
  fi

  # If games_played is null, set it to 0
  if [[ -z $GAMES_PLAYED || $GAMES_PLAYED == 'NULL' ]]
  then
    GAMES_PLAYED="0"
  fi

  echo "Welcome back, $username! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi
