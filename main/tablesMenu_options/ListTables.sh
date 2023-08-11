#! /bin/bash

ntables=`ls -F | grep * | wc -l`

if [ $ntables -eq 0 ];then 
    echo "No tables found"
else 
    select choice in "List all tables" "List a specfic table" "Back to menu"
        do
            case $choice in

            "List all tables" )        
            ls -F | grep *            
            bash ../../main/Tablesmenu.sh
            ;;

            "List a specfic table" )

            read -p "Enter table name you want to list : " tableName

            if [ -f $tableName ] ;then
                cat $tableName

            else 
                echo "Table with name $tableName Not exists"
                bash ../../main/tablesMenu_options/ListTables.sh
            fi
            bash ../../main/Tablesmenu.sh
            ;;
            "Back to menu" )
            bash ../../main/Tablesmenu.sh
            ;;

            * )
            echo -e "Invalid choice \U274C" ;;
            esac
        done
fi