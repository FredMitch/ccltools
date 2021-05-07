-- File Description
select * from SYSTABLES 
 where TABLE_SCHEMA = 'MITCHF1' and TABLE_NAME = 'CCLP201';

-- File Statistics
select * from SYSTABLESTAT 
 where TABLE_SCHEMA = 'MITCHF1' and TABLE_NAME = 'CCLP201';

-- List members in file
select * from SYSPARTITIONSTAT
 where TABLE_SCHEMA = 'MITCHF1' and TABLE_NAME = 'CCLP201';

-- File Field Descriptions(DSPFLD / DSPFFD)
select * from SYSCOLUMNS2
 where SYSTEM_TABLE_SCHEMA = 'MITCHF1' and TABLE_NAME = 'CCLP201'
 order by ORDINAL_POSITION;
     
-- File Dependencies (DSPDEP / DSPDBR)
select * from table (SYSTOOLS.RELATED_OBJECTS(
                      library_name => 'MITCHF1',
                      file_name    => 'CCLP201'));





