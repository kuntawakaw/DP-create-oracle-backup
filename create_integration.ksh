#!/bin/ksh

#craete working directory
if [ -d oracleintegrationdir ]
then 
echo "directory exist"
else
echo "creating directory"
mkdir oracleintegrationdir
fi

#export variable from ora_config.txt
for i in `cat ora_config.txt`
do
export $i
done

#create integration script to paste in db server
echo "paste below in DB server"
echo " "
echo "/opt/omni/lbin/util_oracle8.pl -config -dbname $DBNAME  -orahome $ORAHOME -prmuser omnibackup -prmpasswd omni_$DBNAME -prmservice $DBNAME -rcuser rman_$DBNAME -rcpasswd dcc_rman -rcservice $RC -client $CLIENT"
echo ""
echo " ================================================================"
echo " once you get RETVAL 0, please press any key. ctrl +c if you want to abort"
read
#creating backup of integration file
pbrun cp /etc/opt/omni/server/integ/config/Oracle8/$CLIENT%$DBNAME ~/oracleintegrationdir/$CLIENT%$DBNAME\_ori 
#correcting user and group to oracle:dba for integration 
pbrun /usr/bin/sed -e "/OSGROUP/d" -e "/OSUSER/d" ~/oracleintegrationdir/$CLIENT%$DBNAME\_ori > ~/oracleintegrationdir/$CLIENT%$DBNAME
echo "OSGROUP='dba';" >> ~/oracleintegrationdir/$CLIENT%$DBNAME
echo "OSUSER='oracle';" >> ~/oracleintegrationdir/$CLIENT%$DBNAME 

#move the correct integration file into integration directory
pbrun cp ~/oracleintegrationdir/$CLIENT%$DBNAME /etc/opt/omni/server/integ/config/Oracle8/$CLIENT%$DBNAME
