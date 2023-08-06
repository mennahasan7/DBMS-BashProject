#! /bin/bash

PS3=" choose from the following : "
echo "Successfully connected to Database"
echo "Welcome to Tables Menu :)"  

select choice in "Create Table" "List Tables" "Drop Table" "Insert into Table" "Select Table" "Delete Table" "Update Table" " Main Menu"
    do    
    case $choice in
        "Create Table" ) 
           bash ./CreateTable 
        ;;
        "List Tables" ) 
          bash ./listTables 
        ;;
        "Drop Table" )
          bash ./DropTable 
        ;;
        "Insert Into Table" ) 
          bash ./InsertTable
        ;;
        "Select Table" ) 
          bash ./SelectTable 
        ;;
        "Delete Table" )
          bash ./DeleteTable 
        ;;
        "Update Table" )
          bash ./UpdateTable 
        ;;  
        " Main Menu" )
        cd .. ; 
        DBMenu ;;
        * ) 
        echo " Invalid Choice ";;
    esac
    done
