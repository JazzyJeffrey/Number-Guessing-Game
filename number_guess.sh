#!/bin/bash

# SQL command variable
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

# Generate a secret number between 1 and 1000
SECRET_NUMBER=$(( RANDOM % 1000 + 1 ))

# Function to get the user data
GET_USER_DATA() {
    USER_DATA=$($PSQL "SELECT username, games_played, best_game FROM users WHERE username='$USERNAME'")
    if [[ -n $USER_DATA ]]; then
        IFS='|' read -r USERNAME GAMES_PLAYED BEST_GAME <<< "$USER_DATA"
        echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
    else
        echo "Welcome, $USERNAME! It looks like this is your first time here."
        GAMES_PLAYED=0
        BEST_GAME=""
    fi
}

# Function to update the user's data
UPDATE_USER_DATA() {
    if [[ -z $BEST_GAME ]] || [[ $GUESSES -lt $BEST_GAME ]]; then
        BEST_GAME=$GUESSES
    fi
    GAMES_PLAYED=$((GAMES_PLAYED + 1))
    USER_EXISTS=$($PSQL "SELECT username FROM users WHERE username='$USERNAME'")
    if [[ -n $USER_EXISTS ]]; then
        $PSQL "UPDATE users SET games_played=$GAMES_PLAYED, best_game=$BEST_GAME WHERE username='$USERNAME'"
    else
        $PSQL "INSERT INTO users(username, games_played, best_game) VALUES('$USERNAME', $GAMES_PLAYED, $BEST_GAME)"
    fi
}

echo -n "Enter your username: "
read USERNAME

GET_USER_DATA

GUESSES=0
while true; do
    echo -n "Guess the secret number between 1 and 1000: "
    read GUESS
    if ! [[ "$GUESS" =~ ^[0-9]+$ ]]; then
        echo "That is not an integer, guess again:"
        continue
    fi
    GUESSES=$((GUESSES + 1))
    if [ "$GUESS" -lt "$SECRET_NUMBER" ]; then
        echo "It's higher than that, guess again:"
    elif [ "$GUESS" -gt "$SECRET_NUMBER" ]; then
        echo "It's lower than that, guess again:"
    else
        UPDATE_USER_DATA
        echo "You guessed it in $GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!"
        break
    fi
done


