#!/bin/ksh

echo "Enter DB Name:"
read DBNAME
echo ""
echo "Enter DB User name"
read DBUSER
echo ""
echo "Enter DB User password"
echo DBPASSWD
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
echo "Enter Recover Catalog user name"
read RCUSER
echo ""
echo "Enter Recovery Catalog user password"
read RCPASSWD
echo ""

echo "DBNAME=$DBNAME" > ora_config.txt
echo "DBUSER=$DBUSER" >> ora_config.txt
echo "DBPASSWD=$DBPASSWD" >> ora_config.txt
echo "ORAHOME=$ORAHOME" >> ora_config.txt
echo "CLIENT=$CLIENT" >> ora_config.txt
echo "RC=$RC" >> ora_config.txt
echo "RCUSER=$RCUSER" >> ora_config.txt
echo "RCPASSWD=$RCPASSWD" >> ora_config.txt

