#!/bin/bash
# remember to change permission!

# $1: problem id
# $2: platform name


echo ${BASH_SOURCE[0]}

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

if [[ -n $2 ]]; then
    FILE=$($DIR/create.py -id $1 -pl $2)
else
    FILE=$($DIR/create.py -id $1)
fi

# Can python handle this?
code --goto $FILE