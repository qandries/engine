variable0="ok"


until [ "$variable0" = "stop" ]
	do
		echo "1. Se déplacer de dossiers en dossiers, avec un ls à chaque fois et un pwd"
		echo "2. Afficher le contenu d'un fichier"
                echo "3. Agir sur un fichier:"
                echo "	a Supprimer"
                echo "	b Copier"
                echo "	c Déplacer"
                echo "	d Renommer un fichier"
                echo "4. Agir sur un dossier:"
                echo "	a Créer"
                echo "	b Supprimer"
                echo "	c Déplacer"
                echo "	d Renommer"
                echo "5. Faire afficher une image"
                echo "6. Chercher un mot dans un fichier en particulier"
		echo "que souhaites tu?"
		read variable0
		if [ "$variable0" = "1" ]
			then echo "liste de dossiers"
			cd .. ; ls ; echo "Vous êtes à" pwd

		elif [ "$variable0" = "2" ]
			then echo "Quel fichier veux-tu afficher?"
			read variable1
			echo "voici le contenu"
			cat $variable1

		elif [ "$variable0" = "3" ]
			then echo "choisis ton fichier"
			read nomDeFichier
			echo "choisis ton action"
			read variable5
			case $variable5 in
			a) rm $variable1 echo "fichier delete" ;;
			b) echo "choisis ta destination" read destination  cp $nomDeFichier $destination ;;
			c) echo "choisis ta destination" read destination mv $nomDeFichier $destination ;;
			d) echo "choisis ton nouveau nom de fichier" read nouveauNom mv $nomDeFichier $nouveauNom ;;
			esac

		elif [ "$variable0" = "4" ]
			then echo "choisis ton dossier"
			read nomDeDossier
			case $variable5 in
        		a) echo "choisis ton nom de dossier"  mkdir $nomDeDossier echo "dossier create" ;;
        		b) rm -rf  $nomDeDossier echo "dossier delete" ;;
        		c) echo "choisis ta destination" read destination mv $nomDeDossier $destination ;;
    			d) echo "choisis ton nouveau nom de dossier" read nouveauNom mv $nomDeDossier $nouveauNom ;;
			esac
		elif [ "$variable0" = "5" ]
			then echo "ou est cette belle image?"
			read image
			xdg-open $image
		elif [ "$variable0" = "6" ]
			then echo "choisis ton mot"
			read mot
			echo "dans quel fichier mon ami?"
			read fichier
			grep -r '$mot' $fichier
		fi
done
