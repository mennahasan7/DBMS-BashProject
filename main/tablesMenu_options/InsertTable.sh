#! /bin/bash
source ../../main/Functions.sh

	read -p " Please enter the table name to insert data : " tableName
	metadatafile="md_$tableName"

	if [[ -f $tableName && -f $metadatafile ]];then
			read -p "How many rows do you want to insert in table $tableName : " norows
       		for (( i=1; i<=$norows ; i++ ))
			do
				echo "Insert row # "$i
				for col in $( getColumnsNames $metadatafile )
				do
				read -p "Enter the value for column $col " value
				if  isGoodDataType $col $value ;then
					echo -en $value"\t" >> $tableName
				else
					echo -en "-\t" >> $tableName
				fi
				done
			echo $'\n' >> $tableName
			done
			echo "insert done into $tableName"
			else
				echo "Table doesn't exist please enter the tables name again"
				. ../../main/tablesMenu_options/InsertTable.sh
	fi