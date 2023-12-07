-------------------------------------------VIEWS-------------------------------------------

--------------------------------------------
--            esgassessment
--------------------------------------------

-- DROP VIEW tenant.v_esgassessment;

CREATE OR REPLACE VIEW tenant.v_esgassessment
 AS
 SELECT h.id_ AS v_esgassessmentid_,
    h.pkid_,
    h.id_ AS esgassessmentid_,
    h.jsondoc_ ->> 'ApprovalDate'::text AS approvaldate,
    h.jsondoc_ ->> 'ApprovalUser'::text AS approvaluser,
    h.jsondoc_ ->> 'AssessmentDate'::text AS assessmentdate,
    h.jsondoc_ ->> 'AssessmentUser'::text AS assessmentuser,
    h.jsondoc_ ->> 'AssetsRecentValue'::text AS assetsrecentvalue,
    (h.jsondoc_ ->> 'AuthorizationFlag'::text)::boolean AS authorizationflag,
    h.jsondoc_ ->> 'CompanyNaceCode'::text AS companynacecode,
    h.jsondoc_ ->> 'CompanyName'::text AS companyname,
    h.jsondoc_ ->> 'CreditCommitteeDate'::text AS creditcommitteedate,
    h.jsondoc_ ->> 'EbiodiversityScore'::text AS ebiodiversityscore,
    h.jsondoc_ ->> 'EclimateGoalsTargetsScore'::text AS eclimategoalstargetsscore,
    h.jsondoc_ ->> 'EemissionsScore'::text AS eemissionsscore,
    h.jsondoc_ ->> 'EenergyScore'::text AS eenergyscore,
    h.jsondoc_ ->> 'EenvironmentalComplianceScore'::text AS eenvironmentalcompliancescore,
    h.jsondoc_ ->> 'EevaluationApproachScore'::text AS eevaluationapproachscore,
    h.jsondoc_ ->> 'EmanagementApproachScore'::text AS emanagementapproachscore,
    h.jsondoc_ ->> 'EmanagementSystemsScore'::text AS emanagementsystemsscore,
    h.jsondoc_ ->> 'EmonitoringMechanismsScore'::text AS emonitoringmechanismsscore,
    h.jsondoc_ ->> 'EmployeesRecentValue'::text AS employeesrecentvalue,
    h.jsondoc_ ->> 'EntityId'::text AS entityid,
    h.jsondoc_ ->> 'EntityVersionId'::text AS entityversionid,
    h.jsondoc_ ->> 'EperformanceAssessmentScore'::text AS eperformanceassessmentscore,
    h.jsondoc_ ->> 'EphysicalRiskAssessmentScore'::text AS ephysicalriskassessmentscore,
    h.jsondoc_ ->> 'EpoliciesScore'::text AS epoliciesscore,
    h.jsondoc_ ->> 'EsgGrade'::text AS esggrade,
    h.jsondoc_ ->> 'EsgZonesOutcome'::text AS esgzonesoutcome,
    h.jsondoc_ ->> 'EsubGrade'::text AS esubgrade,
    h.jsondoc_ ->> 'EsubScore'::text AS esubscore,
    h.jsondoc_ ->> 'EsubZone'::text AS esubzone,
    h.jsondoc_ ->> 'EwasteScore'::text AS ewastescore,
    h.jsondoc_ ->> 'EwaterEffluentsScore'::text AS ewatereffluentsscore,
    h.jsondoc_ ->> 'ExpirationDate'::text AS expirationdate,
    h.jsondoc_ ->> 'EzoneOutcome'::text AS ezoneoutcome,
    h.jsondoc_ ->> 'GbusinessEthicsScore'::text AS gbusinessethicsscore,
    h.jsondoc_ ->> 'GcollectiveKnowledgeScore'::text AS gcollectiveknowledgescore,
    h.jsondoc_ ->> 'GcompositionDiversityScore'::text AS gcompositiondiversityscore,
    h.jsondoc_ ->> 'GperformanceEvaluationScore'::text AS gperformanceevaluationscore,
    h.jsondoc_ ->> 'GregulatoryComplianceScore'::text AS gregulatorycompliancescore,
    h.jsondoc_ ->> 'GremunerationScore'::text AS gremunerationscore,
    h.jsondoc_ ->> 'GrolesResponsibilitiesScore'::text AS grolesresponsibilitiesscore,
    h.jsondoc_ ->> 'GstakeholderEngagementScore'::text AS gstakeholderengagementscore,
    h.jsondoc_ ->> 'GstrategyRiskManagementScore'::text AS gstrategyriskmanagementscore,
    h.jsondoc_ ->> 'GsubGrade'::text AS gsubgrade,
    h.jsondoc_ ->> 'GsubScore'::text AS gsubscore,
    h.jsondoc_ ->> 'Gsubzone'::text AS gsubzone,
    h.jsondoc_ ->> 'GtransparencyScore'::text AS gtransparencyscore,
    h.jsondoc_ ->> 'GzoneOutcome'::text AS gzoneoutcome,
    (h.jsondoc_ ->> 'IsCompanyListedInStockExchange'::text)::boolean AS iscompanylistedinstockexchange,
    h.jsondoc_ ->> 'NextReviewDate'::text AS nextreviewdate,
    h.jsondoc_ ->> 'OverrideAuthority'::text AS overrideauthority,
    l1.jsondoc_ ->> 'Value'::text AS overrideauthorityval,
    h.jsondoc_ ->> 'OverrideDriver'::text AS overridedriver,
    h.jsondoc_ ->> 'OverrideGrade'::text AS overridegrade,
    l2.jsondoc_ ->> 'Value'::text AS overridegradeval,
    h.jsondoc_ ->> 'OverrideProvider'::text AS overrideprovider,
    h.jsondoc_ ->> 'OverrideReason'::text AS overridereason,
    h.jsondoc_ ->> 'QuestionnaireDate'::text AS questionnairedate,
    h.jsondoc_ ->> 'QuestionnaireId'::text AS questionnaireid,
    h.jsondoc_ ->> 'QuestionnaireType'::text AS questionnairetype,
    h.jsondoc_ ->> 'QuestionnaireVersion'::text AS questionnaireversion,
    h.jsondoc_ ->> 'RatingFrom'::text AS ratingfrom,
    h.jsondoc_ ->> 'RevenuesRecentValue'::text AS revenuesrecentvalue,
    h.jsondoc_ ->> 'ScomplianceScore'::text AS scompliancescore,
    h.jsondoc_ ->> 'ScustomerPrivacyScore'::text AS scustomerprivacyscore,
    h.jsondoc_ ->> 'SevaluationApproachScore'::text AS sevaluationapproachscore,
    h.jsondoc_ ->> 'SgoalsTargetsScore'::text AS sgoalstargetsscore,
    h.jsondoc_ ->> 'ShumanRightsScore'::text AS shumanrightsscore,
    h.jsondoc_ ->> 'SlaborManagementRelationsScore'::text AS slabormanagementrelationsscore,
    h.jsondoc_ ->> 'SlocalCommunitiesScore'::text AS slocalcommunitiesscore,
    h.jsondoc_ ->> 'SmanagementApproachScore'::text AS smanagementapproachscore,
    h.jsondoc_ ->> 'SmanagementSystemsScore'::text AS smanagementsystemsscore,
    h.jsondoc_ ->> 'SmonitoringMechanismsScore'::text AS smonitoringmechanismsscore,
    h.jsondoc_ ->> 'SoccupationalHealthSafetScore'::text AS soccupationalhealthsafetscore,
    h.jsondoc_ ->> 'SperformanceAssessmentScore'::text AS sperformanceassessmentscore,
    h.jsondoc_ ->> 'SpoliciesScore'::text AS spoliciesscore,
    h.jsondoc_ ->> 'SsubGrade'::text AS ssubgrade,
    h.jsondoc_ ->> 'SsubScore'::text AS ssubscore,
    h.jsondoc_ ->> 'SsubZone'::text AS ssubzone,
    h.jsondoc_ ->> 'StrainingEducationScore'::text AS strainingeducationscore,
    h.jsondoc_ ->> 'SzoneOutcome'::text AS szoneoutcome,
    h.jsondoc_ ->> 'TotalEsgScore'::text AS totalesgscore,
    h.wfid_,
    h.taskid_,
    h.versionid_,
    h.isdeleted_,
    h.islatestversion_,
    h.baseversionid_,
    h.contextuserid_,
    h.isvisible_,
    h.isvalid_,
    h.snapshotid_,
    h.t_,
    h.createdby_,
    h.createddate_,
    h.updatedby_,
    h.updateddate_,
    h.fkid_entity,
        CASE
            WHEN h.updateddate_ > h.createddate_ THEN h.updatedby_
            ELSE h.createdby_
        END AS sourcepopulatedby_,
    GREATEST(h.createddate_, h.updateddate_) AS sourcepopulateddate_
   FROM tenant.esgassessment h
     LEFT JOIN tenant.custom_lookup l1 ON l1.t_::text = 'OverrideAuthority'::text AND (l1.jsondoc_ ->> 'Key'::text) = (h.jsondoc_ ->> 'OverrideAuthority'::text)
     LEFT JOIN tenant.custom_lookup l2 ON l2.t_::text = 'EsgOverrideGrade'::text AND (l2.jsondoc_ ->> 'Key'::text) = (h.jsondoc_ ->> 'OverrideGrade'::text)
  WHERE h.isvalid_ AND h.isvisible_;

ALTER TABLE tenant.v_esgassessment
    OWNER TO tenant;

GRANT ALL ON TABLE tenant.v_esgassessment TO tenant;
GRANT SELECT ON TABLE tenant.v_esgassessment TO readabrstrn;

--select * from tenant.v_esgassessment

--------------------------------------------
--            esgquestion
--------------------------------------------

-- DROP VIEW tenant.v_esgquestion;

CREATE OR REPLACE VIEW tenant.v_esgquestion
 AS
 SELECT h.id_ AS v_esgquestionid_,
    h.pkid_,
    h.id_ AS esgquestionid_,
    h.jsondoc_ ->> 'Comments'::text AS comments,
    h.jsondoc_ ->> 'EsgMasterId'::text AS esgmasterid,
    h.jsondoc_ ->> 'Factor'::text AS factor,
    h.jsondoc_ ->> 'Pillar'::text AS pillar,
    h.jsondoc_ ->> 'PreviousReferenceYear'::text AS previousreferenceyear,
    h.jsondoc_ ->> 'PreviousValue'::text AS previousvalue,
    h.jsondoc_ ->> 'QuestionDescr'::text AS questiondescr,
    h.jsondoc_ ->> 'QuestionId'::text AS questionid,
    h.jsondoc_ ->> 'ReferenceYear'::text AS referenceyear,
    h.jsondoc_ ->> 'SubFactor'::text AS subfactor,
    h.jsondoc_ ->> 'Value'::text AS value,
    h.wfid_,
    h.taskid_,
    h.versionid_,
    h.isdeleted_,
    h.islatestversion_,
    h.baseversionid_,
    h.contextuserid_,
    h.isvisible_,
    h.isvalid_,
    h.snapshotid_,
    h.t_,
    h.createdby_,
    h.createddate_,
    h.updatedby_,
    h.updateddate_,
    h.fkid_esgmaster,
   -- h.fkid_esgassessment,
        CASE
            WHEN h.updateddate_ > h.createddate_ THEN h.updatedby_
            ELSE h.createdby_
        END AS sourcepopulatedby_,
    GREATEST(h.createddate_, h.updateddate_) AS sourcepopulateddate_
   FROM tenant.esgquestion h
  WHERE h.isvalid_ AND h.isvisible_;

ALTER TABLE tenant.v_esgquestion
    OWNER TO tenant;

GRANT ALL ON TABLE tenant.v_esgquestion TO tenant;
GRANT SELECT ON TABLE tenant.v_esgquestion TO readabrstrn;

--select * from tenant.v_esgquestion


