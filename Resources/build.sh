# remember to change permission!

# $1: cpp name
# $2: input file name

mkdir -p $1/Practice/$2/$3

code=$1
inp=$2
file="$1/Practice/$2/$3/code.cpp"
inp="$1/Practice/$2/$3/input.in"

echo
echo Making file: $file

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

code --goto $file
code --goto $inp

echo "Done."