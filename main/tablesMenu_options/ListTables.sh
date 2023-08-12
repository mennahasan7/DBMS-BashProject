#! /bin/bash
source ../../main/emojis.sh

ntables=`ls -F | grep * | wc -l`

if [ $ntables -eq 0 ];then 
    echo -e "No tables found $failure"
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
                echo -e "Table with name $tableName Not exists $failure"
                bash ../../main/tablesMenu_options/ListTables.sh
            fi
            bash ../../main/Tablesmenu.sh
            ;;
            "Back to menu" )
            bash ../../main/Tablesmenu.sh
            ;;

            * )
            echo -e "Invalid choice $failure" ;;
            esac
        done
fi