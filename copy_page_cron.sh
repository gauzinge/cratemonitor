#!/bin/sh
PATH=/usr/kerberos/bin/:/usr/bin:$PATH
export PATH

curr_principal=`klist 2>/dev/null|egrep "Default principal" |awk '{print $3}'`
if [ "x$curr_principal" != "x" ]
then
    kinit -R
    aklog
fi
echo 'Copying files for webpage!'
export DIRNAME="/afs/cern.ch/user/g/gauzinge/www/cratemonitor/"
echo 'moving files to' $DIRNAME
cp /home/xtaldaq/monitoring/*.png $DIRNAME
