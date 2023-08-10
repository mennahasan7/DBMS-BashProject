#! /bin/bash

read -p "Please Enter the Name of the Table " tbName


if [ -f $tbname ]; then 
         #metaTable=`echo $tbName"_meta"` 
         rm $tbName
         #rm $metaTable
         echo " Table has been Deleted Successfully "
else "This Table is Not Exist "
fi

. ../Tablesmenuu
