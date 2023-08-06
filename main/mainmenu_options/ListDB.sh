#! /bin/bash

 num=$(ls -F | grep / | wc -l)
 
  if [ $num -eq 0 ]
        then 
            echo "No Databases found"
    else
        echo " Total Number of Databases = " $num
        ls -F | grep /
  fi
 