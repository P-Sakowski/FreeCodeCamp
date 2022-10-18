#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

if [[ -z $1 ]]
then
  echo "Please provide an element as an argument."
else

  re='^[0-9]+$'
  if ! [[ $1 =~ $re ]]
  then
    ELEMENT_ID=$($PSQL "SELECT atomic_number FROM elements WHERE symbol='$1' or name='$1'")
  else
    ELEMENT_ID=$($PSQL "SELECT atomic_number FROM elements WHERE atomic_number=$1")
  fi

  if [[ -z $ELEMENT_ID ]]
  then
    echo "I could not find that element in the database."
  else
    SYMBOL=$($PSQL "SELECT symbol FROM elements WHERE atomic_number=$ELEMENT_ID")
    NAME=$($PSQL "SELECT name FROM elements WHERE atomic_number=$ELEMENT_ID")
    TYPE=$($PSQL "SELECT type FROM types t INNER JOIN properties p on p.type_id = t.type_id WHERE p.atomic_number=$ELEMENT_ID")
    MASS=$($PSQL "SELECT atomic_mass FROM properties WHERE atomic_number=$ELEMENT_ID")
    MELTING_TEMP=$($PSQL "SELECT melting_point_celsius FROM properties WHERE atomic_number=$ELEMENT_ID")
    BOILING_TEMP=$($PSQL "SELECT boiling_point_celsius FROM properties WHERE atomic_number=$ELEMENT_ID")
    
    echo "The element with atomic number $ELEMENT_ID is $NAME ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELTING_TEMP celsius and a boiling point of $BOILING_TEMP celsius."
  fi

fi