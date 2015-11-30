#!/bin/bash

# First we clear out deleted rows
echo "Rebuilding deleted_bibs table ..."
echo "truncate table deleted_bibs;" | mysql -u OLE -pOLE ole_reporting
echo "insert into deleted_bibs select l.bib_id from bib_leader_t l where l.bib_id not in (select b.bib_id from ole_ds_bib_t b);" | mysql -u OLE -pOLE ole_reporting
echo "Rebuilding deleted_dfields table ..."
echo "truncate table deleted_dfields;" | mysql -u OLE -pOLE ole_reporting
echo "insert into deleted_dfields select df.dfield_id from bib_datafield_t df where df.bib_id in (select b.bib_id from deleted_bibs b);" | mysql -u OLE -pOLE ole_reporting
echo "Deleting rows from bib_leader_t for deleted bibs ..."
echo "delete from bib_leader_t where bib_id in (select d.bib_id from deleted_bibs d);" | mysql -u OLE -pOLE ole_reporting
echo "Deleting rows from bib_controlfield_t for deleted bibs ..."
echo "delete from bib_controlfield_t where bib_id in (select d.bib_id from deleted_bibs d);" | mysql -u OLE -pOLE ole_reporting
echo "Deleting rows from bib_datafield_t for deleted bibs ..."
echo "delete from bib_datafield_t where bib_id in (select d.bib_id from deleted_bibs d);" | mysql -u OLE -pOLE ole_reporting
echo "Deleting rows from bib_subfield_t for deleted datafields ..."
echo "delete from bib_subfield_t where dfield_id in (select df.dfield_id from deleted_dfields df);" | mysql -u OLE -pOLE ole_reporting

oledbhost="server IP here"
tools_dir="location of Java program that loads the extended bib tables here"
datestamp=`date -d 'now - 2 day' +"%Y-%m-%d"`
# It speeds the Java program up a lot if it's output goes into
# an in-memory file system.  It outputs a lot and constantly
# overwrites the tmp.marcxml file.
ramdisk="${tools_dir}/ramdisk"
batchsize=10000

# Load bibs for records that have changed since $datestamp. This thing
# needs a lot of memory.
java -Xms1g -Xmx4g -XX:MaxPermSize=2g -Dfile.encoding=UTF-8 -Doledbhost="$oledbhost" -jar ${tools_dir}/LoadExtendedBibInfoTables.jar "$ramdisk/tmp.marcxml" $batchsize "$datestamp" > $ramdisk/loadextendedbibinfo.out 2>&1
# The above method is faster (on my server) as long as the number of
# bibs that have changed is fewer than ~3000.
# The Java program that loads the tables is naive at the moment
# in that it is single threaded, though.  The work could be easily
# divided up across threads.  I'll get to it eventually.

# The Java program is built from this source code:
# https://github.com/ccc2lu/LU_OLEBibLoadDocuments/blob/directdb/LU_OLEBibLoadDocuments/src/edu/lu/LoadOLEReportingDB/LoadExtendedBibInfoTables.java

# Full rebuild of extended bib tables, with no date stamp
#java -Xms1g -Xmx4g -XX:MaxPermSize=2g -Dfile.encoding=UTF-8 -Doledbhost="$oledbhost" -jar ${tools_dir}/LoadExtendedBibInfoTables.jar "$ramdisk/tmp.marcxml" $batchsize > $ramdisk/loadextendedbibinfo.out 2>&1
# On my server, this takes 3-4 hours to finish for our ~1.1 million bibs
