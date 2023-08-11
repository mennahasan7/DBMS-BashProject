#! /bin/bash
export LC_COLLATE=C
shopt -s extglob

isValidName(){ 
        if [[ $1 =~ ^[a-zA-Z][a-zA-Z0-9]*$ ]]; then 
            return ${true}
        else 
            return ${false}
        fi
}

isRepeatedColumn(){ #$1 is the file name, $2 is the column name
    cut -f1 -d$'\t' $1 | grep -w $2
}