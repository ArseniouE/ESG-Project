select olapts.populate_olapmetadata_views( 'v_esgoverallassessment' , 'fact' );
--auth h function dhmiourgei ena view sthn madata kai enan pinaka factesgoverallassessment sthn olapts. Epishs 
--pros8etei mia egrafi ston pinaka olap_etl_control

--check oti dimiourgithikan 
select * from olapts.olap_etl_control where etlfunction_= 'olap_metadata' and sourcetable_='v_esgoverallassessment';--check oti isactive_='true'


select * from madata.v_esgoverallassessment
select * from olapts.factesgoverallassessment

--gia na kanoume testing oti to funcionality pou dhmiourghsame leitourgei 8a prepei na tre3oume to job scheduler. 
--epomenws 8a prepei na 8esoume olous tous pinakes pou den mas endiaferoun se isactive_ = false kai na valoume true mono ston pinaka
--pou ftia3ame

--PROSOXH!!!! Kratame backup prin peira3oume otidhpote.
create temporary table test_backup as
select *  from olapts.olap_etl_control --434 exei ola ta dedomena vlepo oti einai polloi pinakes isactive_=true

select * from test_backup --434 test oti trexei swsta 

select isactive_, count(*)  from olapts.olap_etl_control group by isactive_
select isactive_, count(*)  from test_backup group by isactive_ --434


--update olapts.olap_etl_control set isactive_= 'false'

--update olapts.olap_etl_control set isactive_= 'true' where etlfunction_= 'olap_metadata' and sourcetable_='v_esgoverallassessment';

----------------------last step---------------
--epanaferoume ton pinaka sthn arxikh tou katastash

--truncate table olapts.olap_etl_control
--insert into olapts.olap_etl_control
--select * from test_backup

