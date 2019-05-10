#!/bin/ksh

echo "Enter DB Name:"
read DBNAME
echo ""
echo "Enter oracle home directory:"
read ORAHOME
echo ""
echo "Enter client name. VIP/GSLB for cluster:"
read CLIENT
echo ""
echo "Enter recovery catalog name:"
read RC
echo ""

echo "DBNAME=$DBNAME" > ora_config.txt
echo "ORAHOME=$ORAHOME" >> ora_config.txt
echo "CLIENT=$CLIENT" >> ora_config.txt
echo "RC=$RC" >> ora_config.txt

