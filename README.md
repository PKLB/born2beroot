# born2beroot
# Notions:

**Machine virtuelle :** 

Un environnement virtuel qui fonction comme un système informatique virtuel avec son propre processeur, sa mémoire, son interface réseau et son espace de stockage mais qui est créé sur un système physique. C'est exécuté sur son propre OS.

Le logiciel permettant de séparer les ressources de l'ordinateur et de la machine virtuelle est l'hyperviseur. Ces machines virtuelles sont isolés du système.

- ***Avantages d'une machine virtuelle :***
    - Pour effectuer des tests dans un nouveau système d'exploitation sans avoir a partitionner son disque dur → aucun risque pour sa machine
    - Developper un logiciel ou un programme pour un autre OS.
    - Se servir de logiciels qui ne peuvent tourner sur l'OS de l'ordinateur.
    - S'économiser plusieurs ordinateurs : plusieurs VMs sur un seul support physique.
- **Inconvénients d'une machine physique :**
    - Une machine physique avec plusieurs VMs peut-être vulnérable pour toutes les VMs.
    - Si la machine physique tombe en panne l'accès aux Vms devient impossible.
    - La machine physique doit être assez puissante pour supporter la ou les VMs.

Types d'hyperviseurs :

Type 1 (NATIF) : Hyperviseur qui s'exécute directement sur une plateforme matérielle. Il prend la place de l'OS et s'utilise généralement dans des datas centers et autres environnements bases sur des serveurs. Par exemple : KVM (Kernel-based virtual machine).

Type 2 (HOSTED) : Hyperviseur qui s'exécute directement à l'intérieur d'un autre système d'exploitation à un troisième niveau. Les systèmes d'exploitations invités n'ont pas conscience d'être virtualisés.

Exemple de virtualisation à 42 :

Un parc informatique homogène : simplification de la gestion et sécurité accrue. Des mises à jours facilitées : changer via le PC maître puis déployer sur l'ensemble du parc. Des économies : industrialisation de la gestion du parc, facilité de déploiement.

---

# Debian vs CentOS :

### Debian :

Système d'exploitation Linux open-source codé par une communauté de développeurs. Première version stable sortie en 1996, depuis s'est formé une liste de ressources et de support énorme pour les utilisateurs et les développeurs. Peut fonctionner sur quasiment tout les types d'architectures, anciennes ou récentes.

Une grande stabilité des dernières mises à jour car les sorties sont espacées. Pas d'interface graphique et très axé pour des administrateurs systèmes et des développeurs. Néanmoins Debian reste un des plus facile d'utilisation contrairement à beaucoup d'OS Linux.  

### CentOS :

Plus populaire dans des environnements serveurs, mais moins de ressources en ligne, moins de packages en ligne. Un peu moins de types d'architectures supportés comparé à Debian. + compliqué à upgrade (réinstallation complète à chaque grande MAJ pour se faciliter la tâche).

---

# Apt vs Aptitude :

### Apt :

Sur Debian le gestionnaire de paquets par défaut est DPKG, mais apt est un outil qui utilise DPKG pour simplifier la tâche avec la commande apt-get.

Gestionnaire de paquets utilisé sur des paquets en format deg. Apt simplifie l'installation la mise à jour et la désinstallation de logiciels en automatisant la récupération de paquets à partir de sources api. C'est l'outil central de mise à jour, installation et suppression de paquets. *Easter egg : apt moo :].* 

### Aptitude :

C'est une interface à api. Cette interface utilisateur graphique permet de sélectionner les paquets à installer ou supprimer. La recherche de paquets et la résolution de dépendances font parties de ses points forts.

> Malheureusement pour aptitude, il n'y a pas de super cow power.
> 

### Paquets :

Les paquets (packages) : sont des archives comprenant les fichiers informatiques ainsi que les informations et procédures nécessaires à l'installation d'un logiciel sur un OS au sein d'un agrégat logiciel en s'assurant de la cohérence fonctionnelle du système modifié.

---

# Sudo, su, UFW, LVM, AppAmor,  ssh, etc..

### Sudo :

Abréviation de Super User Do. Commande qui accorde à certains utilisateurs la possibilité de lancer une commande en tant qu'administrateur tout en conservant une trace des commandes saisies et des arguments. Les autorisations de sudo sont définies dans le fichiers /etc/sudoers afin d'éviter que n'importe qui puisse effectuer des commandes avec les privilèges de root.

Par défaut les logs de sudo sont stockés dans syslog mais pour simplifier son accès et sa lecture on en recréé un nous mêmes. 

Interdire le login root :

Empêcher l'éventualité que quelqu'un essaie de se connecter en root en brut force.

Restreinte le chemin de root :

Empêcher une vulnérabilité de sudo qui se servait du chemin d'accès de root pour manipuler l'environnement et effectuer des commandes normalement interdites.

log_input, log_output :

Permet de stocker tout les logs de sudo.

### TTY :

TeleTYpewriter : des connexions directes à l'ordinateur tel qu'un clavier / souris ou une connexion série sur le périphérique. Ici, le TTY c'est le terminal, l'interface homme/machine. 

Requiretty : Interdit l'exécution de la commande sudo à partir d'autre chose qu'une console ou un terminal, notamment à partir de scripts cron ou cci-bin. → Plus de sécurité lorsqu'il est activé.

### Su :

Switch User : permet de se connecter à d'autres utilisateurs.

Restreindre l'accès à la commande su :

Empêcher l'éventualité qu'un utilisateur essaie de changer d'utiliser d'utilisateur pour essayer d'avoir plus de droits qu'il en a .

### UFW :

Uncomplicated firewall. Un outil de configuration simplifié en ligne de commande de Netfilter qui est lui un framework implémentant un pare feu au sein du noyau Linux. Il prévoit des hooks dans le noyau pour intercepter les paquets transmis. Plus facile d'usage que les iptables et les notables. Permet de gérer les connexions entrantes.

### Ssh :

Secure Shell. Un protocole de communication sécurisé permettant d'établir une communication chiffrée et donc sécurisée sur un réseau informatique (intranet, internet) entre une machine locale (le client) et une machine distante (le serveur).

Avant, avec telnet par exemple les communications n'étaient pas chiffrées ce qui les rendait vulnérables. Ssh utilise de la cryptographie asymétrique (clé publique/clé privée).

Un des avantage de SSH, c'est qu'un utilisateur de MacOS ou de Linux peut utiliser SSH sur leur serveur pour communiquer avec via leur terminal. Une fois authentifié l'utilisateur sera capable d'utiliser le terminal pour travailler sur le serveur.

On s'y connecte avec la commande : ssh {username}@localhost -p {port}.

### LVM :

Logical Volume Manager permet de gérer les partitions de mémoire. Si des partitions de mémoire sont pleines, en tant normal on ne peut pas augmenter l'espace mémoire de celles-ci. Avec LVM cela devient possible, on peut agrandir ces espaces de stockages.

Volume physique : outil de stockage physique. Un disque dur, une carte sd. Permet de nous offrir de l'espace à utiliser.

Groupe de volume : Pour utiliser l'espace fournit par un volume physique, il faut que celui soit alloué à un volume de groupe, c'est comme un stockage virtuel qui sera utilisé par les volumes logiques.

Volumes logiques : Outils qui vont servir à créer un système de fichiers, des machines virtuelles. 

### AppArmor :

AppArmor est un logiciel de sécurité pour Linux. Permet à l'administrateur d'associer à chaque programme un profil de sécurité qui restreint ses accès au système d'exploitation en utilisant le MAC (Mandatory Access control → méthode de gestion des droits d'utilisateurs pour l'usage des systèmes).

Créé en tant qu'alternative à SELinux, critiqué pour être difficile à paramétrer et a maintenir par les administrateurs. 

### **Grub :**

Programme d'amorçage qui agit avant le système d'exploitation afin d'en organiser le chargement, sur un ordinateur à plusieurs système il permet à l'utilisateur de choisir sur quel système démarrer. Il permet de rattraper un amorçage suite à un mauvais adressage de partition par exemple. Permet d'utiliser une interface graphique pour afficher un menu au démarrage de l'ordinateur (un menu, une image de fond, et une prise en charge de la souris).

### **Restrictions mot de passe :**

`pam_pwquality.so` = Pluggable Authentication Module, qui permet de pouvoir exiger les règles suivantes sur la création de nouveaux mots de passes.

`dcredit` = digit

`ucredit` = caractère majuscule

`lcredit` = caractère en minuscule

`ocredit` = autre caractère (caractères spéciaux, y compris `!,@#$%)`

`minlength` = longueur minimale

`difok` = nombre de caractères qui doivent être différents entre un ancien et un nouveau mot de passe

`reject_username` = mmmhhh compliqué à deviner !!! à méditer !!!!

`enforce_for_root` = renvoie un message d'erreur même si l'utilisateur qui essaie de changer le mot de passe est l'utilisateur root. Par défaut ce n'est pas activé et donc root peut contourner les règles strictes de mot de passe. 

On pourrait rajouter à toutes ces restrictions un check passant par un dictionnaire de mot de passes interdits qui évite l'utilisation de mots de passes trop communs.

---

- **Script [monitoring.sh]:
    - **CPU physical:** architecture de l'OS et de la version du SHELL
    - **Architecture:** montre les nombre de processeurs physiques.
    - **vCPU:** montre le nombre de processeurs virtuels.
    - **Memory usage:** montre les RAMs disponibles sur le serveur et son taux d'utilisation en %.
    - **Disk usage:** montre la mémoire disponible sur le serveur et son taux d'utilisation en %.
    - **Last boot:** montre la date et l'heure du dernier rebut.
    - **LVM:** montre si Logical Volume Manager (qui permet la création et la gestion de volumes → agrandir ou diminuer la taille d'un système de fichiers pour en agrandir un autre sans se préoccuper de leur emplacement sur le disque) est actif ou non.
    - **Connections TCP:** montre le nombre de connexions actives.
    - **User log:** nombre d'utilisateurs en train d'utiliser le serveur.
    - **Network IP:** montre l'adresse IPVn du serveur et son adresse MAC (Media Access Control).
    - **Sudo:** montre le nombre de commandes effectuées avec sudo.

### Cron :

Linux Task manager qui permet d'exécuter des commandes à des moments spécifiques. Un service en arrière-plan qui exécute des tâches spécifiques.

### Wall :

Une commande de l'utilisateur root qui permet d'écrire un message à tout les utilisateurs, via un texte brut ou un fichier.

### Uname :

Diminutif d'unix name, affiches les informations système sur la machine sur laquelle elle est exécutée.

-all : affiche tout.

### Uniq :

Affiche les lignes d'un texte en y supprimant les doublons.

### Free :

Affiche les informations de disponibilité sur la mémoire vive du système. -m arrondi tout à trois chiffres.

### Hostname - -ip-address :

Affiche l'ip de l'host/

### Who :

Affiche qui est connecté. -b → moment du dernier reboot. 

### Netstat :

Montre le statut du réseau. -a montre l'état de toutes les sockets, les sockets non utilisées ne sont pas montrées. -n : Montre les adresses networks en tant que nombre, à utiliser avec une des options d'affichage (en l'occurence -a ici).

### Awk :

awk '{commande}'

flemme prout

### Df :

Affiche l'espace disque disponible. -h lecture plus simple pour nous les êtres humains. $3 → colonne de l'espace utilisé. $2 → l'espace total. $5 → total utilisé.

### Journalctl :

Sans paramètres, affiche tous les logs qui ont été stocké à l'aide de system D. _COMM=sudo pour avoir la liste avec l'heure de tous les appels de sudo de la semaine passée. On grep 'COMMAND' pour ne pas compter les lignes superflues.

### **Lsblk :**

Affiche des renseignements sur les périphériques bloc disponibles. En y cherchant 'LVM' avec grep on détermine si LVM est actif ou non sur la VM.

```bash
ARCH=$(uname --all)
PCPU=$(grep 'physical id' /proc/cpuinfo | uniq | wc -l)
VCPU=$(grep 'processor' /proc/cpuinfo | wc -l)
MEMUSE=$(free -m | grep Mem | awk '{printf "%d/%dMB (%.2f%%)", $3, $2, $3*100/$2}')
DISKUSE=$(df -h | grep root | awk '{print $3"/"$2"b ("$5")"}')
CPU=$(cat /proc/loadavg | awk '{printf "%.1f%%", $1}')
LASTBOOT=$(who -b | awk '{print $3" "$4}')
LVM=$(lsblk | grep 'lvm' | wc -l)
TCP=$(cat /proc/net/sockstat | awk '$1 == "TCP:" {print $3}')
USERLOG=$(who | wc -l)
IP=$(hostname --ip-address)
MAC=$(ip a | grep link/ether | awk '{printf $2}')
SUDO=$(journalctl _COMM=sudo  | grep 'COMMAND' | wc -l)

echo "#Architecture: ${ARCH}"
echo "#CPU Physical: ${PCPU}"
echo "#CPU Virtual: ${VCPU}"
echo "#Memory Usage: ${MEMUSE}"
echo "#Disk Usage: ${DISKUSE}"
echo "#CPU load: ${CPU}"
echo "#Last boot: ${LASTBOOT}"
echo "#LVM use: $(if [${LVM} -eq 0]; then echo no; else echo yes; fi)"
echo "#Connections TCP: ${TCP} ESTABLISHED"
echo "#User log: ${USERLOG}"
echo "#Network: IP ${IP} (${MAC})"
echo "#Sudo: ${SUDO} cmd"
```

### Exam :

Créer un nouvel utilisateur :`sudo adduser username`

Expiration du mot de passe :`sudo chage -l username`

Ajouter au sudo : `sudo adduser username sudo`

Ajouter au groupe sudo :`sudo adduser username user42`

Vérifier les partitions : `lsblk`

Statut AppArmor : `sudo aa-status`

Utilisateurs sudo : `getent group sudo`

Utilisateurs dans Group sudo : `user42 group users`

Statu ssh : `sudo service ssh status`

Statut ufw : `ufw status`

Se connecter via un autre terminal : `ssh username@localhost -p 4242`

Fichier de configuration sudo :`vim /etc/sudoers.d/...` 

Politique d'expiration des mots de passe :`vim /etc/login.def`

Politique des mots de passe : `vim /etc/pam.d/common-password`

Cron : `sudo crontab -l`

Changer le hostname : `sudo nano /etc/hostname`

Sudo logs : `cd /var/log/sudo/00/00 && ls`

Add and remove port in UFW :

`sudo ufw allow 8080`

`sudo ufw status`

`sudo ufw deny 8080`

Run script :

`sudo crontab -e`

Stop script from running : 

remove @reboot /pathtomonitoring 

- **Liens utiles :**
    
    [https://www.tecmint.com/sudoers-configurations-for-setting-sudo-in-linux/](https://www.tecmint.com/sudoers-configurations-for-setting-sudo-in-linux/)
    
    [https://www.formatux.fr/formatux-securite/module-010-su-sudo/index.html](https://www.formatux.fr/formatux-securite/module-010-su-sudo/index.html)
    
    [https://tldp.org/LDP/solrhe/Securing-Optimizing-Linux-RH-Edition-v1.3/chap5sec41.html](https://tldp.org/LDP/solrhe/Securing-Optimizing-Linux-RH-Edition-v1.3/chap5sec41.html)
    
    [https://fr.wikipedia.org/wiki/GNU_GRUB](https://fr.wikipedia.org/wiki/GNU_GRUB)
    
    [https://www.it-connect.fr/creer-une-blacklist-mot-de-passe-linux-pam-pwquality/](https://www.it-connect.fr/creer-une-blacklist-mot-de-passe-linux-pam-pwquality/)
