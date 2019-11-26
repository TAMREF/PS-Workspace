# remember to change permission!

# $1: project root folder
# $2: platform name
# $3: problem id

mkdir -p $1/Practice/$2/$3

file="$1/Practice/$2/$3/code.cpp"

echo Making file: $file

if [ -f $file ]
then
    echo "File is already there!"
else
    cp $1/Resources/standard.cpp $file
fi

code --goto $file

echo "Done."