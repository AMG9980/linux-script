#!/bin/bash
function DisplayAllprocess {
    echo ""
	top
	clear
	menu
}

function ListAllTheExecutionProcess() {
    echo ""
	ps -aux
	read -p "Press any key to continue"
	clear
	menu
}

function DisplayAllProcessInUser() {
    echo ""
	ps -u
	read -p "Press any key to continue"
	clear
	menu
}

function DisplayTop5GreedyInTermOfMermories() {
    echo ""
	ps aux | sort -nrk 3,3 | head -n 5

		read -p "Press any key to continue"
	clear
	menu
}


function DisplayReadMe {
    echo ""
	less README.txt
		read -p "Press any key to continue"
	clear
	menu
}

function SaveInfo {


		top -b> Info.txt
	
		ps -aux> Info.txt

		ps -u> Info.txt

		ps aux | sort -nrk 3,3 | head -n 5 > Info.txt
	
		read -p "Press any key to continue"
	clear
	menu
}

function DisplayVersion {
	echo ""
	less Version.txt
	read -p "Press any key to continue"
	clear
	menu
}

function DisplayInfo {
	echo ""
	if [[ -e Info.txt ]]
		then less Info.txt
	else
		echo "File not found !"
	fi

	read -p "Press any key to continue"
	clear
	menu
}

function Search {
	echo "Le Mot a rechercher : "
	
	read KeyWord
	
	if [[ -e Info.txt ]]
		then grep $KeyWord Info.txt 
	else
		echo "File not found !"
	fi
	read -p "Press any key to continue"
	clear
	menu
}
function menu {
	 yad --list \
                 --title="M E N U" \
                 --center \
                 --button=Acepter:0  \
                 --button=Cancel:1 \
                 --text="Select a command :" \
                 --buttonlist \
                 --column="" \
                 --button="-t":2 \
                 --button="-aux":3 \
                 --button="-u":4 \
                 --button="-p":5 \
                 --button="-h":6 \
                 --button="-x":7 \
                 --button="-v":8 \
                 --button="-o":9 \   
                 --button="-f":10   

}

menu
ans=$?
if [ $ans -eq 2 ]
then
    DisplayAllprocess
        
elif [ $ans -eq 3 ]
then
    ListAllTheExecutionProcess

elif [ $ans -eq 4 ]
then
    DisplayAllProcessInUser
    
elif [ $ans -eq 5 ]
then
    DisplayTop5GreedyInTermOfMermories

elif [ $ans -eq 6 ]
then
    DisplayReadMe
      
elif [ $ans -eq 7 ]
then
    SaveInfo

elif [ $ans -eq 8 ]
then
    DisplayVersion
    
elif [ $ans -eq 9 ]
then
    DisplayInfo

elif [ $ans -eq 10 ]
then
    Search
    
else
    echo "No result!"
 
fi
