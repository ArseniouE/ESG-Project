--------------------Drop existing tables/ rows --------------------

drop foreign table if exists madata.v_esgassessment;
drop table if exists olapts.factesgassessment;

drop foreign table if exists madata.v_esgquestion;
drop table if exists olapts.factesgquestion;

drop foreign table if exists madata.v_esgoverallassessment;
drop table if exists olapts.factesgoverallassessment;

delete from olapts.olap_etl_control where etlfunction_= 'olap_metadata' and sourcetable_ in ('v_esgassessment','v_esgoverallassessment','v_esgquestion');

--------------------RUN FUNCTION olapts.populate_olapmetadata_views--------------------

--Run below lines in olap using as input the names of views in tenant 
select olapts.populate_olapmetadata_views( 'v_esgassessment', 'fact' );
select olapts.populate_olapmetadata_views( 'v_esgoverallassessment', 'fact' );
select olapts.populate_olapmetadata_views( 'v_esgquestion', 'fact' );

--This code creates three foreign tables in madata (v_esgassessment, v_esgoverallassessment,v_esgquestion) and three tables 
--in olapts (factesgassessment, factesgoverallassessment, factesgquestion) 
--for esgassessment, esgoverallassessment, esgquestion respectively. Also, it creates three new rows in olap_etl_control table.

-------------------------------------------------------
--To check if the execution was implemented correctly
-------------------------------------------------------

--Check if column isactive_ = 'true'
select * from olapts.olap_etl_control where etlfunction_= 'olap_metadata' and sourcetable_ in ('v_esgassessment','v_esgoverallassessment','v_esgquestion')
--if column isactive_ = 'false' we have to update it to true as
--update olapts.olap_etl_control set isactive_= 'true' where etlfunction_= 'olap_metadata' and sourcetable_ in ('v_esgassessment','v_esgoverallassessment','v_esgquestion')

