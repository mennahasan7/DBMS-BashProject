#! /bin/bash
source ../../main/Functions.sh


read -p "Enter Table Name you want to update them :" tableName
metadatafile="md_$tableName"
if [ -f $tableName ]; then
   # update where condition
     #Get the colmn number
      head -n 1 $tableName
      read -p "Choose the number of condition column : " conditionColumnNumber
      cat $tableName | cut -f$conditionColumnNumber -d$'\t'

      read -p "Enter the value for update condition " condition_value
      #check if the value is exist at least once
      set -x
      check=$(cut -d$'\t' -f$conditionColumnNumber $tableName | grep $condition_value |wc -l) 
      if [[ $check -ge 1 ]];then
       # select the old value
         read -p "Enter the number of column you want to update :" updateColumnNumber
         read -p "Enter the name of column you want to update :" updateColumnName

         PK=$(awk -F'\t' -v column=$updateColumnName '{
                                             if($1==column)
                                             {print $3}}' $metadatafile)

         cut -d$'\t' -f$updateColumnNumber $tableName | cat -n  #cat for numbering
         read -p "Enter the value you want to update :" OldValue           
         exist=$(cut -d$'\t' -f$updateColumnNumber $tableName  | grep -w $OldValue | wc -l)
         if [[ $exist -ge 1 ]]; then

            # get the new value               
            read -p "Enter the new value you want to set " NewValue
            isGoodDataType $updateColumnName $NewValue 
            if [[ $PK == "PK" ]]; then
               unique=$(cut -d$"\t" -f$updateColumnNumber $tableName  | grep -w $NewValue | wc -l)
               if $unique -eq 0 ; then               
                  substitute $OldValue $NewValue $tableName #$1 OldValue $2 NewValue $3 TableName
               else 
                  echo This value is already exist  
               fi
            else
            substitute $OldValue $NewValue $tableName #$1 OldValue $2 NewValue $3 TableName
            fi
         else 
            echo " This value you want to update doesn't exist " 
         fi
   else
   echo "Column Not found !"
   fi
else
    echo "The table name not found please try again"
    bash  ../../main/tablesMenu_options/UpdateTable.sh
fi