#! /bin/bash
export LC_COLLATE=C
shopt -s extglob
source main/emojis.sh

if  ! [[ -d ./MA_Database ]]; then
	mkdir ./MA_Database
fi
    cd ./MA_Database
	echo -e "MA_Database Created Successfully!  $success"
	bash ../main/DBmenu.sh