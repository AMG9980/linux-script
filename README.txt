
============================
        ps Command :        
============================

  Usage : 
-----------
 ps [options]
 

------------- 
  Options : 
-------------
1-- ps (Process static status) : Permet d'afficher tous les processus en execution dans la memoire dans ce moment.

2-- ps -e (ps -f): Permet d'afficher tous les processus.
(UID : user ID.
PID : Process ID.
C : CPU utilization.
STIME : time started.
TTY : terminal process is running on.
TIME : time process has taken on CPU.
CMD : the command, program^or process.)

3-- ps aux | sort -nrk 3,3 | head -n 5 : Permet d'afficher es 5 processus les plus gourmants en terme de mémoires.

4-- ps -u : permet d'afficher les processus dans un utilisateur.

5-- ps -aux : Permet de lister tous les processus en exécution sur ou hors des terminaux et formater le resultat avec des information suplementaires. 

============================
        top Command :        
============================

La commande TOP permet d’afficher des informations en continu sur l’activité du système
(PID : process ID. Il s'agit d'une valeur numéraire qui spécifie quels processus sont en cours simultanément dans un ordinateur multitâche.
USER : L'utilisateur qui exécute ce processus.
PR : La priorité de la tâche. (La priorité entre -20 et 20.Plus le chiffre est petit plus la tâche est prioritaire)
NI : Le nice de la tache
VIRT : Taille virtuelle d'un processus c'est la somme de la mémoire qu'il utilise réellement en mémoire.
RES : Quantité de mémoire physique occupée par le processus.
SHR : Indique quelle quantité de la colonne VIRT est réellement partagée.
S : Statut du processus
Il y a 5 valeurs possibles :
1-Sleeping : S.
2-Uninterruptible sleep : D.
3-Running : R
4-Zombie : Z.
5-Stopped or traced : T.
Il peut être précédé par :
< : Negative nice Value.
N : Positive nice value.
W : swapped out.
%CPU : Charge CPU.
%MEM : Charge Mémoire
TIME+ : Temps total d'utilisation du processus depuis le lancement du processus
COMMAND : Nom du processus).

  Usage : 
-----------
 top [options]
 

------------- 
  Options : 
-------------

1-- top : Permet d'afficher tous les processus.


  Menu General : 
------------------

◦ Taper -t pour lancer la commande top
◦ Taper -s pour lancer la commande ps -aux
◦ Taper -u pour afficher uniquement les processus lancé par l’utilisateur $USER
◦ Taper -p pour afficher uniquement les 5 processus les plus gourmands en terme de mémoires
◦ Taper -h pour afficher le help à partir d’un fichier texte contenant la description
de l’application et ses options (le fichier doit etre dans repertoire /etc )
◦ Taper -g pour afficher un menu graphique (exemple via YAD )
◦ Taper -m pour afficher un menu textuel (menu en boucle)
◦ Taper -s pour sauvegarder les informations les plus pertinentes (en filtrant) dans un fichier passé en argument
Pour sauvgarder des informations(exemple le resultat de la commnde top ) dans fichier
◦ Taper -v pour afficher la verion et les noms des auteurs
◦ Taper -o pour afficher les informations les plus pertinentes dans un fichier passé en argument (si le fichier n’existe pas un message d’erreur doit etre affiché)

◦ Taper -f pour afficher les lignes contenant le MOT_CLE à partir d’ un fichier.
Cette option doit etre utilisé avec l’option -o
