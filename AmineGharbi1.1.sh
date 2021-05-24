#!/bin/bash

function DisplayAllprocess {
    echo ""
    
    #Afficher tous les processus en excution
    
	top
	clear
	menu
}

function ListAllTheExecutionProcess() {
    echo ""
    #Permet de lister tous les processus en exécution sur ou hors des terminaux
	ps -aux
	read -p "Press any key to continue"
	clear
	menu
}

function DisplayAllProcessInUser() {
    echo ""
	ps -u
	#Afficher les processus en excution dans le user
	read -p "Press any key to continue"
	clear
	menu
}

function DisplayTop5GreedyInTermOfMermories() {
    echo ""
    #Afficher les 5 processus les plus gourmants en terme de mémoires
	ps aux | sort -nrk 3,3 | head -n 5

		read -p "Press any key to continue"
		gnuplot courbes
		eog courbe.png
		read -p "Press any key to continue"
	clear
	menu
}


function DisplayReadMe {
    echo ""
    #Afficher Le fichier README
	less README.txt
		read -p "Press any key to continue"
	clear
	menu
}

function SaveInfo {
	#Savuvegarder Les informations dans un fichier

		top -b> Info.txt
	
		ps -aux > Info.txt

		ps -u > Info.txt

		ps aux | sort -nrk 3,3 | head -n 5 > Info.txt
	
		read -p "Press any key to continue"
	clear
	menu
}

function DisplayVersion {
	echo ""
	#Afficher la version du projet
	less Version.txt
	read -p "Press any key to continue"
	clear
	menu
}

function DisplayInfo {
	echo ""
	#Afficher les information
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
	#Rechercher dans uns un fichier a partir d'un mot clé
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

##
# Color  Variables
##
green='\e[32m'
blue='\e[34m'
clear='\e[0m'

##
# Color Functions
##

ColorGreen(){
	echo -ne $green$1$clear
}
ColorBlue(){
	echo -ne $blue$1$clear
}
##
#MENU
##
menu(){
echo -ne "
\e[31;5m		M E N U\e[25m
$(ColorGreen '		-t)') \e[4;3mLancer la commande Top\e[0m
$(ColorGreen '		-s)') \e[4;3mLancer la commande ps -aux\e[0m
$(ColorGreen '		-u)') \e[4;3mAfficher uniquement les processus lancé par $USER\e[0m
$(ColorGreen '		-p)') \e[4;3mAfficher uniquement les 5 processus les plus gourmants en terme de mémoires\e[0m
$(ColorGreen '		-h)') \e[4;3mAfficher Le guide (H E L P) à partir d'un fichier texte\e[0m
$(ColorGreen '		-g)') \e[4;3mAfficher un menu graphique\e[0m
$(ColorGreen '		-m)') \e[4;3mAfficher un menu textuel\e[0m
$(ColorGreen '		-x)') \e[4;3mSauvgarder vos informations sur un fichier \e[0m
$(ColorGreen '		-v)') \e[4;3mAfficher les versions et les auteurs\e[0m
$(ColorGreen '		-o)') \e[4;3mAfficher Les informations les plus pertinentes\e[0m
$(ColorGreen '		-f)')\e[4;3m(MOT CLÉ) Afficher tous les données contenant ce mot clé\e[0m
$(ColorGreen '		-e)') \e[4;3mExit\e[0m
$(ColorBlue 'Choose an option:') "
        read a
        case $a in
	        -t) DisplayAllprocess ; menu ;;
	        -s) ListAllTheExecutionProcess ; menu ;;
	        -u) DisplayAllProcessInUser ; menu ;;
	        -p)  DisplayTop5GreedyInTermOfMermories; menu ;;
	        -h) DisplayReadMe ; menu ;;
	        -g) ./GraphicMenu.sh ; menu ;;
	        -m) menu ;;
	        -x) SaveInfo ; menu ;;
	        -v) DisplayVersion ; menu ;;
	        -o) DisplayInfo ; menu ;;
	        -f) Search ; menu ;;
		-e) exit 0;;
		*) echo -e $red"Wrong option."$clear; WrongCommand;;
        esac
}

# Call the menu function
menu
