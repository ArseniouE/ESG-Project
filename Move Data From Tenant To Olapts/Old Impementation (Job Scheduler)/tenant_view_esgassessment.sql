DROP VIEW IF EXISTS tenant.v_esgassessment;
analyze tenant.esgassessment;
create or replace view tenant.v_esgassessment as
select
       --  h.pkid_ as v_esgassessmentid_
	     h.id_ as v_esgassessmentid_
        ,h.pkid_::varchar as pkid_ 
        ,h.id_::varchar as esgassessmentid_ 
		,(h.jsondoc_ ->>'ApprovalDate') AS approvaldate
		,(h.jsondoc_ ->>'ApprovalUser') AS approvaluser
		,(h.jsondoc_ ->>'AssessmentDate') AS assessmentdate
		,(h.jsondoc_ ->>'AssessmentUser') AS assessmentuser
		,(h.jsondoc_->>'AssetsRecentValue') AS assetsrecentvalue
		,(h.jsondoc_ ->>'AuthorizationFlag')::boolean AS authorizationflag
		,(h.jsondoc_ ->> 'CompanyNaceCode') AS companynacecode
		,(h.jsondoc_ ->> 'CompanyName') AS companyname
		,(h.jsondoc_ ->>'CreditCommitteeDate') AS creditcommitteedate
		--,(h.jsondoc_ ->>'DoesAnnualTurnoverExceed50')::boolean AS DoesAnnualTurnoverExceed50
		--,(h.jsondoc_ ->>'DoesCreditLimitExceed55')::boolean AS DoesCreditLimitExceed55
		--,(h.jsondoc_ ->>'DoesExposureExceed50')::boolean AS DoesExposureExceed50
		,(h.jsondoc_ ->>'EbiodiversityScore') AS ebiodiversityscore
		,(h.jsondoc_ ->>'EclimateGoalsTargetsScore') AS eclimategoalstargetsscore
		,(h.jsondoc_ ->>'EemissionsScore') AS eemissionsscore
		,(h.jsondoc_ ->>'EenergyScore') AS eenergyscore
		,(h.jsondoc_ ->>'EenvironmentalComplianceScore') AS eenvironmentalcompliancescore
		,(h.jsondoc_ ->>'EevaluationApproachScore') AS eevaluationapproachscore
		,(h.jsondoc_ ->>'EmanagementApproachScore') AS emanagementapproachscore
		,(h.jsondoc_ ->>'EmanagementSystemsScore') AS emanagementsystemsscore
		,(h.jsondoc_ ->>'EmonitoringMechanismsScore') AS emonitoringmechanismsscore
		,(h.jsondoc_->>'EmployeesRecentValue') AS employeesrecentvalue
		,(h.jsondoc_ ->> 'EntityId') AS entityid
		,(h.jsondoc_ ->> 'EntityVersionId') AS entityversionid
		,(h.jsondoc_ ->> 'EperformanceAssessmentScore') AS eperformanceassessmentscore
		,(h.jsondoc_ ->> 'EphysicalRiskAssessmentScore') AS ephysicalriskassessmentscore
		,(h.jsondoc_ ->> 'EpoliciesScore') AS epoliciesscore
		,(h.jsondoc_ ->> 'EsgGrade') AS esggrade
		,(h.jsondoc_ ->> 'EsgZonesOutcome') AS esgzonesoutcome
		,(h.jsondoc_ ->> 'EsubGrade') AS esubgrade
		,(h.jsondoc_ ->> 'EsubScore') AS esubscore
		,(h.jsondoc_->>'EsubZone') AS esubzone
		,(h.jsondoc_ ->> 'EwasteScore') AS ewastescore
		,(h.jsondoc_ ->> 'EwaterEffluentsScore') AS ewatereffluentsscore
		,(h.jsondoc_ ->>'ExpirationDate') as expirationdate
		,(h.jsondoc_ ->> 'EzoneOutcome') AS ezoneoutcome
		,(h.jsondoc_ ->> 'GbusinessEthicsScore') AS gbusinessethicsscore
		,(h.jsondoc_ ->> 'GcollectiveKnowledgeScore') AS gcollectiveknowledgescore
		,(h.jsondoc_ ->> 'GcompositionDiversityScore') AS gcompositiondiversityscore
		,(h.jsondoc_ ->> 'GperformanceEvaluationScore') AS gperformanceevaluationscore
		,(h.jsondoc_ ->> 'GregulatoryComplianceScore') AS gregulatorycompliancescore
		,(h.jsondoc_ ->> 'GremunerationScore') AS gremunerationscore
		,(h.jsondoc_ ->> 'GrolesResponsibilitiesScore') AS grolesresponsibilitiesscore
		--,(h.jsondoc_ ->> 'GroupId') AS GroupId
		,(h.jsondoc_ ->> 'GstakeholderEngagementScore') AS gstakeholderengagementscore		
		,(h.jsondoc_ ->> 'GstrategyRiskManagementScore') AS gstrategyriskmanagementscore
		,(h.jsondoc_ ->> 'GsubGrade') AS gsubgrade
		,(h.jsondoc_ ->> 'GsubScore') AS gsubscore
		,(h.jsondoc_->>'GsubZone') AS gsubzone
		,(h.jsondoc_ ->> 'GtransparencyScore') AS gtransparencyscore
		,(h.jsondoc_ ->> 'GzoneOutcome') AS gzoneoutcome
		--,(h.jsondoc_ ->> 'HaveFullBlownCriteriaBeenMet')::boolean AS HaveFullBlownCriteriaBeenMet
		,(h.jsondoc_ ->> 'IsCompanyListedInStockExchange')::boolean  AS iscompanylistedinstockexchange	
		,(h.jsondoc_ ->> 'NextReviewDate') AS nextreviewdate
		,(h.jsondoc_ ->> 'OverrideAuthority') AS overrideauthority --ref dato
		,(l1.jsondoc_ ->> 'Value') AS overrideauthorityval 
		,(h.jsondoc_ ->> 'OverrideDriver') AS overridedriver --ref_Dato esgOverrideDriver auto den einai ref_dato?? fainetai keno	
		,(h.jsondoc_ ->> 'OverrideGrade') AS overridegrade 
		,(l2.jsondoc_ ->> 'Value') AS overridegradeval 
		,(h.jsondoc_ ->> 'OverrideProvider') AS overrideprovider
		,(h.jsondoc_ ->> 'OverrideReason') AS overridereason --ref_Dato esgOverrideReason auto den einai ref_dato?? fainetai keno	
		,(h.jsondoc_->>'QuestionnaireDate') as questionnairedate 
		,(h.jsondoc_ ->> 'QuestionnaireId') AS questionnaireid 
		,(h.jsondoc_ ->> 'QuestionnaireType') AS questionnairetype	
		,(h.jsondoc_->>'QuestionnaireVersion') as questionnaireversion
	        ,(h.jsondoc_->>'RatingFrom') AS ratingfrom
		,(h.jsondoc_->>'RevenuesRecentValue') AS revenuesrecentvalue
		,(h.jsondoc_ ->> 'ScomplianceScore') AS scompliancescore
		,(h.jsondoc_ ->> 'ScustomerPrivacyScore') AS scustomerprivacyscore
		,(h.jsondoc_ ->> 'SevaluationApproachScore') AS sevaluationapproachscore
		,(h.jsondoc_ ->> 'SgoalsTargetsScore') AS sgoalstargetsscore
		,(h.jsondoc_ ->> 'ShumanRightsScore') AS shumanrightsscore
		,(h.jsondoc_ ->> 'SlaborManagementRelationsScore') AS slabormanagementrelationsscore
		,(h.jsondoc_ ->> 'SlocalCommunitiesScore') AS slocalcommunitiesscore
		,(h.jsondoc_ ->> 'SmanagementApproachScore') AS smanagementapproachscore
		,(h.jsondoc_ ->> 'SmanagementSystemsScore') AS smanagementsystemsscore
		,(h.jsondoc_ ->> 'SmonitoringMechanismsScore') AS smonitoringmechanismsscore
		,(h.jsondoc_ ->> 'SoccupationalHealthSafetScore') AS soccupationalhealthsafetscore
		,(h.jsondoc_ ->> 'SperformanceAssessmentScore') AS sperformanceassessmentscore
		,(h.jsondoc_ ->> 'SpoliciesScore') AS spoliciesscore
		,(h.jsondoc_ ->> 'SsubGrade') AS ssubgrade
		,(h.jsondoc_ ->> 'SsubScore') AS ssubscore
		,(h.jsondoc_->>'SsubZone') AS ssubzone
		,(h.jsondoc_ ->> 'StrainingEducationScore') AS strainingeducationscore
		,(h.jsondoc_ ->> 'SzoneOutcome') AS szoneoutcome
		,(h.jsondoc_ ->> 'TotalEsgScore') AS totalesgscore
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
		,(CASE WHEN h.updateddate_ > h.createddate_ THEN h.updatedby_ ELSE h.createdby_ END)::varchar AS sourcepopulatedby_
		,GREATEST(h.createddate_, h.updateddate_)::Timestamp AS sourcepopulateddate_
	 FROM tenant.esgassessment h
		left join tenant.custom_lookup l1 on l1.t_ = 'OverrideAuthority' and l1.jsondoc_->>'Key'  = h.jsondoc_ ->> 'OverrideAuthority'
		left join tenant.custom_lookup l2 on l2.t_ = 'EsgOverrideGrade' and l2.jsondoc_->>'Key'  = h.jsondoc_ ->> 'OverrideGrade'
	where h.isvalid_ and h.isvisible_;
	--(h.isvalid_ and h.isvisible_ and h.islatestversion_ ); 





--select * from tenant.v_esgassessment order by v_esgassessmentid_ h where h.isvalid_ and h.isvisible_;

ALTER TABLE tenant.v_esgassessment OWNER TO tenant;
GRANT ALL ON TABLE tenant.v_esgassessment TO tenant;
GRANT SELECT ON TABLE tenant.v_esgassessment TO readabrstrn;
