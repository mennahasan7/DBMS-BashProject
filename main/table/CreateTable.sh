#! /bin/bash

read -p " Enter table name you want to create : " tableName
 
if [[ -e $tablename ]]; then 
    echo " table already exists! "
    cd ../..
    . ../Tablesmenu.sh
elif [ IsValidName $tablename ]; then
    echo " Invalid name "
    CreateTable.sh
else
    touch $table
    echo "table created succesfully!"
fi

count="true"
read -p "Please enter Number of columns : " ncolumns
if  [[ $ncolumns =~ ^[0-9]+$ ]]; then
    for (( i=1; i<=$ncolumns ; i++ ))
    do
	read -p "Please enter name for column no.$i: " columnname
	if [ IsvalidName $columnname ];then
	   #check if the coloumn name is already exist ?
	  echo "Select the $columnname DataType : "
          select choice in "int" "string"
              do 
               case $choice in 
               "int")
                echo -n $columnname"($datatype);" >> $table
                ;;
               "string")
                echo -n $columnname"($datatype);" >> $table
                ;;
               *)
                echo "Sorry!! you must Enter 1 or 2 Datatype"
                ;;
               esac  
              done          
	  while [ $count == "true" ]
	      do
	      read -p "Is this a Primary Key? [Y/N]" PK		
	      if [[ $PK == "Y" || $PK== "y" || $PK == "yes" ]];then
	         mark="false"
		 echo -n "(PK)" >> $table
	      else
		 break
	      fi
	  done
	else
	  echo " UnValid column name "
    done
    echo $'\n' >> $table 
    echo "Your table $table created"
else
    echo "$ncolumns is not a valid input. Please enter numbers only !"
fi
. ../Tablesmenu
