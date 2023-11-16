--trexoume auto to function me input to onoma tou view pou ftia3ame sthn tenant.
select olapts.populate_olapmetadata_views( 'v_esgquestion' , 'fact' );
--auth h function dhmiourgei ena view sthn madata kai enan pinaka factesgquestion sthn olapts. Epishs 
--pros8etei mia egrafei ston pinaka olap_etl_control

--check oti dhmiourgh8hkan
select * from olapts.olap_etl_control where etlfunction_= 'olap_metadata' and sourcetable_ like '%esg%';--check oti isactive_='true'

select * from madata.v_esgquestion 
select * from olapts.factesgquestion --sthn arxh o pinakas einai kenos. gia na gemisei prepei na tre3ei to job scheduler

-----------------------------------------------------------------------------

--gia na kanoume testing oti to funcionality pou dhmiourghsame leitourgei 8a prepei na tre3oume to job scheduler. 
--epomenws 8a prepei na 8esoume olous tous pinakes pou den mas endiaferoun se isactive_ = false kai na valoume true mono ston pinaka
--pou ftia3ame

--PROSOXH!!!! Kratame backup prin peira3oume otidhpote.

create temporary table test_backup as
select *  from olapts.olap_etl_control --432

select * from test_backup --432

select isactive_, count(*)  from olapts.olap_etl_control group by isactive_
select isactive_, count(*)  from test_backup group by isactive_ --432

--------------update se false olous tous pinakes kai set se true auton pou mas endiaferei

--update olapts.olap_etl_control set isactive_= 'false'

--update olapts.olap_etl_control set isactive_= 'true' where etlfunction_= 'olap_metadata' and sourcetable_ like '%esg%';


----------------------last step---------------
--epanaferoume ton pinaka sthn arxikh tou katastash

--truncate table olapts.olap_etl_control
--insert into olapts.olap_etl_control
--select * from test_backup

