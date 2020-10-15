#!/bin/sh

#  config.sh
#  config variable for use in another script
#
#  Created by John Paul Keohane on 20/06/2018.
#

#Server username
serverUsername=$1;

#Server Password
serverPassword="???";

#ip address of the remote server
serverIP="192.168.1.1";

#location of the logfile
logfilePath=".config/ghb/";

#Read file name of file with format Activity.log.* where * are a set of numbers
fileNameFormat="Activity.log.*";

#file path and name
handbrakeLogfile=$logfilePath$fileNameFormat;
