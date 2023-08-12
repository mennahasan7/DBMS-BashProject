#! /bin/bash

source ../../main/emojis.sh

PS3="Please enter your choice:"

read -p "Please Enter Table Name which you want to delete from : " tableName
metadatafile=md_$tableName
if [[ -f $tableName ]]; then
   select choice in "Delete Record" "Delete Column" "Delete Table" "Back to Table menu"
   do
   case $choice in
        "Delete Record")
            cat -n $tableName
            noOfRecords=`wc -l $tableName`
            read -p "please enter the number of record you want to delete value from " nRecord
            sed -i "${nRecord}d" $tableName 
            echo -e "Record deleted successfully $success"
         ;;
        "Delete Column")
            head -n 1 $tableName
            read -p "please enter number of column you want to delete " nColumn
            if [ $nColumn ] ;then
               echo "delete $nColumn from $tableName"
               sed -i -r "s/\S+//$nColumn" $tableName
               echo -e "Column is Deleted Successfully $success"
            else
               echo -e "Column not found! $failure"
            fi       
         ;;
         "Delete Table")
            sed -i '1,$d' $tableName
            echo -e "All Columns Data are Deleted Successfully $success"
         ;;
         "Back to Table menu")
            . ../../main/Tablesmenu.sh
         ;;
         *) 
            echo -e "Invalid choice try again $failure"
            . ../../main/tablesMenu_options/DeleteFromTable.sh
         ;;
   esac
   done 
else
   echo -e "Table not exist! $failure"
fi

