#! /bin/bash
export LC_COLLATE=C
shopt -s extglob

source ../main/Functions.sh

read -p " Enter New Database Name : " -n30 name

if [[ -d ${name} ]]; then
    echo " Database name already exists, please enter another name "
	. ../main/mainmenu_options/CreateDB.sh

elif   ! isValidName ${name}; then
    echo  "Database name is not valid, Alphanumeric is only accepted"

else
    mkdir ./$name
    echo "Database Created Successfully"
fi