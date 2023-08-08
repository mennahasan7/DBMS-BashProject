#! /bin/bash

PS3=" choose from the following : "
echo "Successfully connected to Database"
echo "Welcome to Tables Menu :)"  

select choice in "Create Table" "List Tables" "Drop Table" "Insert Into Table" "Select From Table" "Delete From Table" "Update Table" " Main Menu"
    do    
    case $choice in
        "Create Table" ) 
           bash ./CreateTable.sh 
        ;;
        "List Tables" ) 
          bash ./listTables.sh 
        ;;
        "Drop Table" )
          bash ./DropTable.sh 
        ;;
        "Insert Into Table" ) 
          bash ./InsertTable.sh
        ;;
        "Select From Table" ) 
          bash ./SelectFromTable.sh 
        ;;
        "Delete From Table" )
          bash ./DeleteFromTable.sh 
        ;;
        "Update Table" )
          bash ./UpdateTable.sh 
        ;;  
        " Main Menu" )
        cd .. ; 
        DBMenu ;;
        * ) 
        echo " Invalid Choice ";;
    esac
    done
