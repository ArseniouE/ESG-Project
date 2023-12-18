--------------------Drop existing tables/ rows --------------------

drop foreign table if exists madata.v_esgassessment;
drop table if exists olapts.factesgassessment;
delete from olapts.olap_etl_control where etlfunction_= 'olap_metadata' and sourcetable_ = ('v_esgassessment');

--------------------RUN FUNCTION olapts.populate_olapmetadata_views--------------------

--Run below lines in olap using as input the names of views in tenant 
select olapts.populate_olapmetadata_views( 'v_esgassessment' , 'fact' );
select olapts.populate_olapmetadata_views( 'v_esgoverallassessment' , 'fact' );

--This code creates two foreign tables in madata (v_esgassessment, v_esgoverallassessment) and two tables 
--in olapts (factesgassessment, factesgoverallassessment) 
--for esgassessment, esgoverallassessment respectively. Also, it creates two new rows in olap_etl_control table.

-------------------------------------------------------
--To check if the execution was implemented correctly
-------------------------------------------------------

--Check if column isactive_ = 'true'
select * from olapts.olap_etl_control where etlfunction_= 'olap_metadata' and sourcetable_ in ('v_esgassessment','v_esgoverallassessment')
--if column isactive_ = 'false' we have to update it to true as
--update olapts.olap_etl_control set isactive_= 'true' where etlfunction_= 'olap_metadata' and sourcetable_ in ('v_esgassessment','v_esgoverallassessment')
