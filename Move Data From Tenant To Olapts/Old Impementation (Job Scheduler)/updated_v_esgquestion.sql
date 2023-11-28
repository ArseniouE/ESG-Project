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
	h.jsondoc_ ->> 'FactorEy'::text AS factorey,
	h.jsondoc_ ->> 'PillarEy'::text AS pillarey,
	h.jsondoc_ ->> 'SubFactorEy'::text AS subfactorey,
	h.jsondoc_ ->> 'QuestionIdEy'::text AS questionidey,
	h.jsondoc_ ->> 'QuestionDescrEy'::text AS questiondescrey,
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