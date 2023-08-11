#! /bin/bash

PS3="Choose from the menu : "
echo -e "Welcome to Database Menu \U1F60D"
cat<<'EOF'
           _..._
         .'     '.
        /  _   _  \
        | (o)_(o) |
         \(     ) /
         //'._.'\ \
        //   .   \ \
       ||   .     \ \
       |\   :     / |
       \ `) '   (`  /_
     _)``".____,.'"` (_
     )     )'--'(     (
      '---`      `---`
EOF

select option in "Create a Database" "List Databases" "Connect To a Database" "Drop a Database" "Exit"
        do 
            case $option in 
            "Create a Database") 
                bash ../main/mainmenu_options/CreateDB.sh
            ;;
            "List Databases")
                bash ../main/mainmenu_options/ListDB.sh 
            ;;
            "Connect To a Database")
                bash ../main/mainmenu_options/ConnectDB.sh  
            ;;
            "Drop a Database") 
                bash ../main/mainmenu_options/DropDB.sh  
            ;;
            "Exit") 
                exit
            ;;
            *) 
                echo "Invalid choice try again" ;;
            esac
        done 
