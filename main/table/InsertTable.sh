#! /bin/bash

echo "Please enter table name to insert data: "
	read table 2> /dev/null
	if [[ -f $table ]]
		then
			# grep [-o] Print only the matched (non-empty) parts of a matching line, with each such part on a separate output line.
			# get number of fields that contain the word PK (header)
			x=`grep 'PK' $table | grep -o ";" | wc -l` 
			for ((i=1;i<=x;i++)) 
			do      
				# cut to return fileds of the header
				columnName=`grep PK $table | cut -f$i -d";"`
				echo $'\n'
				echo $"Please enter data for field no.$i [$columnName]"
				read data 2> /dev/null
				checkType $i $data
				# if [checkType $i $data ] is false so result will be any number except 0
				if [[ $? != 0 ]]
				then
					(( i = $i - 1 ))
			        # if [checkType $i $data ] is true we will add the data to the column then seperate using ;
				else	
					echo -n $data";" >> $table
				fi
			done	
			echo $'\n' >> $table #end of record
			echo "insert done into $table"
		else
			echo "Table doesn't exist"
