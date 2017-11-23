

echo "Que voulez vous créer comme box ?

Soit xenial64

Soit xenial64"

read box



if [ $box != 'xenial64' ]

then

	echo "Commande non reconnue"

fi

echo "Quel dossier voulez vous créer afin de faire la synchronisation sur la machine hôte ?"

read dossierHote

echo "Quel dossier voulez vous créer afin de faire la synchronisation sur la machine virtuel ? Veuillez commencer par un /, exemple /var/www/html"

read dossierVirtuel
mkdir $dossierHote

echo "

# -*- mode: ruby -*-

# vi: set ft=ruby :

Vagrant.configure(2) do |config|

config.vm.box = 'ubuntu/"$box"'

config.vm.network 'private_network', ip: '192.168.33.10'

config.vm.synced_folder './"$dossierHote"', '"$dossierVirtuel"'

end" > Vagrantfile

vagrant up

vagrant ssh