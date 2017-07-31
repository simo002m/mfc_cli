#!/bin/bash

read -p "Pick a name for the files: " file_name
read -p "Which filetype?(ENTER for an ordinary file) " filetype_input
read -p "Type some text that you would like to have inside of the files: " content
read -p "How many files do you want to create? " amount

#Here are the variables for the password and the maximum amount of files,
#feel free to change them
maximum=500
password="mfc"

#The reason why the password is required is that someone with bad intentions can't just
#make a million or a billion files, which might have the potential to crash the system
#or make everything very slow and laggy.

#Or even if your intentions are not bad, then it can also be used as a warning, if you
#dont realize that you're about to create a tremendous amount of files.


#If the filetype_input variable is nothing or empty(-z) define a new variable called
#filetype as an empty variable as well. Else add a dot(.) in front of the filetype
#requested byt the user
if [ -z $filetype_input ]
then
	filetype=""
elif [ "${filetype_input:0:1}" == "." ] #Check if the first letter of the filetype is a dot(.)
then
	filetype="$filetype_input"	
else
	filetype=".$filetype_input"
fi

function create_files {
    for (( i=1; i < $amount + 1; i++ ))
    do
        echo $content > "$file_name$i$filetype"
    done
}


if (( $amount <= $maximum ))
then
    create_files
else
    echo ""
    echo "In order to create more than 100 files, a password is required."

    read -sp "Password: " password_input

    if [ $password_input == $password ]
    then
        create_files
        echo ""
    else
        echo ""
        echo "Sorry, but that's not the right password."
    fi
fi

