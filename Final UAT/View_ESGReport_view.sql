----------------------------------VIEW esgreport_view----------------------------------

-- DROP VIEW olapts.esgreport_view;

CREATE OR REPLACE VIEW olapts.esgreport_view
 AS
 SELECT * FROM olapts.esgreport;

ALTER TABLE olapts.esgreport_view
    OWNER TO olap;