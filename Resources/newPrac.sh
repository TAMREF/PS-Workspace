# remember to change permission!

# $1: project root folder
# $2: platform name
# $3: problem id

mkdir -p $1/Practice/$2/$3

file="$1/Practice/$2/$3/code.cpp"
inp="$1/Practice/$2/$3/input.in"

echo Making file: $file

id=$3
if [ ${#id} -le 0 ]
then
    echo "Empty id!"
    exit 1
fi

if [ -f $file ]
then
    echo "File is already there!"
else
    cp $1/Resources/standard.cpp $file
fi

if [ -f $inp ]
then
    echo "Input file is already there!"
else
    touch $inp
fi

code --goto $inp
code --goto $file

echo "Done."