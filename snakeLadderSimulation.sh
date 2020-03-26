#!/bin/bash -x

echo "welcome to smake and ladder simulation"
#Constant Variable
NO_PLAY=0
LADDER=1
SNAKE=2
START_POSITION=0
WIN_POSITION=100

#variable
positionPlayer=0
rollDice=0
player=2
#initializing the dictionary
declare -A storeRecords
#function of  player then checks for a option NO_PLAY, SNAKE and LADDER
function setPlayer(){
	#Player roll die and to get a number 1 to 6
	rollDie=$(( RANDOM % 6 + 1 ))
	
	playingOptions=$(( RANDOM % 3 ))
	(( rollDice++ ))
	#Move player position according to playing options
	case $playingOptions in
		$NO_PLAY)
			positionPlayer=$positionPlayer
			;;
		$LADDER)
			positionPlayer=$(( $positionPlayer + $rollDie))
			;;
		$SNAKE)
			positionPlayer=$(( $positionPlayer - $rollDie ))
			;;
	esac
	resetWrongPosition
	storeRecords[RollDice:$rollDice]=$positionPlayer
}
#function of play er play untill win
function playUntilWin()
{
	while [ $positionPlayer -ne $WIN_POSITION ] 
	do
		switchPlayer
		setPlayer	
	done
	echo "player: $player won"
}
#function of reset wrong position
function resetWrongPosition(){
	if [ $positionPlayer -lt $START_POSITION ]
	then
		positionPlayer=$START_POSITION
	elif [ $positionPlayer -gt $WIN_POSITION ]
	then
		positionPlayer=$((positionPlayer - rollDie))
	fi
}
#switch the player one by one
function switchPlayer(){
	if [ $player -eq 1 ]
	then
		player=2
	else
		player=1
	fi
}
#start game
playUntilWin
