#! /bin/bash

PS3=" choose from the following : "
echo "Successfully connected to Database"
echo "Welcome to Tables Menu :)"  

select choice in "Create Table" "List Tables" "Drop Table" "Insert into Table" "Select Table" "Delete Table" "Update Table" " Main Menu"
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
        "Select Table" ) 
          bash ./SelectTable.sh 
        ;;
        "Delete Table" )
          bash ./DeleteTable.sh 
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
