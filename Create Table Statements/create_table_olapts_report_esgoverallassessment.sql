---------------------CREATE STATEMENT olapts.report_esgoverallassessment---------------------
 
-- DROP TABLE olapts.report_esgoverallassessment;
 
CREATE TABLE olapts.report_esgoverallassessment
(
   	assess.assessmentdate
	,assess.assessmentuser
	,entity.gc18
	,entity.cdicode
	,assess.issustainable
	,assess.esgobligoroutcome
	,assess.esoutcome --esg transaction outcome
	,assess.loanapplication --arithmos aitisis
	,assess.loansubapplication --arithmos ipo aitisis
	,assess.esgoveralloutcome
    CONSTRAINT esgreport_pkey PRIMARY KEY (assess.entityid)
        USING INDEX TABLESPACE olap_data
)
WITH (
    OIDS = FALSE
)
TABLESPACE olap_data;
 
ALTER TABLE olapts.report_esgoverallassessment
    OWNER to olap;
