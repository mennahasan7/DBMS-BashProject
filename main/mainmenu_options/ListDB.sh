#! /bin/bash
source ../main/emojis.sh

 num=$(ls -F | grep / | wc -l)
  if [ $num -eq 0 ]
        then 
            echo -e "No Databases found $failure"
    else
        echo " Total Number of Databases = " $num
        ls -F | grep /
  fi
 