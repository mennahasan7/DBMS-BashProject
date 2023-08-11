#! /bin/bash

ntables=`ls -F | grep * | wc -l`

if [ $ntables -eq 0 ];then 
    echo "No tables found"
else 
    ls -F | grep * 
fi               
read -p "Please Enter the Name of the Table " tableName

metadatafile=md_$tableName
if [ -f $tableName ]; then 
         rm $tableName
         rm $metadatafile
         echo -e " Table $tableName has been Deleted Successfully! \U2705"
         echo -e " Metadata $metadatafile has been Deleted Successfully! \U2705"
else -e " This Table is Not Exist \U274C"
fi

. ../../main/Tablesmenu.sh
