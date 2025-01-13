#!/bin/bash 

# Prompt for username
echo "Enter your username:"
read username

# PSQL command
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

# Check if username exists in the database
USER_INFO=$($PSQL "SELECT games_played, best_game FROM users WHERE username = '$username'")

if [[ -z $USER_INFO ]]
then
  # If username doesn't exist
  echo "Welcome, $username! It looks like this is your first time here."
  $PSQL "INSERT INTO users (username) VALUES ('$username')" > /dev/null
  GAMES_PLAYED=0
  BEST_GAME="N/A"
else
  # If username exists, retrieve values
  GAMES_PLAYED=$(echo $USER_INFO | cut -d '|' -f 1 | xargs)
  BEST_GAME=$(echo $USER_INFO | cut -d '|' -f 2 | xargs)

  # Handle NULL or empty values explicitly
  if [[ -z $BEST_GAME || $BEST_GAME == 'NULL' ]]
  then
    BEST_GAME="N/A"
  fi

  if [[ -z $GAMES_PLAYED || $GAMES_PLAYED == 'NULL' ]]
  then
    GAMES_PLAYED="0"
  fi

  echo "Welcome back, $username! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

# Game logic - randomly generate a secret number
SECRET_NUMBER=$(( RANDOM % 1000 + 1 ))
GUESS_COUNT=0

# Game loop for guessing
echo "Guess the secret number between 1 and 1000:"
while true
do
  read guess
  ((GUESS_COUNT++))

  if ! [[ "$guess" =~ ^[0-9]+$ ]]
  then
    echo "That is not an integer, guess again:"
  elif [[ "$guess" -gt "$SECRET_NUMBER" ]]
  then
    echo "It's lower than that, guess again:"
  elif [[ "$guess" -lt "$SECRET_NUMBER" ]]
  then
    echo "It's higher than that, guess again:"
  else
    # This is the corrected message format
    echo "You guessed it in $GUESS_COUNT tries. The secret number was $SECRET_NUMBER. Nice job!"
    break
  fi
done

# After game, update database
# Increment games_played and update best_game if needed
if [[ "$BEST_GAME" == "N/A" || "$GUESS_COUNT" -lt "$BEST_GAME" ]]
then
  BEST_GAME=$GUESS_COUNT
fi

# Update the games_played and best_game in the database
$PSQL "UPDATE users SET games_played = games_played + 1, best_game = $BEST_GAME WHERE username = '$username'" > /dev/null
