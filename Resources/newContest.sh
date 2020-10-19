# remember to change permission!

# $1: project root folder
# $2: platform name
# $3: Contest name
# $4: Number of Problems

mkdir -p $1/Contest/$2/$3

id=$3
all=( {A..Z} )

if [ $4 -ge 27 ]
then
    echo "The script supports at most 26 problems in once."
    exit 1
fi

if [ $4 -le 0 ]
then
    echo "Empty Contest!"
    exit 1
fi

problemRange=${all:0:$4}

if [ ${#id} -le 0 ]
then
    echo "Empty id!"
    exit 1
fi

for letter in ${all[@]:0:$4} ; do
    file="$1/Contest/$2/$3/${letter}/${letter}.cpp"
    inp="$1/Contest/$2/$3/${letter}/input.in"
    echo Making file: $file
    mkdir -p $1/Contest/$2/$3/${letter}
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
done

code --goto $1/Contest/$2/$3/A/input.in
code --goto $1/Contest/$2/$3/A/A.cpp

echo "Done."
