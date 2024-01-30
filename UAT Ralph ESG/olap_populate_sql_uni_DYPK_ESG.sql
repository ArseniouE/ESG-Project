--------------------------------------------------------------
--       RUN Script in olap database with olap user
--------------------------------------------------------------

-- Increase work memory and effective cache for complex operations/sorts
set work_mem = '10 GB';
set maintenance_work_mem = '10 GB';
set effective_cache_size = '48 GB';
set effective_io_concurrency = 300;

--suggest planner to disregard sequential scanning and enable partitionwise aggregates
set random_page_cost = 1.5;
set enable_partitionwise_join = on;
set enable_partitionwise_aggregate = on;
set force_parallel_mode = on;
set parallel_setup_cost = 10;
set parallel_tuple_cost = 0.001;

-- Increase workers to reach multiparallel processing
--set max_worker_processes = 32;
set max_parallel_workers_per_gather = 16;
set max_parallel_maintenance_workers = 10;
set max_parallel_workers = 32;
set parallel_leader_participation = on;
set default_statistics_target = 500;

--JIT
set jit = on;
set jit_above_cost = 100000;
set jit_optimize_above_cost = 500000;
set jit_inline_above_cost = 500000;

SET TIMEZONE = 'UTC';
SET SESSION myvariables.popdate = NOW;

DO $$
DECLARE
varprevsuccessdate TIMESTAMP ;
BEGIN

CREATE TABLE IF NOT EXISTS olapts.refreshhistory (
       tablename VARCHAR,
       asofdate TIMESTAMP WITHOUT TIME ZONE DEFAULT (now() at time zone 'utc'),
       prevsuccessdate TIMESTAMP WITHOUT TIME ZONE DEFAULT (now() at time zone 'utc')
);

END $$;

DO $$
DECLARE
varprevsuccessdate TIMESTAMP ;

BEGIN

---------------------------------------------- AbEsgAssessment ----------------------------------------------

-- If table exists in refresh history --
IF EXISTS (select from olapts.refreshhistory where tablename = 'abesgassessment') THEN
raise notice '% - Step abesgassessment - part a start', clock_timestamp();
insert into olapts.abesgassessment
	select esgassessment.id_ AS id_,
           esgassessment.pkid_,
           esgassessment.id_ AS esgassessmentid_,
           esgassessment.jsondoc_ ->> 'ApprovalDate'::text AS approvaldate,
           esgassessment.jsondoc_ ->> 'ApprovalUser'::text AS approvaluser,
           esgassessment.jsondoc_ ->> 'AssessmentDate'::text AS assessmentdate,
           esgassessment.jsondoc_ ->> 'AssessmentUser'::text AS assessmentuser,
           esgassessment.jsondoc_ ->> 'AssetsRecentValue'::text AS assetsrecentvalue,
          (esgassessment.jsondoc_ ->> 'AuthorizationFlag'::text)::boolean AS authorizationflag,
           esgassessment.jsondoc_ ->> 'CompanyNaceCode'::text AS companynacecode,
           esgassessment.jsondoc_ ->> 'CompanyName'::text AS companyname,
           esgassessment.jsondoc_ ->> 'CreditCommitteeDate'::text AS creditcommitteedate,
           esgassessment.jsondoc_ ->> 'EbiodiversityScore'::text AS ebiodiversityscore,
           esgassessment.jsondoc_ ->> 'EclimateGoalsTargetsScore'::text AS eclimategoalstargetsscore,
           esgassessment.jsondoc_ ->> 'EemissionsScore'::text AS eemissionsscore,
           esgassessment.jsondoc_ ->> 'EenergyScore'::text AS eenergyscore,
           esgassessment.jsondoc_ ->> 'EenvironmentalComplianceScore'::text AS eenvironmentalcompliancescore,
           esgassessment.jsondoc_ ->> 'EevaluationApproachScore'::text AS eevaluationapproachscore,
           esgassessment.jsondoc_ ->> 'EmanagementApproachScore'::text AS emanagementapproachscore,
           esgassessment.jsondoc_ ->> 'EmanagementSystemsScore'::text AS emanagementsystemsscore,
           esgassessment.jsondoc_ ->> 'EmaterialsScore'::text AS ematerialsscore,
           esgassessment.jsondoc_ ->> 'EmonitoringMechanismsScore'::text AS emonitoringmechanismsscore,
           esgassessment.jsondoc_ ->> 'EmployeesRecentValue'::text AS employeesrecentvalue,
           esgassessment.jsondoc_ ->> 'EntityId'::text AS entityid,
           esgassessment.jsondoc_ ->> 'EntityVersionId'::text AS entityversionid,
           esgassessment.jsondoc_ ->> 'EopportunitiesCleanTechScore'::text AS eopportunitiescleantechscore,
           esgassessment.jsondoc_ ->> 'EperformanceAssessmentScore'::text AS eperformanceassessmentscore,
           esgassessment.jsondoc_ ->> 'EphysicalRiskAssessmentScore'::text AS ephysicalriskassessmentscore,
           esgassessment.jsondoc_ ->> 'EpoliciesScore'::text AS epoliciesscore,
           esgassessment.jsondoc_ ->> 'EsgGrade'::text AS esggrade,
           esgassessment.jsondoc_ ->> 'EsgZonesOutcome'::text AS esgzonesoutcome,
           esgassessment.jsondoc_ ->> 'EsubGrade'::text AS esubgrade,
           esgassessment.jsondoc_ ->> 'EsubScore'::text AS esubscore,
           esgassessment.jsondoc_ ->> 'EsubZone'::text AS esubzone,
           esgassessment.jsondoc_ ->> 'EwasteScore'::text AS ewastescore,
           esgassessment.jsondoc_ ->> 'EwaterEffluentsScore'::text AS ewatereffluentsscore,
           esgassessment.jsondoc_ ->> 'ExpirationDate'::text AS expirationdate,
           esgassessment.jsondoc_ ->> 'GbusinessEthicsScore'::text AS gbusinessethicsscore,
           esgassessment.jsondoc_ ->> 'GcollectiveKnowledgeScore'::text AS gcollectiveknowledgescore,
           esgassessment.jsondoc_ ->> 'GcompositionDiversityScore'::text AS gcompositiondiversityscore,
           esgassessment.jsondoc_ ->> 'GperformanceEvaluationScore'::text AS gperformanceevaluationscore,
           esgassessment.jsondoc_ ->> 'GregulatoryComplianceScore'::text AS gregulatorycompliancescore,
           esgassessment.jsondoc_ ->> 'GremunerationScore'::text AS gremunerationscore,
           esgassessment.jsondoc_ ->> 'GrolesResponsibilitiesScore'::text AS grolesresponsibilitiesscore,
           esgassessment.jsondoc_ ->> 'GstakeholderEngagementScore'::text AS gstakeholderengagementscore,
           esgassessment.jsondoc_ ->> 'GstrategyRiskManagementScore'::text AS gstrategyriskmanagementscore,
           esgassessment.jsondoc_ ->> 'GsubGrade'::text AS gsubgrade,
           esgassessment.jsondoc_ ->> 'GsubScore'::text AS gsubscore,
           esgassessment.jsondoc_ ->> 'Gsubzone'::text AS gsubzone,
           esgassessment.jsondoc_ ->> 'GtransparencyScore'::text AS gtransparencyscore,
          (esgassessment.jsondoc_ ->> 'IsCompanyListedInStockExchange'::text)::boolean AS iscompanylistedinstockexchange,
           esgassessment.jsondoc_ ->> 'IsLatestApprovedAssessment'::text AS islatestapprovedassessment,
           esgassessment.jsondoc_ ->> 'NextReviewDate'::text AS nextreviewdate,
           esgassessment.jsondoc_ ->> 'OverrideAuthority'::text AS overrideauthority,
           l1.jsondoc_ ->> 'Value'::text AS overrideauthorityval,
           esgassessment.jsondoc_ ->> 'OverrideDriver'::text AS overridedriver,
           esgassessment.jsondoc_ ->> 'OverrideGrade'::text AS overridegrade,
           l2.jsondoc_ ->> 'Value'::text AS overridegradeval,
           esgassessment.jsondoc_ ->> 'OverrideProvider'::text AS overrideprovider,
           esgassessment.jsondoc_ ->> 'OverrideReason'::text AS overridereason,
           esgassessment.jsondoc_ ->> 'QuestionnaireDate'::text AS questionnairedate,
           esgassessment.jsondoc_ ->> 'QuestionnaireId'::text AS questionnaireid,
           esgassessment.jsondoc_ ->> 'QuestionnaireType'::text AS questionnairetype,
           esgassessment.jsondoc_ ->> 'QuestionnaireVersion'::text AS questionnaireversion,
           esgassessment.jsondoc_ ->> 'RatingFrom'::text AS ratingfrom,
           esgassessment.jsondoc_ ->> 'RevenuesRecentValue'::text AS revenuesrecentvalue,
           esgassessment.jsondoc_ ->> 'ScomplianceScore'::text AS scompliancescore,
           esgassessment.jsondoc_ ->> 'ScustomerHealthSafetyScore'::text AS scustomerhealthsafetyscore,
           esgassessment.jsondoc_ ->> 'ScustomerPrivacyScore'::text AS scustomerprivacyscore,
           esgassessment.jsondoc_ ->> 'SevaluationApproachScore'::text AS sevaluationapproachscore,
           esgassessment.jsondoc_ ->> 'SgoalsTargetsScore'::text AS sgoalstargetsscore,
           esgassessment.jsondoc_ ->> 'ShumanRightsScore'::text AS shumanrightsscore,
           esgassessment.jsondoc_ ->> 'SlaborManagementRelationsScore'::text AS slabormanagementrelationsscore,
           esgassessment.jsondoc_ ->> 'SlocalCommunitiesScore'::text AS slocalcommunitiesscore,
           esgassessment.jsondoc_ ->> 'SmanagementApproachScore'::text AS smanagementapproachscore,
           esgassessment.jsondoc_ ->> 'SmanagementSystemsScore'::text AS smanagementsystemsscore,
           esgassessment.jsondoc_ ->> 'SmonitoringMechanismsScore'::text AS smonitoringmechanismsscore,
           esgassessment.jsondoc_ ->> 'SoccupationalHealthSafetScore'::text AS soccupationalhealthsafetscore,
           esgassessment.jsondoc_ ->> 'SperformanceAssessmentScore'::text AS sperformanceassessmentscore,
           esgassessment.jsondoc_ ->> 'SpoliciesScore'::text AS spoliciesscore,
           esgassessment.jsondoc_ ->> 'SsubGrade'::text AS ssubgrade,
           esgassessment.jsondoc_ ->> 'SsubScore'::text AS ssubscore,
           esgassessment.jsondoc_ ->> 'SsubZone'::text AS ssubzone,
           esgassessment.jsondoc_ ->> 'StrainingEducationScore'::text AS strainingeducationscore,
           esgassessment.jsondoc_ ->> 'TotalEsgScore'::text AS totalesgscore,
           esgassessment.wfid_,
           esgassessment.taskid_,
           esgassessment.versionid_,
           esgassessment.isdeleted_,
           esgassessment.islatestversion_,
           esgassessment.baseversionid_,
           esgassessment.contextuserid_,
           esgassessment.isvisible_,
           esgassessment.isvalid_,
           esgassessment.snapshotid_,
           esgassessment.t_,
           esgassessment.createdby_,
           esgassessment.createddate_,
           esgassessment.updatedby_,
           esgassessment.updateddate_,
           esgassessment.fkid_entity,
           CASE WHEN esgassessment.updateddate_ > esgassessment.createddate_ THEN esgassessment.updatedby_ ELSE esgassessment.createdby_ END AS sourcepopulatedby_,
           GREATEST(esgassessment.createddate_, esgassessment.updateddate_) AS sourcepopulateddate_,
	       current_setting('myvariables.popdate')::timestamp as populateddate_
	FROM madata.esgassessment
	left join madata.custom_lookup l1 on l1.t_ = 'OverrideAuthority' and l1.jsondoc_->>'Key'  = esgassessment.jsondoc_ ->> 'OverrideAuthority'
	left join madata.custom_lookup l2 on l2.t_ = 'EsgOverrideGrade' and l2.jsondoc_ ->> 'Key' = esgassessment.jsondoc_ ->> 'OverrideGrade'
	WHERE
		 GREATEST(esgassessment.updateddate_, esgassessment.createddate_) > (select COALESCE(max(asofdate), to_timestamp(0)) from olapts.refreshhistory where tablename = 'abesgassessment')
		 AND GREATEST(esgassessment.updateddate_, esgassessment.createddate_)::timestamp <= current_setting('myvariables.popdate')::timestamp
		 AND esgassessment.t_ = 'EsgAssessment'
;
raise notice '% - Step abesgassessment - part a end', clock_timestamp();

-- If table doesn't exist in refresh history --
ELSE
raise notice '% Step abesgassessment - part b start', clock_timestamp();
	DROP TABLE IF EXISTS olapts.abesgassessment;
	CREATE TABLE olapts.abesgassessment AS
	select esgassessment.id_ AS id_,
           esgassessment.pkid_,
           esgassessment.id_ AS esgassessmentid_,
           esgassessment.jsondoc_ ->> 'ApprovalDate'::text AS approvaldate,
           esgassessment.jsondoc_ ->> 'ApprovalUser'::text AS approvaluser,
           esgassessment.jsondoc_ ->> 'AssessmentDate'::text AS assessmentdate,
           esgassessment.jsondoc_ ->> 'AssessmentUser'::text AS assessmentuser,
           esgassessment.jsondoc_ ->> 'AssetsRecentValue'::text AS assetsrecentvalue,
          (esgassessment.jsondoc_ ->> 'AuthorizationFlag'::text)::boolean AS authorizationflag,
           esgassessment.jsondoc_ ->> 'CompanyNaceCode'::text AS companynacecode,
           esgassessment.jsondoc_ ->> 'CompanyName'::text AS companyname,
           esgassessment.jsondoc_ ->> 'CreditCommitteeDate'::text AS creditcommitteedate,
           esgassessment.jsondoc_ ->> 'EbiodiversityScore'::text AS ebiodiversityscore,
           esgassessment.jsondoc_ ->> 'EclimateGoalsTargetsScore'::text AS eclimategoalstargetsscore,
           esgassessment.jsondoc_ ->> 'EemissionsScore'::text AS eemissionsscore,
           esgassessment.jsondoc_ ->> 'EenergyScore'::text AS eenergyscore,
           esgassessment.jsondoc_ ->> 'EenvironmentalComplianceScore'::text AS eenvironmentalcompliancescore,
           esgassessment.jsondoc_ ->> 'EevaluationApproachScore'::text AS eevaluationapproachscore,
           esgassessment.jsondoc_ ->> 'EmanagementApproachScore'::text AS emanagementapproachscore,
           esgassessment.jsondoc_ ->> 'EmanagementSystemsScore'::text AS emanagementsystemsscore,
           esgassessment.jsondoc_ ->> 'EmaterialsScore'::text AS ematerialsscore,
           esgassessment.jsondoc_ ->> 'EmonitoringMechanismsScore'::text AS emonitoringmechanismsscore,
           esgassessment.jsondoc_ ->> 'EmployeesRecentValue'::text AS employeesrecentvalue,
           esgassessment.jsondoc_ ->> 'EntityId'::text AS entityid,
           esgassessment.jsondoc_ ->> 'EntityVersionId'::text AS entityversionid,
           esgassessment.jsondoc_ ->> 'EopportunitiesCleanTechScore'::text AS eopportunitiescleantechscore,
           esgassessment.jsondoc_ ->> 'EperformanceAssessmentScore'::text AS eperformanceassessmentscore,
           esgassessment.jsondoc_ ->> 'EphysicalRiskAssessmentScore'::text AS ephysicalriskassessmentscore,
           esgassessment.jsondoc_ ->> 'EpoliciesScore'::text AS epoliciesscore,
           esgassessment.jsondoc_ ->> 'EsgGrade'::text AS esggrade,
           esgassessment.jsondoc_ ->> 'EsgZonesOutcome'::text AS esgzonesoutcome,
           esgassessment.jsondoc_ ->> 'EsubGrade'::text AS esubgrade,
           esgassessment.jsondoc_ ->> 'EsubScore'::text AS esubscore,
           esgassessment.jsondoc_ ->> 'EsubZone'::text AS esubzone,
           esgassessment.jsondoc_ ->> 'EwasteScore'::text AS ewastescore,
           esgassessment.jsondoc_ ->> 'EwaterEffluentsScore'::text AS ewatereffluentsscore,
           esgassessment.jsondoc_ ->> 'ExpirationDate'::text AS expirationdate,
           esgassessment.jsondoc_ ->> 'GbusinessEthicsScore'::text AS gbusinessethicsscore,
           esgassessment.jsondoc_ ->> 'GcollectiveKnowledgeScore'::text AS gcollectiveknowledgescore,
           esgassessment.jsondoc_ ->> 'GcompositionDiversityScore'::text AS gcompositiondiversityscore,
           esgassessment.jsondoc_ ->> 'GperformanceEvaluationScore'::text AS gperformanceevaluationscore,
           esgassessment.jsondoc_ ->> 'GregulatoryComplianceScore'::text AS gregulatorycompliancescore,
           esgassessment.jsondoc_ ->> 'GremunerationScore'::text AS gremunerationscore,
           esgassessment.jsondoc_ ->> 'GrolesResponsibilitiesScore'::text AS grolesresponsibilitiesscore,
           esgassessment.jsondoc_ ->> 'GstakeholderEngagementScore'::text AS gstakeholderengagementscore,
           esgassessment.jsondoc_ ->> 'GstrategyRiskManagementScore'::text AS gstrategyriskmanagementscore,
           esgassessment.jsondoc_ ->> 'GsubGrade'::text AS gsubgrade,
           esgassessment.jsondoc_ ->> 'GsubScore'::text AS gsubscore,
           esgassessment.jsondoc_ ->> 'Gsubzone'::text AS gsubzone,
           esgassessment.jsondoc_ ->> 'GtransparencyScore'::text AS gtransparencyscore,
          (esgassessment.jsondoc_ ->> 'IsCompanyListedInStockExchange'::text)::boolean AS iscompanylistedinstockexchange,
           esgassessment.jsondoc_ ->> 'IsLatestApprovedAssessment'::text AS islatestapprovedassessment,
           esgassessment.jsondoc_ ->> 'NextReviewDate'::text AS nextreviewdate,
           esgassessment.jsondoc_ ->> 'OverrideAuthority'::text AS overrideauthority,
           l1.jsondoc_ ->> 'Value'::text AS overrideauthorityval,
           esgassessment.jsondoc_ ->> 'OverrideDriver'::text AS overridedriver,
           esgassessment.jsondoc_ ->> 'OverrideGrade'::text AS overridegrade,
           l2.jsondoc_ ->> 'Value'::text AS overridegradeval,
           esgassessment.jsondoc_ ->> 'OverrideProvider'::text AS overrideprovider,
           esgassessment.jsondoc_ ->> 'OverrideReason'::text AS overridereason,
           esgassessment.jsondoc_ ->> 'QuestionnaireDate'::text AS questionnairedate,
           esgassessment.jsondoc_ ->> 'QuestionnaireId'::text AS questionnaireid,
           esgassessment.jsondoc_ ->> 'QuestionnaireType'::text AS questionnairetype,
           esgassessment.jsondoc_ ->> 'QuestionnaireVersion'::text AS questionnaireversion,
           esgassessment.jsondoc_ ->> 'RatingFrom'::text AS ratingfrom,
           esgassessment.jsondoc_ ->> 'RevenuesRecentValue'::text AS revenuesrecentvalue,
           esgassessment.jsondoc_ ->> 'ScomplianceScore'::text AS scompliancescore,
           esgassessment.jsondoc_ ->> 'ScustomerHealthSafetyScore'::text AS scustomerhealthsafetyscore,
           esgassessment.jsondoc_ ->> 'ScustomerPrivacyScore'::text AS scustomerprivacyscore,
           esgassessment.jsondoc_ ->> 'SevaluationApproachScore'::text AS sevaluationapproachscore,
           esgassessment.jsondoc_ ->> 'SgoalsTargetsScore'::text AS sgoalstargetsscore,
           esgassessment.jsondoc_ ->> 'ShumanRightsScore'::text AS shumanrightsscore,
           esgassessment.jsondoc_ ->> 'SlaborManagementRelationsScore'::text AS slabormanagementrelationsscore,
           esgassessment.jsondoc_ ->> 'SlocalCommunitiesScore'::text AS slocalcommunitiesscore,
           esgassessment.jsondoc_ ->> 'SmanagementApproachScore'::text AS smanagementapproachscore,
           esgassessment.jsondoc_ ->> 'SmanagementSystemsScore'::text AS smanagementsystemsscore,
           esgassessment.jsondoc_ ->> 'SmonitoringMechanismsScore'::text AS smonitoringmechanismsscore,
           esgassessment.jsondoc_ ->> 'SoccupationalHealthSafetScore'::text AS soccupationalhealthsafetscore,
           esgassessment.jsondoc_ ->> 'SperformanceAssessmentScore'::text AS sperformanceassessmentscore,
           esgassessment.jsondoc_ ->> 'SpoliciesScore'::text AS spoliciesscore,
           esgassessment.jsondoc_ ->> 'SsubGrade'::text AS ssubgrade,
           esgassessment.jsondoc_ ->> 'SsubScore'::text AS ssubscore,
           esgassessment.jsondoc_ ->> 'SsubZone'::text AS ssubzone,
           esgassessment.jsondoc_ ->> 'StrainingEducationScore'::text AS strainingeducationscore,
           esgassessment.jsondoc_ ->> 'TotalEsgScore'::text AS totalesgscore,
           esgassessment.wfid_,
           esgassessment.taskid_,
           esgassessment.versionid_,
           esgassessment.isdeleted_,
           esgassessment.islatestversion_,
           esgassessment.baseversionid_,
           esgassessment.contextuserid_,
           esgassessment.isvisible_,
           esgassessment.isvalid_,
           esgassessment.snapshotid_,
           esgassessment.t_,
           esgassessment.createdby_,
           esgassessment.createddate_,
           esgassessment.updatedby_,
           esgassessment.updateddate_,
           esgassessment.fkid_entity,
           CASE WHEN esgassessment.updateddate_ > esgassessment.createddate_ THEN esgassessment.updatedby_ ELSE esgassessment.createdby_ END AS sourcepopulatedby_,
           GREATEST(esgassessment.createddate_, esgassessment.updateddate_) AS sourcepopulateddate_,
	       current_setting('myvariables.popdate')::timestamp as populateddate_
	FROM madata.esgassessment
	left join madata.custom_lookup l1 on l1.t_ = 'OverrideAuthority' and l1.jsondoc_->>'Key'  = esgassessment.jsondoc_ ->> 'OverrideAuthority'
	left join madata.custom_lookup l2 on l2.t_ = 'EsgOverrideGrade' and l2.jsondoc_ ->> 'Key' = esgassessment.jsondoc_ ->> 'OverrideGrade'
	WHERE
		 GREATEST(esgassessment.updateddate_, esgassessment.createddate_) > (select COALESCE(max(asofdate), to_timestamp(0)) from olapts.refreshhistory where tablename = 'abesgassessment')
		 AND GREATEST(esgassessment.updateddate_, esgassessment.createddate_)::timestamp <= current_setting('myvariables.popdate')::timestamp
		 AND esgassessment.t_ = 'EsgAssessment'
;
raise notice '% - Step abesgassessment - part b end', clock_timestamp();

--AbEsgAssessment Indexes--
raise notice '% - Step abesgassessment_idx - part a start', clock_timestamp(); 
DROP INDEX if exists olapts.abesgassessment_idx;
DROP INDEX if exists olapts.abesgassessment_idx2;
CREATE INDEX IF NOT EXISTS abesgassessment_idx ON olapts.abesgassessment (id_);
CREATE INDEX IF NOT EXISTS abesgassessment_idx2 ON olapts.abesgassessment (pkid_,versionid_);
REINDEX TABLE olapts.abesgassessment;
ANALYZE olapts.abesgassessment ;	

raise notice '% - Step abesgassessment_idx - part a end', clock_timestamp(); 
END IF;
------------------------------------------------------------------------
-- Create or update flag table -- 
raise notice '% step abesgassessment - part c start', clock_timestamp();
DROP TABLE IF EXISTS olapts.abesgassessmentflag;
CREATE TABLE  olapts.abesgassessmentflag AS
select id_,
       pkid_,
       wfid_ wfid_,
       taskid_ taskid_, 
       versionid_ versionid_,
       isdeleted_ isdeleted_,
       islatestversion_ islatestversion_,
       baseversionid_ baseversionid_,
       contextuserid_ contextuserid_,
       isvisible_ isvisible_,
       isvalid_ isvalid_,
       snapshotid_ snapshotid_,
       t_ t_,
       createdby_ createdby_,
       createddate_ createddate_,
       updatedby_ updatedby_,
       updateddate_ updateddate_,
       (case when updateddate_>createddate_ then updatedby_ else createdby_ end) as sourcepopulatedby_,
       GREATEST(updateddate_, createddate_) as sourcepopulateddate_,
       current_setting('myvariables.popdate')::timestamp as populateddate_
FROM madata.esgassessment
where GREATEST(esgassessment.updateddate_, esgassessment.createddate_)::timestamp <=current_setting('myvariables.popdate')::timestamp
      and esgassessment.t_ = 'EsgAssessment'
;

--abesgassessmentflag Indexes--

raise notice '% - Step abesgassessmentflag_idx - part a start', clock_timestamp(); 
DROP INDEX if exists olapts.abesgassessmentflag_idx;
DROP INDEX if exists olapts.abesgassessmentflag_idx2;
CREATE INDEX IF NOT EXISTS abesgassessmentflag_idx ON olapts.abesgassessmentflag (id_);
CREATE INDEX IF NOT EXISTS abesgassessmentflag_idx2 ON olapts.abesgassessmentflag (pkid_,versionid_);
REINDEX TABLE olapts.abesgassessmentflag;
ANALYZE olapts.abesgassessmentflag ;

raise notice '% - Step abesgassessmentflag_idx - part a end', clock_timestamp(); 

-- Update refresh history -- 

select COALESCE(max(asofdate),to_timestamp(0)) into varprevsuccessdate from olapts.refreshhistory where tablename = 'abesgassessment';
delete from olapts.refreshhistory where tablename = 'abesgassessment';
insert into olapts.refreshhistory(tablename,asofdate,prevsuccessdate) select 'abesgassessment' tablename,current_setting('myvariables.popdate')::timestamp as  asofdate,varprevsuccessdate;

select COALESCE(max(asofdate),to_timestamp(0)) into varprevsuccessdate from olapts.refreshhistory where tablename = 'abesgassessmentflag';
delete from olapts.refreshhistory where tablename = 'abesgassessmentflag';
insert into olapts.refreshhistory(tablename,asofdate,prevsuccessdate) select 'abesgassessmentflag' tablename,current_setting('myvariables.popdate')::timestamp as  asofdate,varprevsuccessdate;

raise notice '% - Step abesgassessment - part c end', clock_timestamp();

END $$;

-------------------REF Data--------------------------

DO $$
DECLARE
varprevsuccessdate TIMESTAMP ;
BEGIN

--AbOverrideAuthority
raise notice '% - Step AbOverrideAuthority - part a start', clock_timestamp();
DROP TABLE IF EXISTS olapts.aboverrideauthority;
CREATE TABLE olapts.aboverrideauthority AS
select l.jsondoc_->>'Key' overrideauthoritykey_,
       l.jsondoc_->>'Value' overrideauthorityvalue,
       isdeleted_,
       t_ t_ ,
       (case when updateddate_>createddate_ then updatedby_ else createdby_ end) as sourcepopulatedby_,
       GREATEST(updateddate_,createddate_) as sourcepopulateddate_,
       current_setting('myvariables.popdate')::timestamp as populateddate_ 
from madata.v_lookup l
where l.t_ = 'OverrideAuthority';

select COALESCE(max(asofdate),to_timestamp(0)) into varprevsuccessdate from olapts.refreshhistory where tablename = 'aboverrideauthority';
delete from olapts.refreshhistory where tablename = 'aboverrideauthority';
insert into olapts.refreshhistory(tablename,asofdate,prevsuccessdate) select 'aboverrideauthority' tablename, current_setting('myvariables.popdate')::timestamp as  asofdate,varprevsuccessdate;

raise notice '% - Step aboverrideauthority - part a end', clock_timestamp();

--AbOverrideGrade
raise notice '% - Step AbEsgOverrideGrade - part a start', clock_timestamp();
DROP TABLE IF EXISTS olapts.abesgoverridegrade;
CREATE TABLE olapts.abesgoverridegrade AS
select l.jsondoc_->>'Key' overridegradekey_,
       l.jsondoc_->>'Value' overridegradevalue,
       isdeleted_,
       t_ t_ ,
       (case when updateddate_>createddate_ then updatedby_ else createdby_ end) as sourcepopulatedby_,
       GREATEST(updateddate_,createddate_) as sourcepopulateddate_,
       current_setting('myvariables.popdate')::timestamp as populateddate_ 
from madata.v_lookup l
where l.t_ = 'EsgOverrideGrade';

select COALESCE(max(asofdate),to_timestamp(0)) into varprevsuccessdate from olapts.refreshhistory where tablename = 'abesgoverridegrade';
delete from olapts.refreshhistory where tablename = 'abesgoverridegrade';
insert into olapts.refreshhistory(tablename,asofdate,prevsuccessdate) select 'abesgoverridegrade' tablename, current_setting('myvariables.popdate')::timestamp as  asofdate,varprevsuccessdate;

raise notice '% - Step abesgoverridegrade - part a end', clock_timestamp();

END $$;

---------------------------------------------- AbEsgQuestion ----------------------------------------------

DO $$
DECLARE
varprevsuccessdate TIMESTAMP ;

BEGIN

-- If table exists in refresh history --
IF EXISTS (select from olapts.refreshhistory where tablename = 'abesgquestion') THEN
raise notice '% - Step abesgquestion - part a start', clock_timestamp();
insert into olapts.abesgquestion
	select esgquestion.id_ AS id_,
		   esgquestion.pkid_::varchar as pkid_,
		   esgquestion.id_ AS esgquestionid_,
    	   esgquestion.jsondoc_ ->> 'Comments'::text AS comments,
    	   esgquestion.jsondoc_ ->> 'EsgMasterId'::text AS esgmasterid,
    	   esgquestion.jsondoc_ ->> 'Factor'::text AS factor,
    	   esgquestion.jsondoc_ ->> 'FactorEy'::text AS factorey,
    	   esgquestion.jsondoc_ ->> 'Pillar'::text AS pillar,
    	   esgquestion.jsondoc_ ->> 'PillarEy'::text AS pillarey,
    	   esgquestion.jsondoc_ ->> 'PreviousReferenceYear'::text AS previousreferenceyear,
    	   esgquestion.jsondoc_ ->> 'PreviousValue'::text AS previousvalue,
    	   esgquestion.jsondoc_ ->> 'QuestionDescr'::text AS questiondescr,
    	   esgquestion.jsondoc_ ->> 'QuestionDescrEy'::text AS questiondescrey,
    	   esgquestion.jsondoc_ ->> 'QuestionId'::text AS questionid,
    	   esgquestion.jsondoc_ ->> 'QuestionIdEy'::text AS questionidey,
    	   esgquestion.jsondoc_ ->> 'ReferenceYear'::text AS referenceyear,
    	   esgquestion.jsondoc_ ->> 'SubFactor'::text AS subfactor,
    	   esgquestion.jsondoc_ ->> 'SubFactorEy'::text AS subfactorey,
    	   esgquestion.jsondoc_ ->> 'Value'::text AS value,
		   esgquestion.wfid_::varchar,
		   esgquestion.taskid_::varchar,
		   esgquestion.versionid_::int4,
		   esgquestion.isdeleted_::boolean,
		   esgquestion.islatestversion_::boolean,
		   esgquestion.baseversionid_::int4,
		   esgquestion.contextuserid_::varchar,
		   esgquestion.isvisible_::boolean,
		   esgquestion.isvalid_::boolean,
		   esgquestion.snapshotid_::int4,
		   esgquestion.t_::varchar,
		   esgquestion.createdby_::varchar,
		   esgquestion.createddate_::timestamp,
		   esgquestion.updatedby_::varchar,
		   esgquestion.updateddate_::timestamp,
		   esgquestion.fkid_esgmaster,
		   CASE WHEN esgquestion.updateddate_ > esgquestion.createddate_ THEN esgquestion.updatedby_ ELSE esgquestion.createdby_ END AS sourcepopulatedby_,
		   GREATEST(esgquestion.createddate_, esgquestion.updateddate_) AS sourcepopulateddate_,
		   current_setting('myvariables.popdate')::timestamp as populateddate_
	FROM madata.esgquestion
	WHERE
		GREATEST(esgquestion.updateddate_, esgquestion.createddate_) > (select COALESCE(max(asofdate), to_timestamp(0)) from olapts.refreshhistory where tablename = 'abesgquestion')
		AND GREATEST(esgquestion.updateddate_, esgquestion.createddate_)::timestamp <= current_setting('myvariables.popdate')::timestamp
		AND esgquestion.t_ = 'EsgQuestion'
	;
raise notice '% - Step abesgquestion - part a end', clock_timestamp();

-- If table doesn't exist in refresh history --
ELSE
raise notice '% Step abesgquestion - part b start', clock_timestamp();
	DROP TABLE IF EXISTS olapts.abesgquestion;
	CREATE TABLE olapts.abesgquestion AS
	select esgquestion.id_ AS id_,
		   esgquestion.pkid_::varchar as pkid_,
		   esgquestion.id_ AS esgquestionid_,
    	   esgquestion.jsondoc_ ->> 'Comments'::text AS comments,
    	   esgquestion.jsondoc_ ->> 'EsgMasterId'::text AS esgmasterid,
    	   esgquestion.jsondoc_ ->> 'Factor'::text AS factor,
    	   esgquestion.jsondoc_ ->> 'FactorEy'::text AS factorey,
    	   esgquestion.jsondoc_ ->> 'Pillar'::text AS pillar,
    	   esgquestion.jsondoc_ ->> 'PillarEy'::text AS pillarey,
    	   esgquestion.jsondoc_ ->> 'PreviousReferenceYear'::text AS previousreferenceyear,
    	   esgquestion.jsondoc_ ->> 'PreviousValue'::text AS previousvalue,
    	   esgquestion.jsondoc_ ->> 'QuestionDescr'::text AS questiondescr,
    	   esgquestion.jsondoc_ ->> 'QuestionDescrEy'::text AS questiondescrey,
    	   esgquestion.jsondoc_ ->> 'QuestionId'::text AS questionid,
    	   esgquestion.jsondoc_ ->> 'QuestionIdEy'::text AS questionidey,
    	   esgquestion.jsondoc_ ->> 'ReferenceYear'::text AS referenceyear,
    	   esgquestion.jsondoc_ ->> 'SubFactor'::text AS subfactor,
    	   esgquestion.jsondoc_ ->> 'SubFactorEy'::text AS subfactorey,
    	   esgquestion.jsondoc_ ->> 'Value'::text AS value,
		   esgquestion.wfid_::varchar,
		   esgquestion.taskid_::varchar,
		   esgquestion.versionid_::int4,
		   esgquestion.isdeleted_::boolean,
		   esgquestion.islatestversion_::boolean,
		   esgquestion.baseversionid_::int4,
		   esgquestion.contextuserid_::varchar,
		   esgquestion.isvisible_::boolean,
		   esgquestion.isvalid_::boolean,
		   esgquestion.snapshotid_::int4,
		   esgquestion.t_::varchar,
		   esgquestion.createdby_::varchar,
		   esgquestion.createddate_::timestamp,
		   esgquestion.updatedby_::varchar,
		   esgquestion.updateddate_::timestamp,
		   esgquestion.fkid_esgmaster,
		   CASE WHEN esgquestion.updateddate_ > esgquestion.createddate_ THEN esgquestion.updatedby_ ELSE esgquestion.createdby_ END AS sourcepopulatedby_,
		   GREATEST(esgquestion.createddate_, esgquestion.updateddate_) AS sourcepopulateddate_,
		   current_setting('myvariables.popdate')::timestamp as populateddate_
	FROM madata.esgquestion
	WHERE
		GREATEST(esgquestion.updateddate_, esgquestion.createddate_) > (select COALESCE(max(asofdate), to_timestamp(0)) from olapts.refreshhistory where tablename = 'abesgquestion')
		AND GREATEST(esgquestion.updateddate_, esgquestion.createddate_)::timestamp <= current_setting('myvariables.popdate')::timestamp
		AND esgquestion.t_ = 'EsgQuestion'
	;
raise notice '% - Step abesgquestion - part b end', clock_timestamp();

--AbEsgQuestion Indexes--

raise notice '% - Step abesgquestion_idx - part a start', clock_timestamp(); 
DROP INDEX if exists olapts.abesgquestion_idx;
DROP INDEX if exists olapts.abesgquestion_idx2;
CREATE INDEX IF NOT EXISTS abesgquestion_idx ON olapts.abesgquestion (id_);
CREATE INDEX IF NOT EXISTS abesgquestion_idx2 ON olapts.abesgquestion (pkid_,versionid_);
REINDEX TABLE olapts.abesgquestion;
ANALYZE olapts.abesgquestion ;	

raise notice '% - Step abesgquestion_idx - part a end', clock_timestamp(); 
END IF;

-- Create or update flag table -- 

raise notice '% step abesgquestion - part c start', clock_timestamp();
DROP TABLE IF EXISTS olapts.abesgquestionflag;
CREATE TABLE  olapts.abesgquestionflag AS

select id_,
       pkid_,
       wfid_ wfid_,
       taskid_ taskid_, 
       versionid_ versionid_,
       isdeleted_ isdeleted_,
       islatestversion_ islatestversion_,
       baseversionid_ baseversionid_,
       contextuserid_ contextuserid_,
       isvisible_ isvisible_,
       isvalid_ isvalid_,
       snapshotid_ snapshotid_,
       t_ t_,
       createdby_ createdby_,
       createddate_ createddate_,
       updatedby_ updatedby_,
       updateddate_ updateddate_,
       (case when updateddate_>createddate_ then updatedby_ else createdby_ end) as sourcepopulatedby_,
       GREATEST(updateddate_, createddate_) as sourcepopulateddate_,
       current_setting('myvariables.popdate')::timestamp as populateddate_
FROM madata.esgquestion
where 
     GREATEST(esgquestion.updateddate_, esgquestion.createddate_)::timestamp <=current_setting('myvariables.popdate')::timestamp
     and esgquestion.t_ = 'EsgQuestion'
;

--AbEsgQuestionFlag Indexes--

raise notice '% - Step abesgquestionflag_idx - part a start', clock_timestamp(); 
DROP INDEX if exists olapts.abesgquestionflag_idx;
DROP INDEX if exists olapts.abesgquestionflag_idx2;
CREATE INDEX IF NOT EXISTS abesgquestionflag_idx ON olapts.abesgquestionflag (id_);
CREATE INDEX IF NOT EXISTS abesgquestionflag_idx2 ON olapts.abesgquestionflag (pkid_,versionid_);
REINDEX TABLE olapts.abesgquestionflag;
ANALYZE olapts.abesgquestionflag ;

raise notice '% - Step abesgquestionflag_idx - part a end', clock_timestamp(); 

-- Update refresh history -- 

select COALESCE(max(asofdate),to_timestamp(0)) into varprevsuccessdate from olapts.refreshhistory where tablename = 'abesgquestion';
delete from olapts.refreshhistory where tablename = 'abesgquestion';
insert into olapts.refreshhistory(tablename,asofdate,prevsuccessdate) select 'abesgquestion' tablename,current_setting('myvariables.popdate')::timestamp as  asofdate,varprevsuccessdate;

select COALESCE(max(asofdate),to_timestamp(0)) into varprevsuccessdate from olapts.refreshhistory where tablename = 'abesgquestionflag';
delete from olapts.refreshhistory where tablename = 'abesgquestionflag';
insert into olapts.refreshhistory(tablename,asofdate,prevsuccessdate) select 'abesgquestionflag' tablename,current_setting('myvariables.popdate')::timestamp as  asofdate,varprevsuccessdate;

raise notice '% - Step abesgquestion - part c end', clock_timestamp();

END $$;

---------------------------------------------- AbEsgOverallAssessment ----------------------------------------------

DO $$
DECLARE
varprevsuccessdate TIMESTAMP ;

BEGIN

-- If table exists in refresh history --
IF EXISTS (select from olapts.refreshhistory where tablename = 'abesgoverallassessment') THEN
raise notice '% - Step abesgoverallassessment - part a start', clock_timestamp();
insert into olapts.abesgoverallassessment
	select esgoverallassessment.id_ AS id_,
           esgoverallassessment.pkid_,
           esgoverallassessment.id_ AS esgoverallassessmentid_,
           esgoverallassessment.jsondoc_ ->> 'AssessmentDate'::text AS assessmentdate,
           esgoverallassessment.jsondoc_ ->> 'AssessmentUser'::text AS assessmentuser,
           esgoverallassessment.jsondoc_ ->> 'EntityId'::text AS entityid,
           esgoverallassessment.jsondoc_ ->> 'EntityVersionId'::text AS entityversionid,
           esgoverallassessment.jsondoc_ ->> 'EsOutcome'::text AS esoutcome,
           l1.jsondoc_ ->> 'Value'::text AS esoutcomeval,
           esgoverallassessment.jsondoc_ ->> 'EsgObligorOutcome'::text AS esgobligoroutcome,
           l2.jsondoc_ ->> 'Value'::text AS esgobligoroutcomeval,
           esgoverallassessment.jsondoc_ ->> 'EsgOverallOutcome'::text AS esgoveralloutcome,
           esgoverallassessment.jsondoc_ ->> 'IsLatestApprovedAssessment'::text AS islatestapprovedassessment,
           esgoverallassessment.jsondoc_ ->> 'IsSustainable'::text AS issustainable,
           l3.jsondoc_ ->> 'Value'::text AS issustainableval,
           esgoverallassessment.jsondoc_ ->> 'LoanApplication'::text AS loanapplication,
           esgoverallassessment.jsondoc_ ->> 'LoanSubApplication'::text AS loansubapplication,
           esgoverallassessment.wfid_,
           esgoverallassessment.taskid_,
           esgoverallassessment.versionid_,
           esgoverallassessment.statusid_,
           esgoverallassessment.isdeleted_,
           esgoverallassessment.islatestversion_,
           esgoverallassessment.baseversionid_,
           esgoverallassessment.contextuserid_,
           esgoverallassessment.isvisible_,
           esgoverallassessment.isvalid_,
           esgoverallassessment.snapshotid_,
           esgoverallassessment.t_,
           esgoverallassessment.createdby_,
           esgoverallassessment.createddate_,
           esgoverallassessment.updatedby_,
           esgoverallassessment.updateddate_,
           esgoverallassessment.fkid_entity,
	       CASE WHEN esgoverallassessment.updateddate_ > esgoverallassessment.createddate_ THEN esgoverallassessment.updatedby_ ELSE esgoverallassessment.createdby_ END AS sourcepopulatedby_,
           GREATEST(esgoverallassessment.createddate_, esgoverallassessment.updateddate_) AS sourcepopulateddate_,
	       current_setting('myvariables.popdate')::timestamp as populateddate_
	FROM madata.esgoverallassessment
	LEFT JOIN madata.custom_lookup l1 ON l1.t_::text = 'EsgRiskCategorization'::text AND (l1.jsondoc_ ->> 'Key'::text) = (esgoverallassessment.jsondoc_ ->> 'EsOutcome'::text)
    LEFT JOIN madata.custom_lookup l2 ON l2.t_::text = 'EsgClassification'::text AND (l2.jsondoc_ ->> 'Key'::text) = (esgoverallassessment.jsondoc_ ->> 'EsgObligorOutcome'::text)
    LEFT JOIN madata.custom_lookup l3 ON l3.t_::text = 'EsgYesNo'::text AND (l3.jsondoc_ ->> 'Key'::text) = (esgoverallassessment.jsondoc_ ->> 'IsSustainable'::text)
	WHERE
		 GREATEST(esgoverallassessment.updateddate_, esgoverallassessment.createddate_) > (select COALESCE(max(asofdate), to_timestamp(0)) from olapts.refreshhistory where tablename = 'abesgoverallassessment')
		 AND GREATEST(esgoverallassessment.updateddate_, esgoverallassessment.createddate_)::timestamp <= current_setting('myvariables.popdate')::timestamp
		 AND esgoverallassessment.t_ = 'EsgOverallAssessment'
	;
raise notice '% - Step abesgoverallassessment - part a end', clock_timestamp();

-- If table doesn't exist in refresh history --
ELSE
raise notice '% Step abesgoverallassessment - part b start', clock_timestamp();
DROP TABLE IF EXISTS olapts.abesgoverallassessment;
CREATE TABLE olapts.abesgoverallassessment AS
	select esgoverallassessment.id_ AS id_,
           esgoverallassessment.pkid_,
           esgoverallassessment.id_ AS esgoverallassessmentid_,
           esgoverallassessment.jsondoc_ ->> 'AssessmentDate'::text AS assessmentdate,
           esgoverallassessment.jsondoc_ ->> 'AssessmentUser'::text AS assessmentuser,
           esgoverallassessment.jsondoc_ ->> 'EntityId'::text AS entityid,
           esgoverallassessment.jsondoc_ ->> 'EntityVersionId'::text AS entityversionid,
           esgoverallassessment.jsondoc_ ->> 'EsOutcome'::text AS esoutcome,
           l1.jsondoc_ ->> 'Value'::text AS esoutcomeval,
           esgoverallassessment.jsondoc_ ->> 'EsgObligorOutcome'::text AS esgobligoroutcome,
           l2.jsondoc_ ->> 'Value'::text AS esgobligoroutcomeval,
           esgoverallassessment.jsondoc_ ->> 'EsgOverallOutcome'::text AS esgoveralloutcome,
           esgoverallassessment.jsondoc_ ->> 'IsLatestApprovedAssessment'::text AS islatestapprovedassessment,
           esgoverallassessment.jsondoc_ ->> 'IsSustainable'::text AS issustainable,
           l3.jsondoc_ ->> 'Value'::text AS issustainableval,
           esgoverallassessment.jsondoc_ ->> 'LoanApplication'::text AS loanapplication,
           esgoverallassessment.jsondoc_ ->> 'LoanSubApplication'::text AS loansubapplication,
           esgoverallassessment.wfid_,
           esgoverallassessment.taskid_,
           esgoverallassessment.versionid_,
           esgoverallassessment.statusid_,
           esgoverallassessment.isdeleted_,
           esgoverallassessment.islatestversion_,
           esgoverallassessment.baseversionid_,
           esgoverallassessment.contextuserid_,
           esgoverallassessment.isvisible_,
           esgoverallassessment.isvalid_,
           esgoverallassessment.snapshotid_,
           esgoverallassessment.t_,
           esgoverallassessment.createdby_,
           esgoverallassessment.createddate_,
           esgoverallassessment.updatedby_,
           esgoverallassessment.updateddate_,
           esgoverallassessment.fkid_entity,
	       CASE WHEN esgoverallassessment.updateddate_ > esgoverallassessment.createddate_ THEN esgoverallassessment.updatedby_ ELSE esgoverallassessment.createdby_ END AS sourcepopulatedby_,
           GREATEST(esgoverallassessment.createddate_, esgoverallassessment.updateddate_) AS sourcepopulateddate_,
	       current_setting('myvariables.popdate')::timestamp as populateddate_
	FROM madata.esgoverallassessment
	LEFT JOIN madata.custom_lookup l1 ON l1.t_::text = 'EsgRiskCategorization'::text AND (l1.jsondoc_ ->> 'Key'::text) = (esgoverallassessment.jsondoc_ ->> 'EsOutcome'::text)
    LEFT JOIN madata.custom_lookup l2 ON l2.t_::text = 'EsgClassification'::text AND (l2.jsondoc_ ->> 'Key'::text) = (esgoverallassessment.jsondoc_ ->> 'EsgObligorOutcome'::text)
    LEFT JOIN madata.custom_lookup l3 ON l3.t_::text = 'EsgYesNo'::text AND (l3.jsondoc_ ->> 'Key'::text) = (esgoverallassessment.jsondoc_ ->> 'IsSustainable'::text)
	WHERE
		 GREATEST(esgoverallassessment.updateddate_, esgoverallassessment.createddate_) > (select COALESCE(max(asofdate), to_timestamp(0)) from olapts.refreshhistory where tablename = 'abesgoverallassessment')
		 AND GREATEST(esgoverallassessment.updateddate_, esgoverallassessment.createddate_)::timestamp <= current_setting('myvariables.popdate')::timestamp
		 AND esgoverallassessment.t_ = 'EsgOverallAssessment'
;
raise notice '% - Step abesgoverallassessment - part b end', clock_timestamp();

--AbEsgOverallAssessment Indexes--
raise notice '% - Step abesgoverallassessment_idx - part a start', clock_timestamp(); 
DROP INDEX if exists olapts.abesgoverallassessment_idx;
DROP INDEX if exists olapts.abesgoverallassessment_idx2;
CREATE INDEX IF NOT EXISTS abesgoverallassessment_idx ON olapts.abesgoverallassessment (id_);
CREATE INDEX IF NOT EXISTS abesgoverallassessment_idx2 ON olapts.abesgoverallassessment (pkid_,versionid_);
REINDEX TABLE olapts.abesgoverallassessment;
ANALYZE olapts.abesgoverallassessment ;	

raise notice '% - Step abesgoverallassessment_idx - part a end', clock_timestamp(); 
END IF;

-- Create or update flag table -- 

raise notice '% step abesgoverallassessment - part c start', clock_timestamp();
DROP TABLE IF EXISTS olapts.abesgoverallassessmentflag;
CREATE TABLE  olapts.abesgoverallassessmentflag AS

select id_,
       pkid_,
       wfid_ wfid_,
       taskid_ taskid_, 
       versionid_ versionid_,
       isdeleted_ isdeleted_,
       islatestversion_ islatestversion_,
       baseversionid_ baseversionid_,
       contextuserid_ contextuserid_,
       isvisible_ isvisible_,
       isvalid_ isvalid_,
       snapshotid_ snapshotid_,
       t_ t_,
       createdby_ createdby_,
       createddate_ createddate_,
       updatedby_ updatedby_,
       updateddate_ updateddate_,
       (case when updateddate_>createddate_ then updatedby_ else createdby_ end) as sourcepopulatedby_,
       GREATEST(updateddate_, createddate_) as sourcepopulateddate_,
       current_setting('myvariables.popdate')::timestamp as populateddate_
FROM madata.esgoverallassessment
where 
     GREATEST(esgoverallassessment.updateddate_, esgoverallassessment.createddate_)::timestamp <=current_setting('myvariables.popdate')::timestamp
     and esgoverallassessment.t_ = 'EsgOverallAssessment'
;

----- AbEsgOverallAssessmentFlag Indexes -----

raise notice '% - Step abesgoverallassessmentflag_idx - part a start', clock_timestamp(); 
DROP INDEX if exists olapts.abesgoverallassessmentflag_idx;
DROP INDEX if exists olapts.abesgoverallassessmentflag_idx2;
CREATE INDEX IF NOT EXISTS abesgoverallassessmentflag_idx ON olapts.abesgoverallassessmentflag (id_);
CREATE INDEX IF NOT EXISTS abesgoverallassessmentflag_idx2 ON olapts.abesgoverallassessmentflag (pkid_,versionid_);
REINDEX TABLE olapts.abesgoverallassessmentflag;
ANALYZE olapts.abesgoverallassessmentflag ;

raise notice '% - Step abesgoverallassessmentflag_idx - part a end', clock_timestamp(); 

-- Update refresh history -- 

select COALESCE(max(asofdate),to_timestamp(0)) into varprevsuccessdate from olapts.refreshhistory where tablename = 'abesgoverallassessment';
delete from olapts.refreshhistory where tablename = 'abesgoverallassessment';
insert into olapts.refreshhistory(tablename,asofdate,prevsuccessdate) select 'abesgoverallassessment' tablename,current_setting('myvariables.popdate')::timestamp as  asofdate,varprevsuccessdate;

select COALESCE(max(asofdate),to_timestamp(0)) into varprevsuccessdate from olapts.refreshhistory where tablename = 'abesgoverallassessmentflag';
delete from olapts.refreshhistory where tablename = 'abesgoverallassessmentflag';
insert into olapts.refreshhistory(tablename,asofdate,prevsuccessdate) select 'abesgoverallassessmentflag' tablename,current_setting('myvariables.popdate')::timestamp as  asofdate,varprevsuccessdate;

raise notice '% - Step abesgoverallassessment - part c end', clock_timestamp();

END $$;

-------------------REF Data--------------------------

DO $$
DECLARE
varprevsuccessdate TIMESTAMP ;
BEGIN

--AbEsgRiskCategorization

raise notice '% - Step AbEsgRiskCategorization - part a start', clock_timestamp();
DROP TABLE IF EXISTS olapts.abesgriskcategorization;
CREATE TABLE olapts.abesgriskcategorization AS
select l.jsondoc_->>'Key' esgriskcategorizationkey_,
       l.jsondoc_->>'Value' esgriskcategorizationvalue,
       isdeleted_,
       t_ t_ ,
       (case when updateddate_>createddate_ then updatedby_ else createdby_ end) as sourcepopulatedby_,
       GREATEST(updateddate_,createddate_) as sourcepopulateddate_,
       current_setting('myvariables.popdate')::timestamp as populateddate_ 
from madata.v_lookup l
where l.t_ = 'EsgRiskCategorization';

select COALESCE(max(asofdate),to_timestamp(0)) into varprevsuccessdate from olapts.refreshhistory where tablename = 'abesgriskcategorization';
delete from olapts.refreshhistory where tablename = 'abesgriskcategorization';
insert into olapts.refreshhistory(tablename,asofdate,prevsuccessdate) select 'abesgriskcategorization' tablename, current_setting('myvariables.popdate')::timestamp as  asofdate,varprevsuccessdate;

raise notice '% - Step abesgriskcategorization - part a end', clock_timestamp();

--AbEsgClassification

raise notice '% - Step AbEsgClassification - part a start', clock_timestamp();
DROP TABLE IF EXISTS olapts.abesgclassification;
CREATE TABLE olapts.abesgclassification AS
select l.jsondoc_->>'Key' esgclassificationkey_,
       l.jsondoc_->>'Value' esgclassificationvalue,
       isdeleted_,
       t_ t_ ,
       (case when updateddate_>createddate_ then updatedby_ else createdby_ end) as sourcepopulatedby_,
       GREATEST(updateddate_,createddate_) as sourcepopulateddate_,
       current_setting('myvariables.popdate')::timestamp as populateddate_ 
from madata.v_lookup l
where l.t_ = 'EsgClassification';

-- Update refresh history -- 

select COALESCE(max(asofdate),to_timestamp(0)) into varprevsuccessdate from olapts.refreshhistory where tablename = 'abesgclassification';
delete from olapts.refreshhistory where tablename = 'abesgclassification';
insert into olapts.refreshhistory(tablename,asofdate,prevsuccessdate) select 'abesgclassification' tablename, current_setting('myvariables.popdate')::timestamp as  asofdate,varprevsuccessdate;

raise notice '% - Step abesgclassification - part a end', clock_timestamp();

--AbEsgYesNo

raise notice '% - Step AbEsgYesNo - part a start', clock_timestamp();
DROP TABLE IF EXISTS olapts.abesgyesno;
CREATE TABLE olapts.abesgyesno AS
select l.jsondoc_->>'Key' esgyesnokey_,
       l.jsondoc_->>'Value' esgyesnovalue,
       isdeleted_,
       t_ t_ ,
       (case when updateddate_>createddate_ then updatedby_ else createdby_ end) as sourcepopulatedby_,
       GREATEST(updateddate_,createddate_) as sourcepopulateddate_,
       current_setting('myvariables.popdate')::timestamp as populateddate_ 
from madata.v_lookup l
where l.t_ = 'EsgYesNo';

-- Update refresh history -- 

select COALESCE(max(asofdate),to_timestamp(0)) into varprevsuccessdate from olapts.refreshhistory where tablename = 'abesgyesno';
delete from olapts.refreshhistory where tablename = 'abesgyesno';
insert into olapts.refreshhistory(tablename,asofdate,prevsuccessdate) select 'abesgyesno' tablename, current_setting('myvariables.popdate')::timestamp as  asofdate,varprevsuccessdate;

raise notice '% - Step abesgyesno - part a end', clock_timestamp();

END $$;

-- RESET parameters tuning

RESET maintenance_work_mem;
RESET work_mem;
RESET effective_cache_size;
RESET effective_io_concurrency;
RESET enable_partitionwise_join;
RESET enable_partitionwise_aggregate;
RESET max_parallel_workers_per_gather;
RESET max_parallel_maintenance_workers;
RESET max_parallel_workers;
RESET random_page_cost;
RESET seq_page_cost;
RESET enable_seqscan;
RESET parallel_leader_participation;
RESET default_statistics_target;
RESET force_parallel_mode;
RESET parallel_setup_cost;
RESET parallel_tuple_cost;
RESET jit;
RESET jit_above_cost;
RESET jit_optimize_above_cost;
RESET jit_inline_above_cost;

-----------------------------------
--Check if the tables were created
----------------------------------

/* 
--AbEsgQuestion
select * from olapts.abesgquestion
select * from olapts.abesgquestionflag

--AbEsgAssessment
select * from olapts.abesgassessment
select * from olapts.abesgoverridegrade
select * from olapts.aboverrideauthority

--AbEsgOverallAssessment
select * from olapts.abesgoverallassessment
select * from olapts.abesgriskcategorization
select * from olapts.abesgclassification
select * from olapts.abesgyesno

--Expected rows 11
select * 
from olapts.refreshhistory 
where tablename in ('abesgassessment','abesgoverridegrade','aboverrideauthority',
                    'abesgquestion','abesgquestionflag','abesgoverallassessment',
					'abesgriskcategorization','abesgclassification','abesgyesno',
					'abesgoverallassessmentflag','abesgassessmentflag')
*/


