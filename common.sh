#!bin/bash

USERID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPTNAME=$(echo $0 | cut -d "." -f1)
LOGFILE=tmp/$SCRIPTNAME-$TIMESTAMP.log

R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e[33m"

echo "Script started running at : $TIMESTAMP"

VALIDATE (){
    if  [$1 ne 0]
then 
    echo "$2 ....$R Failure $N  "
    exit 1
 else
    echo "$2 .....$G Success $N"   
  fi
}  

check_root(){
if [ $USERID -ne 0]
then
    echo "Please run this script with Root Access"
    exit 1
else
    echo "You are Super User"
fi        
}