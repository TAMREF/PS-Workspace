#!/usr/bin/zsh

# remember to change permission!

mkdir -p $1/$2/$3

file="$1/$2/$3/code.cpp"

echo Making file: $file

if [ -f $file ]
then
    echo "File is already there!"
else
    cp $1/Resources/standard.cpp $file
fi

code --goto $file

echo "Done."