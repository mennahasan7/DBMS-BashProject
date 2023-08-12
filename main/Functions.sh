#! /bin/bash
export LC_COLLATE=C
shopt -s extglob

isValidName(){ 
        if [[ $1 =~ ^[a-zA-Z][a-zA-Z0-9]*$ ]]; then 
            return 0
        else 
            return 1
        fi
}

isExistColumn(){ #$1 is the file name, $2 is the column name
    cut -f1 -d $'\t' $1 | grep -w $2 
    return $?
}

getColumnsNames ()
{
    cut -f1 -d $'\t' $1
}

isGoodDataType ()
{
    DataType=$(awk -F'\t' -v column_name=$1 '{if($1==column_name){print $2}}' $metadatafile)
        if [[ $DataType == "int" ]]; then
            if [[ "$2" =~ ^[1-9][0-9]*$ ]]; then
                return 0
            else
                echo "Please Enter The INTEGER value Because the data type for $column_name is int !"
                return 1
            fi
     
        elif [[ $DataType == "string" ]]; then
            if [[ "$2" =~ ^[a-zA-Z]+$ ]]; then
                return 0
            else
                echo "Please Enter The String value Because the data type for $column_name is string !"
                return 1
            fi
        fi
}

substitute (){
    # substituting            
    sed -i 's/'$OldValue'/'$NewValue'/g' $TableName  #$1 OldValue $2 NewValue $3 TableName

}