--------------------RUN FUNCTION olapts.populate_olapmetadata_views--------------------

--Run below lines in olap using as input the names of views in tenant 
select olapts.populate_olapmetadata_views( 'v_esgquestion' , 'fact' );
select olapts.populate_olapmetadata_views( 'v_esgassessment' , 'fact' );

--This code creates two foreign tables in madata (v_esgassessment, v_esgquestion) and two tables in olapts (factesgassessment, factesgquestion) 
--for esgquestion and esgassessment respectively. Also, it creates two new rows in olap_etl_control table.


-------------------------------------------------------
--To check if the execution was implemented correctly
-------------------------------------------------------

--Check if column isactive_ = 'true'
select * from olapts.olap_etl_control where etlfunction_= 'olap_metadata' and sourcetable_ in ('v_esgquestion','v_esgassessment')
--if column isactive_ = 'false' we have to update it to true as
--update olapts.olap_etl_control set isactive_= 'true' where etlfunction_= 'olap_metadata' and sourcetable_ in ('v_esgquestion','v_esgassessment')

--Check if madata has records
select * from madata.v_esgquestion limit 10 
select * from madata.v_esgassessment limit 10 

--Check if tables were created (tables in olapts are empty until job scheduler runs)
select * from olapts.factesgquestion 
select * from olapts.factesgassessment


