#! /bin/bash
PS3='Please enter your choice: '

echo "Deleting Record from Table...."
read -p "what is database name " DB
read -p "enter table name you want to delete from : " tableName

select choice in "Delete Record" "Delete Column" "Delete all Records" "Back To TablesMenu"
do
    case $choice in
        "Delete Record")
            cat $tableName
            read -p "please enter number of column you want to delete record from" x
            sed '`$x`p' /$tableName
            read -p "please enter the number of Record you want to delete " y
            if [[ $x ]] && [[ $y ]];then
               cut -d " " -f $x | sed  '1,`$y`d' /$tableName
            else
                echo "Record not found"
            fi       
            ;;
         "Delete column")
            cat $tableName
            read -p "please enter number of column you want to delete " x
            if [ $x ] ;then
                echo "delete $x from $tableName"
                cut -d " " -f $x | sed  '1,$d' /$tableName
            else
                echo "column not found"
            fi       
            ;;
        "Delete all column")
            sed -i '1,$d' /$tableName
            ;;
        "Back To TablesMenu")
            
            TableMenuoptions
            ;;
        *) echo "invalid option $REPLY";;
    esac
done
