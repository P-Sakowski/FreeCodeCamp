#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

SECRET_NUMBER=$((1 + $RANDOM % 1000))

echo "Enter your username:"

read USERNAME

USER_ID=$($PSQL "SELECT user_id FROM users WHERE name='$USERNAME'")

if [[ -z $USER_ID ]]
then
  INSERT_USER_RESULT=$($PSQL "INSERT INTO users(name) VALUES('$USERNAME')")
  USER_ID=$($PSQL "SELECT user_id FROM users WHERE name='$USERNAME'")
  echo "Welcome, $USERNAME! It looks like this is your first time here."
else
  GAMES_PLAYED=$($PSQL "SELECT count(1) FROM games WHERE user_id=$USER_ID")
  BEST_GAME=$($PSQL "SELECT min(guesses) FROM games WHERE user_id=$USER_ID")
  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

GUESS_COUNT=0
echo "Guess the secret number between 1 and 1000:"
read GUESS
((GUESS_COUNT++))

while [ $GUESS != $SECRET_NUMBER ]
do

  ((GUESS_COUNT++))
  RE='^[0-9]+$'

  if ! [[ $GUESS =~ $RE ]]
  then
    echo "That is not an integer, guess again:"
  elif [[ $GUESS > $SECRET_NUMBER ]]
  then
    echo "It's lower than that, guess again:"
  elif [[ $GUESS < $SECRET_NUMBER ]]
  then
    echo "It's higher than that, guess again:"
  fi

  read GUESS

done

echo "You guessed it in $GUESS_COUNT tries. The secret number was $SECRET_NUMBER. Nice job!"

INSERT_GAME_RESULT=$($PSQL "INSERT INTO games(user_id, guesses) VALUES($USER_ID, $GUESS_COUNT)")