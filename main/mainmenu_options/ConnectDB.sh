#! /bin/bash


echo "Existing databases are: "
ls -F | grep /
read -p "Please Enter database name you want to connect :" DB
if [[ -d ./$DB ]] ;then 
     cd ./$DB 
     echo 'Connected to' $DB
     . ../../main/Tablesmenu.sh
else 
     echo "There is no database with this name"
     . ../main/mainmenu_options/ConnectDB.sh
fi	
