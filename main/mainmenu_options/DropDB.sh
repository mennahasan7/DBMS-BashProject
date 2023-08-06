#! /bin/bash
export LC_COLLATE=C
shopt -s extglob
source ../main/Functions.sh

read -p "Enter the database name yo want to drop : " DB

if  [[ -d ./$DB ]]; then
   echo "Please confirm "
   rm -ir ./"$DB"
   echo "DataBase: $DB has been droped Successfully"

else
   echo "There is no such DataBase , please enter another name"
   . ../main/mainmenu_options/DropDB.sh
fi	