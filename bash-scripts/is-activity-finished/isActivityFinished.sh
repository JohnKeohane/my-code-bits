#!/bin/sh
### BEGIN INIT INFO
# Short-Description: Check a logfile to see if a process has completed
# Description:       check if a local file is complete by searching for a predetermined string,
#                    uses blink1-tool command to alert the user that the activity has completed.
### END INIT INFO

# Author: JP Keohane <john.keohane@gmail.com>

#Read file name of file with format Activity.log.* where * are a set of numbers
fileNameFormat="Activity.log.*";

#list all the files in the folder and grep for the one with the format fileNameFormat
fileName=$(ls | grep $fileNameFormat);

#in the file is a string that signifies that the activity has finished. we need to search for that string. "work result = 0"
#The string will be in the last line of the file.
terminatedActivityString="goose";

lastLineofFilename=$(grep $terminatedActivityString $fileName);

#wait for the activity log to show that its finished
while [[ $lastLineofFilename != $terminatedActivityString ]];
do
    #activity isn't complete so sleep for a bit
    sleep 1;
    #the filename changes periodically, update filename and check the filename for the string indicating the activity is finished
    fileName=$(ls | grep $fileNameFormat);
    lastLineofFilename=$(grep $terminatedActivityString $fileName);
done

echo "Activity Finished";
blink1-tool --rgb 'FF9900' --quiet;
while true; do
    blink1-tool --on  --quiet;
    sleep 0.5;
    blink1-tool --off --quiet;
    sleep 0.5;
done
