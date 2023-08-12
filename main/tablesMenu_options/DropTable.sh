#! /bin/bash
source ../../main/emojis.sh

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
         echo -e " Table $tableName has been Deleted Successfully! $success"
         echo -e " Metadata $metadatafile has been Deleted Successfully! $success"
else -e " This Table is Not Exist $failure"
fi

. ../../main/Tablesmenu.sh
