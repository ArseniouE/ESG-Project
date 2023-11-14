DROP VIEW IF EXISTS tenant.v_esgquestion;
analyze tenant.esgquestion;
create or replace view tenant.v_esgquestion as
select
         h.pkid_ as v_esgquestionid_ -- create pkid_ and rename it as viewname||id_
        ,h.pkid_::varchar as pkid_ -- pull pkid_ for transformation if this is latestversion view
        ,h.id_::varchar as esgquestionid_ -- pull the id_ from tenant table and name it as tenant.tablename||id_ 
        -- add several jsonb columns here and alphabetize them in lowercase order
		,(h.jsondoc_ ->>'Choice')::boolean AS choice
		,(h.jsondoc_ ->>'Comments') AS comments
		,(h.jsondoc_ ->>'EsgMasterId') AS esgmasterid
		,(h.jsondoc_ ->>'Factor') AS factor		
		,(h.jsondoc_ ->>'Pillar')::boolean AS pillar
		,(h.jsondoc_ ->>'QuestionDescr') AS questiondescr
		,(h.jsondoc_ ->>'QuestionId') AS questionid
		,(h.jsondoc_ ->>'QuestionnaireVersion') AS questionnaireversion
		,(h.jsondoc_ ->>'SubFactor') AS subfactor
		,(h.jsondoc_ ->>'Value') AS value
		,(h.jsondoc_ ->>'Year') AS year		
        -- add all base table context attributes you want for your view here
     	,h.wfid_::varchar
		,h.taskid_::varchar
		,h.versionid_::int4
		,h.isdeleted_::boolean
		,h.islatestversion_::boolean
		,h.baseversionid_::int4
		,h.contextuserid_::varchar
		,h.isvisible_::boolean
		,h.isvalid_::boolean
		,h.snapshotid_::int4
		,h.t_::varchar
		,h.createdby_::varchar
		,h.createddate_::timestamp
		,h.updatedby_::varchar
		,h.updateddate_::timestamp
		,h.fkid_esgmaster
		,h.fkid_esgassessment
       -- add these 2 columns to be used for incremental transformation and incremental dataextracts --			  
       ,(CASE WHEN h.updateddate_ > h.createddate_ THEN h.updatedby_ ELSE h.createdby_ END):: varchar AS sourcepopulatedby_
	   ,GREATEST(h.createddate_, h.updateddate_):: Timestamp AS sourcepopulateddate_	
       -- add your FROM clause here - if using isvisible_, isvalid_, islatestversion_ and not isdeleted_ you can 
       --also add the word ONLY to the FROM clause --
from tenant.esgquestion h
where h.isvalid_ and h.isvisible_
--(h.isvalid_ and h.isvisible_ and h.islatestversion_ ); 
-- note: and not h.isdeleted_ this was removed in 20.31.1

--select * from tenant.v_esgquestion

ALTER TABLE tenant.v_esgquestion OWNER TO tenant;
GRANT ALL ON TABLE tenant.v_esgquestion TO tenant;
GRANT SELECT ON TABLE tenant.v_esgquestion TO readabrstrn;
