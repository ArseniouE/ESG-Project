DROP VIEW IF EXISTS tenant.v_esgoverallassessment;
analyze tenant.esgoverallassessment;
create or replace view tenant.v_esgoverallassessment as
select
         --h.pkid_ as v_esgoverallassessmentid_ -- create pkid_ and rename it as viewname||id_
         h.id_ as v_esgoverallassessmentid_ -- create pkid_ and rename it as viewname||id_
		,h.pkid_::varchar as pkid_ -- pull pkid_ for transformation if this is latestversion view
        ,h.id_::varchar as esgoverallassessmentid_ -- pull the id_ from tenant table and name it as tenant.tablename||id_ 
        -- add several jsonb columns here and alphabetize them in lowercase order
		,(h.jsondoc_ ->>'AssessmentDate') AS assessmentdate
		,(h.jsondoc_ ->>'AssessmentUser') AS assessmentuser
		,(h.jsondoc_ ->>'EntityId') AS entityid		
		,(h.jsondoc_ ->>'EntityVersionId') AS entityversionid
		,(h.jsondoc_->>'EsOutcome') AS esoutcome --einai ref dato 
		,(l1.jsondoc_->>'Value') AS esoutcomeval
		,(h.jsondoc_->>'EsgObligorOutcome') AS esgobligoroutcome --einai ref dato kai auto 
		,(l2.jsondoc_->>'Value') AS esgobligoroutcomeval
		,(h.jsondoc_->>'EsgOverallOutcome') AS esgoveralloutcome
		,(h.jsondoc_->>'IsSustainable') AS issustainable --ref dato
		,(l3.jsondoc_->>'Value') AS issustainableval
		,(h.jsondoc_->>'LoanApplication') AS loanapplication
		,(h.jsondoc_->>'LoanSubApplication') AS loansubapplication
        -- add all base table context attributes you want for your view here
     	,h.wfid_::varchar
		,h.taskid_::varchar
		,h.versionid_::int4
		,h.statusid_::int4
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
		,h.fkid_entity
       -- add these 2 columns to be used for incremental transformation and incremental dataextracts --			  
       ,(CASE WHEN h.updateddate_ > h.createddate_ THEN h.updatedby_ ELSE h.createdby_ END):: varchar AS sourcepopulatedby_
	   ,GREATEST(h.createddate_, h.updateddate_):: Timestamp AS sourcepopulateddate_	
       -- add your FROM clause here - if using isvisible_, isvalid_, islatestversion_ and not isdeleted_ you can 
       --also add the word ONLY to the FROM clause --
from tenant.esgoverallassessment h
	left join tenant.custom_lookup l1 on l1.t_='EsgRiskCategorization' and l1.jsondoc_->>'Key'=h.jsondoc_ ->>'EsOutcome'
	left join tenant.custom_lookup l2 on l2.t_='EsgClassification' and l2.jsondoc_->>'Key'=h.jsondoc_ ->>'EsgObligorOutcome'
	left join tenant.custom_lookup l3 on l3.t_='EsgYesNo' and l3.jsondoc_->>'Key'=h.jsondoc_ ->>'IsSustainable'
where h.isvalid_ and h.isvisible_;
--(h.isvalid_ and h.isvisible_ and h.islatestversion_ ); 
-- note: and not h.isdeleted_ this was removed in 20.31.1


ALTER TABLE tenant.v_esgoverallassessment OWNER TO tenant;
GRANT ALL ON TABLE tenant.v_esgoverallassessment TO tenant;
GRANT SELECT ON TABLE tenant.v_esgoverallassessment TO readabrstrn;

--select * from tenant.v_esgoverallassessment
