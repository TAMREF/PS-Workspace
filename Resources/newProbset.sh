# remember to change permission!

# $1: project root folder
# $2: Contest name
# $3: Problem name

mkdir -p $1/Problemsetting/$2/$3

valfile="$1/Problemsetting/$2/$3/val.cpp"
chkfile="$1/Problemsetting/$2/$3/checker.cpp"
genfile="$1/Problemsetting/$2/$3/gen.cpp"

echo Making file: $valfile $chkfile $genfile

id=$3
if [ ${#id} -le 0 ]
then
    echo "Empty id!"
    exit 1
fi

if [ -f $valfile ]
then
    echo "Validator file is already there!"
else
    cp $1/Resources/val.cpp $valfile
fi

if [ -f $chkfile ]
then
    echo "Checker file is already there!"
else
    cp $1/Resources/checker.cpp $chkfile
fi

if [ -f $genfile ]
then
    echo "Generator file is already there!"
else
    cp $1/Resources/gen.cpp $genfile
fi

code --goto $valfile
code --goto $chkfile

echo "Done."