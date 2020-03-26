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

#function of  player then checks for a option NO_PLAY, SNAKE and LADDER
function setPlayer(){
	#Player roll die and to get a number 1 to 6
	rollDie=$(( RANDOM % 6 + 1 ))
	
	playingOptions=$(( RANDOM % 3 ))
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
	echo "Player Position : "$positionPlayer
}
#function of play er play untill win
function playUntilWin()
{
	while [ $positionPlayer -le $WIN_POSITION ] 
	do
		setPlayer
	done
}
#function of reset wrong position
function resetWrongPosition(){
	if [ $positionPlayer -lt $START_POSITION ]
	then
		positionPlayer=$START_POSITION
	fi
}
#start game
playUntilWin
