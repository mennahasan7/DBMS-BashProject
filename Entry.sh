#! /bin/bash
export LC_COLLATE=C
shopt -s extglob

if  ! [[ -d ./MA_Database ]]; then
	mkdir ./MA_Database
fi
    cd ./MA_Database   #later check for ./ or foldername
	echo -e "MA_Database Created Successfully! " #add emojis /U2705 /U1F60D
	bash ../main/DBmenu.sh