#!/bin/ksh

#populate hostlist.txt with server names. oracle:dba user will be created for the names
echo "Creating Oracle user for hosts in hostlist.txt"
echo "=============================================="
for i in `cat hostlist.txt`
do
echo $i
omniusers -add -type U -usergroup ORACLE -name oracle -group dba -client $i -desc oracle
done

