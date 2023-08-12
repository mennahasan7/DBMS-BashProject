#! /bin/bash
source ../../main/Functions.sh
source ../../main/emojis.sh

PS3="Please enter your choice:"
read -p "Please Enter Table Name which you want to select data from " tableName
metadatafile="md_$tableName"

if [[ -f $tableName ]]; then
   select choice in "Select All" "Select Specific Record" "Select Specific Column" "Back to Table menu"
   do
   case $choice in
     "Select All")
        cat $tableName
      ;;
     "Select Specific Record")
      cat -n $tableName
      read -p "Choose the record number you want to select " nRecord
      cat -n $tableName | grep -e $nRecord   # ask -> cat -n $tableName | sed '/$nRecord/p'  
      ;;
     "Select Specific Column")
      head -n 1 $tableName
      read -p "choose the number of column you want to select " nColumn
      cat $tableName | cut -f$nColumn -d$'\t'
      ;;
     "Back to Table menu")
      . ../../main/Tablesmenu.sh    
      ;;
     *) 
        echo -e "Invalid choice try again $failure"
        . ../../main/tablesMenu_options/SelectFromTable.sh
     ;;
   esac
      echo "
   1) Select All
   2) Select Specific Record
   3) Select Specific Column
   4) Back to Table menu"   
   done 
   else
      echo -e "Table not exist ! $failure"
   fi