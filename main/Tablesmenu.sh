#! /bin/bash

PS3=" Choose from the following table options : "
echo -e "Connected to Database Successfully! \U2705  \n Welcome to Tables Menu \U1F60D"

select choice in "Create Table" "List Tables" "Drop Table" "Insert into Table" "Select Table" "Delete Table" "Update Table" " Main Menu"
    do    
    case $choice in
        "Create Table" ) 
          bash ../../main/tablesMenu_options/CreateTable.sh 
        ;;
        "List Tables" ) 
          bash ../../main/tablesMenu_options/ListTables.sh 
        ;;
        "Drop Table" )
          bash ../../main/tablesMenu_options/DropTable.sh 
        ;;
        "Insert into Table" ) 
          bash ../../main/tablesMenu_options/InsertTable.sh
        ;;
        "Select Table" ) 
          bash ../../main/tablesMenu_options/SelectTable.sh 
        ;;
        "Delete Table" )
          bash ../../main/tablesMenu_options/DeleteTable.sh 
        ;;
        "Update Table" )
          bash ../../main/tablesMenu_options/UpdateTable.sh 
        ;;  
        " Main Menu" )
          cd - 
          . ../main/DBmenu.sh 
;;
        * ) 
        echo " Invalid Choice ";;
    esac
    echo "1) Create Table	      3) Drop Table	    5) Select Table	  7) Update Table
2) List Tables	      4) Insert into Table  6) Delete Table	  8)  Main Menu"
  done
