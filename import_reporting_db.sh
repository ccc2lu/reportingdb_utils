#!/bin/bash

dbusername="ole_db_user"
dbpassword="ole_db_user_password"
reporting_db_name="ole_reporting"
devdir="./" # Change this to where ever you are putting this script
lockfile="${devdir}/lock.import_reporting_db"

if [ -f "$lockfile" ]; then
    echo "Import already running, not starting another import process."
    exit 1
fi

touch $lockfile
# At the location pointed to by this path variable, the script expects to find
# individual files for each table and view in the OLE database, which it will import
# into the reporting database
path="path to export files goes here"
cd $path
echo "Removing 'DEFINER' lines from view creation ..."
views=`ls -1 *_v.sql`
for view in $views
do
    echo "Fixing view: $view"
    perl -p -i.bak -e "s/DEFINER=\`\w.*\`@\`.*\`//g" $view
done

tables=`ls -1 *.sql`
for table in $tables 
do
    echo "Importing table: $table"
    { echo "SET FOREIGN_KEY_CHECKS=0;" ; cat $table ; } | mysql -u ${dbusername} -p${dbpassword} ${reporting_db_name}
done

${devdir}/compute_extended_bib_info.sh
rm -f $lockfile
