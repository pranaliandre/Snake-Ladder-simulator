#!/bin/bash -x

echo "welcome to smake and ladder simulation"
#Constant Variable
NO_PLAY=0
LADDER=1
SNAKE=2
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
			playingOptions=$playingOptions
			;;
		$LADDER)
			playingOptions=$(( $playingOptions + $rollDie))
			;;
		$SNAKE)
			playingOptions=$(( $playingOptions - $rollDie ))
			;;
	esac
}
#start game
setPlayer
