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