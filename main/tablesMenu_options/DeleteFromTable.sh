#! /bin/bash
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
            echo -e "Record deleted successfully"
         ;;
        "Delete Column")
            head -n 1 $tableName
            read -p "please enter number of column you want to delete " nColumn
            if [ $nColumn ] ;then
               echo "delete $nColumn from $tableName"
               sed -i -r "s/\S+//$nColumn" $tableName
               echo "Column is Deleted Successfully"
            else
               echo "Column not found"
            fi       
         ;;
         "Delete Table")
            sed -i '1,$d' $tableName
            echo "All Columns Data are Deleted Successfully"
         ;;
         "Back to Table menu")
            . ../../main/Tablesmenu.sh
         ;;
         *) 
            echo "Invalid choice try again"
            . ../../main/tablesMenu_options/DeleteFromTable.sh
         ;;
   esac
   done 
else
   echo "Table not exist! "
fi

