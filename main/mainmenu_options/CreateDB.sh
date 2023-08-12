#! /bin/bash
export LC_COLLATE=C
shopt -s extglob

source ../main/Functions.sh
source ../main/emojis.sh

read -p " Enter New Database Name : " -n30 name

if [[ -d ${name} ]]; then
    echo -e " Database name already exists $failure, please enter another name "
	. ../main/mainmenu_options/CreateDB.sh

elif   ! isValidName ${name}; then
    echo -e "Database name is not valid $failure, Alphanumeric is only accepted"
else
    mkdir ./$name
    echo -e "Database Created Successfully $success"
fi