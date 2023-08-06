#! /bin/bash

ntables=`ls -F | grep * | wc -l`
    
if [ $ntables -eq 0 ];
   then echo "No tables found"
else ls -F | grep *
fi
. ../Tablesmenu.sh

# wala cat for list specific table ?


read -p "Enter table name you want to list : " tableName

if [ -f $tableName ] ;then
    cat $tableName

else 
       echo "Table with name $tableName Not exists"
       ListTables.sh
fi
. ../Tablesmenu.sh

