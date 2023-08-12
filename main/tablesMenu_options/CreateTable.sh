#! /bin/bash
export LC_COLLATE=C
shopt -s extglob

source ../../main/Functions.sh

read -p " Enter table name you want to create : " tableName
metadatafile="md_$tableName"

if [[ -e $tableName ]]; then 
    echo -e " Table already exists! \U274C"
   
    echo "Do you want to enter another table (1 for YES or 2 for NO) : "
    select REPLY in "Yes" "No" 
        do
            case $REPLY in
            "Yes" )
            bash  ../../main/tablesMenu_options/CreateTable.sh
            ;;
            "No" )
            bash ../../main/Tablesmenu.sh
            ;;
            *)
            echo -e "Invalid choice \U274C" ;;
            esac
        done
elif ! isValidName $tableName ; then
    echo -e " Invalid name \U274C"
    bash  ../../main/tablesMenu_options/CreateTable.sh
else
    touch $tableName 
    
    touch $metadatafile
    echo -e "Table is created Succesfully! \U2705"

    count="true"
    read -p "Please enter Number of columns : " ncolumns
    if  [[ $ncolumns =~ ^[1-9][0-9]*$ ]]; then
        for (( i=1; i<=$ncolumns ; i++ ))
        do
            read -p "Please enter name for column no.$i: " columnname
            if  isValidName $columnname && ! isExistColumn $metadatafile $columnname ;then	

                echo $'\n' >> $metadatafile #to make a new line starting from the second line             
                echo -en $i-$columnname"\t" >> $tableName   #"ex: 1-id 2-name.."
                echo "Select the $columnname DataType : "
                select choice in "int" "string"
                do 
                case $choice in 
                "int")
                    echo -en $columnname"\tint" >> $metadatafile
                    break
                    ;;
                "string")
                    echo -en $columnname"\tstring" >> $metadatafile
                    break
                    ;;
                *)
                    echo -e "Sorry!! you must Enter 1 or 2 Datatype \U274C"
                    ;;
                esac  
                done          
                    if [ $count == "true" ];then
                        
                        read -p "Is this a Primary Key? [Y/N]" PK		

                        case $PK in
                        [yY][eE][sS]|[yY])
                        count="false"
                        echo -en "\tPK" >> $metadatafile
                        ;;
                        [nN][oO]|[nN])
                        echo -en "\t" >> $metadatafile
                        ;;
                        esac
                    fi
            else
                    echo -e " Invalid column name \U274C"
            fi
        done 
                echo $'\n' >> $tableName
                echo -e "Your metadata $metadatafile is created Succesfully! \U2705"
                echo -e "Your Table $tableName is created Succesfully! \U2705"

    else
        echo "$ncolumns is not a valid input. Please enter numbers only!"
    fi
fi
. ../../main/Tablesmenu.sh