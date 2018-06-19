#!/bin/bash

#word we are searching for
searchWord="goose";
#name of the file we want to seach
fileName="Activity.log.12345";

if [ -f $fileName ]; then
echo "\n1. The File " $fileName " Exists!";
fi

echo "2. Seaching for "$searchWord".";

#search file
findGoose=$(grep $searchWord $fileName);

#echo the result of grep to test
echo "3. grep returned "$findGoose;

#did we find the goose?

if [[ "$findGoose" == "$searchWord" ]]
then
    echo "\nFound.";
else
    echo "\nCan't find the goose!!!!!!"
fi

