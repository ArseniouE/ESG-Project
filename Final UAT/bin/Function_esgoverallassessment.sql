-- FUNCTION: olapts.report_esgoverallassessment()
-- DROP FUNCTION olapts.report_esgoverallassessment();

CREATE OR REPLACE FUNCTION olapts.report_esgoverallassessment(IN ref_date date)
    RETURNS boolean
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE PARALLEL UNSAFE
AS $BODY$
declare
 pl_status boolean:=FALSE;
begin
	
	TRUNCATE TABLE olapts.report_esgoverallassessment; 
	insert into olapts.report_esgoverallassessment (
select distinct on (assess.entityid)
	--assess.entityid,
	assess.assessmentdate as AssessmentDate
	,assess.assessmentuser as AssessmentUser
	,entity.gc18 as TaxId
	,entity.cdicode as Cdi
	,assess.issustainable as IsSustainable
	,assess.esgobligoroutcome as EsgObligorOutcome
	,assess.esoutcome as EsgTransactionOutcome --esg transaction outcome 
	,assess.loanapplication as LoanApplication --arithmos aitisis
	,assess.loansubapplication as LoanSubApplication --arithmos ipo aitisis
	,assess.esgoveralloutcome as EsgOverallOutcome	
	--,ref_date as Ref_Date
from olapts.factesgoverallassessment assess
left join olapts.factentity entity on assess.entityid::int=entity.entityid and assess.entityversionid::int = entity.versionid_
where 1=1 --assess.islatestversion_ --and assess.sourcepopulateddate_<= '2023-11-22 23:59:59' --parameter date	
	  and assess.sourcepopulateddate_ <= cast( ref_date as date) + time '23:59:59'  	  
	  and assess.isdeleted_='false' 
order by assess.entityid, assess.sourcepopulateddate_ desc	
	);
	
pl_status:=TRUE;
RETURN pl_status;
EXCEPTION 
	WHEN OTHERS THEN	
		Return pl_status;		
end;
$BODY$;

ALTER FUNCTION olapts.report_esgoverallassessment(date)
    OWNER TO olap;