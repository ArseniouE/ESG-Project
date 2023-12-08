-- Table: olapts.report_esgoverallassessment
 
-- DROP TABLE olapts.report_esgoverallassessment;
 
CREATE TABLE IF NOT EXISTS olapts.report_esgoverallassessment
(
    assessmentdate text COLLATE pg_catalog."default",
    assessmentuser text COLLATE pg_catalog."default",
    taxid character varying COLLATE pg_catalog."default",
    cdi character varying COLLATE pg_catalog."default",
    issustainable text COLLATE pg_catalog."default",
    esgobligoroutcome text COLLATE pg_catalog."default",
    esgtransactionoutcome text COLLATE pg_catalog."default",
    loanapplication text COLLATE pg_catalog."default",
    loansubapplication text COLLATE pg_catalog."default",
    esgoveralloutcome text COLLATE pg_catalog."default"
)
WITH (
    OIDS = FALSE
)
TABLESPACE olap_data;
 
ALTER TABLE olapts.report_esgoverallassessment
    OWNER to olap;