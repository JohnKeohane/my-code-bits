#!/bin/bash

#Read file name of file with format Activity.log.* where * are a set of numbers
fileNameFormat="Activity.log.*";

#list all the files in the folder and grep for the one with the format fileNameFormat
fileName=$(ls | grep $fileNameFormat);

#in the file is a string that signifies that the activity has finished. we need to search for that string. "work result = 0"
#The string will be in the last line of the file.
terminatedActivityString="goose";

lastLineofFilename=$(grep $terminatedActivityString $fileName);

#do something depending on whether the activity is finished or not
if [[ $lastLineofFilename == $terminatedActivityString ]];
then
    echo "Activity Finished";
    $(blink1-tool -t 300 --random=100);      # Every 2 seconds new random color
else
    echo "Activity NOT finished!!!!!";
fi
