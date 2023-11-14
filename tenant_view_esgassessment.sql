DROP VIEW IF EXISTS tenant.v_esgassessment;
analyze tenant.esgassessment;
create or replace view tenant.v_esgassessment as
select
         h.pkid_ as v_esgassessmentid_ -- create pkid_ and rename it as viewname||id_
        ,h.pkid_::varchar as pkid_ -- pull pkid_ for transformation if this is latestversion view
        ,h.id_::varchar as esgassessmentid_ -- pull the id_ from tenant table and name it as tenant.tablename||id_ 
        -- add several jsonb columns here and alphabetize them in lowercase order
		,(h.jsondoc_ ->>'ApprovalDate') AS ApprovalDate
		,(h.jsondoc_ ->>'ApprovedUser') AS ApprovedUser
		,(h.jsondoc_ ->>'AssessmentDate') AS AssessmentDate
		,(h.jsondoc_ ->>'AssessmentUser') AS AssessmentUser
		select * from tenant.esgassessment limit 10
		,(h.jsondoc_->>'AssetsRecentValue') AS AssetsRecentValue
		,(h.jsondoc_ ->>'AuthorizationFlag')::boolean AS AuthorizationFlag
		,(h.jsondoc_ ->> 'GroupNaceCode') AS CompanyNaceCode
		,(h.jsondoc_ ->> 'GroupName') AS CompanyName
		,(h.jsondoc_ ->>'CreditCommitteeDate') AS CreditCommitteeDate
		--,(h.jsondoc_ ->>'DoesAnnualTurnoverExceed50')::boolean AS DoesAnnualTurnoverExceed50
		--,(h.jsondoc_ ->>'DoesCreditLimitExceed55')::boolean AS DoesCreditLimitExceed55
		--,(h.jsondoc_ ->>'DoesExposureExceed50')::boolean AS DoesExposureExceed50
		,(h.jsondoc_ ->>'EbiodiversityScore') AS EbiodiversityScore
		,(h.jsondoc_ ->>'EclimateGoalsTargetsScore') AS EclimateGoalsTargetsScore
		,(h.jsondoc_ ->>'EemissionsScore') AS EemissionsScore
		,(h.jsondoc_ ->>'EenergyScore') AS EenergyScore
		,(h.jsondoc_ ->>'EenvironmentalComplianceScore') AS EenvironmentalComplianceScore
		,(h.jsondoc_ ->>'EevaluationApproachScore') AS EevaluationApproachScore
		,(h.jsondoc_ ->>'EmanagementApproachScore') AS EmanagementApproachScore
		,(h.jsondoc_ ->>'EmanagementSystemsScore') AS EmanagementSystemsScore
		,(h.jsondoc_ ->>'EmonitoringMechanismsScore') AS EmonitoringMechanismsScore
		,(h.jasondoc_->>'EmployeesRecentValue') AS EmployeesRecentValue
		,(h.jsondoc_ ->> 'EntityId') AS EntityId
		,(h.jsondoc_ ->> 'EntityVersionId') AS EntityVersionId
		,(h.jsondoc_ ->> 'EperformanceAssessmentScore') AS EperformanceAssessmentScore
		,(h.jsondoc_ ->> 'EphysicalRiskAssessmentScore') AS EphysicalRiskAssessmentScore
		,(h.jsondoc_ ->> 'EpoliciesScore') AS EpoliciesScore
		,(h.jsondoc_ ->> 'EsgGrade') AS EsgGrade
		,(h.jsondoc_ ->> 'EsgZonesOutcome') AS EsgZonesOutcome
		,(h.jsondoc_ ->> 'EsubGrade') AS EsubGrade
		,(h.jsondoc_ ->> 'EsubScore') AS EsubScore
	--edw leipei to esubzone pou iparxei sto CL kai sto json tis tenant.esgassessment
		,(h.jsondoc_ ->> 'EwasteScore') AS EwasteScore
		,(h.jsondoc_ ->> 'EwaterEffluentsScore') AS EwaterEffluentsScore
		,(h.jsondoc_ ->>'ExpirationDate') as ExpirationDate
		,(h.jsondoc_ ->> 'EzoneOutcome') AS EzoneOutcome
		,(h.jsondoc_ ->> 'GbusinessEthicsScore') AS GbusinessEthicsScore
		,(h.jsondoc_ ->> 'GcollectiveKnowledgeScore') AS GcollectiveKnowledgeScore
		,(h.jsondoc_ ->> 'GcompositionDiversityScore') AS GcompositionDiversityScore
		,(h.jsondoc_ ->> 'GperformanceEvaluationScore') AS GperformanceEvaluationScore
		,(h.jsondoc_ ->> 'GregulatoryComplianceScore') AS GregulatoryComplianceScore
		,(h.jsondoc_ ->> 'GremunerationScore') AS GremunerationScore
		,(h.jsondoc_ ->> 'GrolesResponsibilitiesScore') AS GrolesResponsibilitiesScore
		--,(h.jsondoc_ ->> 'GroupId') AS GroupId
		,(h.jsondoc_ ->> 'GstakeholderEngagementScore') AS GstakeholderEngagementScore		
		,(h.jsondoc_ ->> 'GstrategyRiskManagementScore') AS GstrategyRiskManagementScore
		,(h.jsondoc_ ->> 'GsubGrade') AS GsubGrade
		,(h.jsondoc_ ->> 'GsubScore') AS GsubScore
	--edw leipei to gsubzone pou iparxei kai sto CL kai sto json tis tenant.esgassessment
		,(h.jsondoc_ ->> 'GtransparencyScore') AS GtransparencyScore
		,(h.jsondoc_ ->> 'GzoneOutcome') AS GzoneOutcome
		--,(h.jsondoc_ ->> 'HaveFullBlownCriteriaBeenMet')::boolean AS HaveFullBlownCriteriaBeenMet
		,(h.jsondoc_ ->> 'IsCompanyListedInStockExchange')::boolean  AS IsCompanyListedInStockExchange	
		,(h.jsondoc_ ->> 'NextReviewDate') AS NextReviewDate
		,(h.jsondoc_ ->> 'OverrideAuthority') AS OverrideAuthority
		,(l1.jsondoc_ ->> 'Value') AS OverrideAuthorityVal 
		,(h.jsondoc_ ->> 'OverrideDriver') AS OverrideDriver --ref_Dato esgOverrideDriver auto den einai ref_dato?? fainetai keno	
		,(h.jsondoc_ ->> 'OverrideGrade') AS OverrideGrade --kai auto to deixnei san ref dato to CL
		,(h.jsondoc_ ->> 'OverrideProvider') AS OverrideProvider
		,(h.jsondoc_ ->> 'OverrideReason') AS OverrideReason --ref_Dato esgOverrideReason auto den einai ref_dato?? fainetai keno	
		
		--,(h.jsondoc->>'QuestionnaireDate') as QuestionnaireDate --iparxei kai sto json kai sto Cl
		
		--,(h.jsondoc_ ->> 'Id') AS QuestionnaireId ------auto einai to QuestionnaireId
		
		,(h.jsondoc_ ->> 'TypeQuestionnaire') AS QuestionnaireType	
		--,(h.jsondoc_->>'QuestionnaireVersion') as QuestionnaireVersion --iparxei kai sto jsondoc kai sto cl
		,(h.jsondoc_->>'RevenuesRecentValue') AS RevenuesRecentValue
		,(h.jsondoc_ ->> 'ScomplianceScore') AS ScomplianceScore
		,(h.jsondoc_ ->> 'ScustomerPrivacyScore') AS ScustomerPrivacyScore
		,(h.jsondoc_ ->> 'SevaluationApproachScore') AS SevaluationApproachScore
		,(h.jsondoc_ ->> 'SgoalsTargetsScore') AS SgoalsTargetsScore
		,(h.jsondoc_ ->> 'ShumanRightsScore') AS ShumanRightsScore
		,(h.jsondoc_ ->> 'SlaborManagementRelationsScore') AS SlaborManagementRelationsScore
		,(h.jsondoc_ ->> 'SlocalCommunitiesScore') AS SlocalCommunitiesScore
		,(h.jsondoc_ ->> 'SmanagementApproachScore') AS SmanagementApproachScore
		,(h.jsondoc_ ->> 'SmanagementSystemsScore') AS SmanagementSystemsScore
		,(h.jsondoc_ ->> 'SmonitoringMechanismsScore') AS SmonitoringMechanismsScore
		,(h.jsondoc_ ->> 'SoccupationalHealthSafetScore') AS SoccupationalHealthSafetScore
		,(h.jsondoc_ ->> 'SperformanceAssessmentScore') AS SperformanceAssessmentScore
		,(h.jsondoc_ ->> 'SpoliciesScore') AS SpoliciesScore
		,(h.jsondoc_ ->> 'SsubGrade') AS SsubGrade
		,(h.jsondoc_ ->> 'SsubScore') AS SsubScore
	--leipei to Ssubzone pou iparxei kai CL kai json 
		,(h.jsondoc_ ->> 'StrainingEducationScore') AS StrainingEducationScore
		,(h.jsondoc_ ->> 'SzoneOutcome') AS SzoneOutcome
		,(h.jsondoc_ ->> 'TotalEsgScore') AS TotalEsgScore
		
		
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
		,h.fkid_entity
		 -- add these 2 columns to be used for incremental transformation and incremental dataextracts --
		,(CASE WHEN h.updateddate_ > h.createddate_ THEN h.updatedby_ ELSE h.createdby_ END)::varchar AS sourcepopulatedby_,
		,GREATEST(h.createddate_, h.updateddate_)::Timestamp AS sourcepopulateddate_
	 FROM tenant.esgassessment h
		left join tenant.custom_lookup l1 on l1.t_ = 'OverrideAuthority' and l1.jsondoc_->>'Key'  = h.jsondoc_ ->> 'OverrideAuthority'
	where h.isvalid_ and h.isvisible_
	--(h.isvalid_ and h.isvisible_ and h.islatestversion_ ); 
	-- note: and not h.isdeleted_ this was removed in 20.31.1
	-------


--select * from tenant.v_esgquestion

ALTER TABLE tenant.v_esgassessment OWNER TO tenant;
GRANT ALL ON TABLE tenant.v_esgassessment TO tenant;
GRANT SELECT ON TABLE tenant.v_esgassessment TO readabrstrn;
