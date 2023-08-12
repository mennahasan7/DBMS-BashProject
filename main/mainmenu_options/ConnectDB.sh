#! /bin/bash
source ../../main/emojis.sh

echo "Existing databases are: "
ls -F | grep /
read -p "Please Enter database name you want to connect :" DB
if [[ -d ./$DB ]] ;then 
     cd ./$DB 
     echo -e 'Connected to' $DB $success
     . ../../main/Tablesmenu.sh
else 
     echo -e "There is no database with this name $failure"
     . ../main/mainmenu_options/ConnectDB.sh
fi	
