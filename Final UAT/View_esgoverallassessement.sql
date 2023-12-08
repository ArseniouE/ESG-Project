-- DROP VIEW olapts.report_esgoverallassessment_view;

CREATE OR REPLACE VIEW olapts.report_esgoverallassessment_view
 AS
 SELECT *
   FROM olapts.report_esgoverallassessment;

ALTER TABLE olapts.report_esgoverallassessment_view
    OWNER TO olap;

--select * from olapts.report_esgoverallassessment_view