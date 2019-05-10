#!/bin/ksh

for i in `cat ora_config.txt`
do
export $i
done

#generate specname from variable 
SPECNAME="B1_`echo $CLIENT |cut -d "." -f 1`_`echo $DBNAME`"

#Creating log_del backup
SPECNAME_LD="`echo $SPECNAME`_log_del"
echo "CREATE LOG_DEL"
echo "============="
ls /etc/opt/omni/server/dltemplates/lists/oracle8/ |sort |grep log_del
echo "Please select which template to use for log_del:" 
read TEMPLATE1
sed -e "s/application/$DBNAME/" -e "s/host/$CLIENT/" -e "s/system.hp.com/$CLIENT/" -e "s/$TEMPLATE1/$SPECNAME_LD/" -e "s/BLKSIZE=1048576//"  /etc/opt/omni/server/dltemplates/lists/oracle8/$TEMPLATE1 > ~/oracleintegrationdir/$SPECNAME_LD\_temp 
echo " "

#Creating Full backup
SPECNAME_F="`echo $SPECNAME`_F"
echo "CREATE FULL BACKUP SPEC"
echo "======================="
ls /etc/opt/omni/server/dltemplates/lists/oracle8/ |sort |grep F
echo "Please select which template to use for Full"
read TEMPLATE2
sed -e "s/application/$DBNAME/" -e "s/host/$CLIENT/" -e "s/system.hp.com/$CLIENT/" -e "s/$TEMPLATE2/$SPECNAME_F/" -e "s/BLKSIZE=1048576//"  /etc/opt/omni/server/dltemplates/lists/oracle8/$TEMPLATE2 > ~/oracleintegrationdir/$SPECNAME_F\_temp
echo " "

#check if incremental spec is needed
echo "Do this backup needs incremental spec? (Y/N)"
read M

if [ $M = "Y" ]
then
SPECNAME_I="`echo $SPECNAME`_I"
echo "CREATE INCR SPEC"
echo "================"
ls /etc/opt/omni/server/dltemplates/lists/oracle8/ |sort |grep I
echo "Please select which template to use for INCR"
read TEMPLATE3
sed -e "s/application/$DBNAME/" -e "s/host/$CLIENT/" -e "s/system.hp.com/$CLIENT/" -e "s/$TEMPLATE3/$SPECNAME_I/" -e "s/BLKSIZE=1048576//"  /etc/opt/omni/server/dltemplates/lists/oracle8/$TEMPLATE3 > ~/oracleintegrationdir/$SPECNAME_I\_temp
else
echo "No incr created"
fi


#select group for specs
echo "Please select spec group. Enter "N" if no or default group"
echo "========================"
cat /etc/opt/omni/server/dlgroups/groups
read GROUP

if [ $GROUP = "N"  ]
then
echo "No group selected"
cp ~/oracleintegrationdir/$SPECNAME_LD\_temp ~/oracleintegrationdir/$SPECNAME_LD
cp ~/oracleintegrationdir/$SPECNAME_F\_temp  ~/oracleintegrationdir/$SPECNAME_F
	if [ $M = "Y" ]
	then
	cp ~/oracleintegrationdir/$SPECNAME_I\_temp ~/oracleintegrationdir/$SPECNAME_I
	fi
else
sed -e '2s/$/\
GROUP \"/' -e "2s/$/$GROUP\"/" ~/oracleintegrationdir/$SPECNAME_LD\_temp > ~/oracleintegrationdir/$SPECNAME_LD
sed -e '2s/$/\
GROUP \"/' -e "2s/$/$GROUP\"/" ~/oracleintegrationdir/$SPECNAME_F\_temp > ~/oracleintegrationdir/$SPECNAME_F
	if [ $M = "Y" ]
	then
sed -e '2s/$/\
GROUP \"/' -e "2s/$/$GROUP\"/" ~/oracleintegrationdir/$SPECNAME_I\_temp > ~/oracleintegrationdir/$SPECNAME_I
	fi
fi


#moving spec file to barlists and echo for mod_dev_props purpose
pbrun cp ~/oracleintegrationdir/$SPECNAME_LD /etc/opt/omni/server/barlists/oracle8/$SPECNAME_LD
pbrun cp ~/oracleintegrationdir/$SPECNAME_F /etc/opt/omni/server/barlists/oracle8/$SPECNAME_F
echo "/etc/opt/omni/server/barlists/oracle8/$SPECNAME_LD"
echo "/etc/opt/omni/server/barlists/oracle8/$SPECNAME_F"
if [ $M = "Y" ]
then
pbrun cp ~/oracleintegrationdir/$SPECNAME_I /etc/opt/omni/server/barlists/oracle8/$SPECNAME_I
echo "/etc/opt/omni/server/barlists/oracle8/$SPECNAME_I"
fi

