vagrant init;

read -p "Quelle box voulez-vous utiliser ? 

1 - Xenial 64
2 - Xenial 65" choix;

if [[ $choix -eq 1 || $choix -eq 2 ]]

then 

    box="ubuntu\/xenial64";

    sed -i -e "s/config.vm.box = \"base\"/config.vm.box = \"$box\"/g" Vagrantfile;
    read -p "Saisissez le nom du dossier 'data' : " dossier;
    read -p "Saisissez le chemin (ex: /var/www/html) : " chemin;
    sed -i -e "s=config.vm.synced_folder \"..\/data\", \"\/vagrant_data\"=config.vm.synced_folder \"$dossier\", \"$chemin\"=g" Vagrantfile;

    vagrant up;

    vagrant ssh;
fi