----------------------------------------------------------------------------------
--           RUN Script in olap database with olap user
----------------------------------------------------------------------------------

---------------------------------------------
--    FOREIGN TABLE: madata.esgassessment
---------------------------------------------

DROP FOREIGN TABLE IF EXISTS madata.esgassessment;

CREATE FOREIGN TABLE madata.esgassessment(
    id_ character varying NOT NULL COLLATE pg_catalog."default",
    pkid_ character varying NOT NULL COLLATE pg_catalog."default",
    jsondoc_ jsonb NOT NULL,
    wfid_ character varying NOT NULL COLLATE pg_catalog."default",
    taskid_ character varying NOT NULL COLLATE pg_catalog."default",
    versionid_ integer NOT NULL,
    statusid_ integer NOT NULL,
    isdeleted_ boolean NOT NULL DEFAULT false,
    islatestversion_ boolean NOT NULL,
    baseversionid_ integer NOT NULL,
    contextuserid_ character varying NULL DEFAULT 'admin'::character varying COLLATE pg_catalog."default",
    isvisible_ boolean NULL DEFAULT true,
    isvalid_ boolean NULL DEFAULT true,
    snapshotid_ integer NULL DEFAULT 0,
    t_ character varying NOT NULL COLLATE pg_catalog."default",
    createdby_ character varying NULL COLLATE pg_catalog."default",
    createddate_ timestamp without time zone NULL DEFAULT timezone('utc'::text, now()),
    updatedby_ character varying NULL COLLATE pg_catalog."default",
    updateddate_ timestamp without time zone NULL,
    fkid_entity character varying NULL COLLATE pg_catalog."default"
)
    SERVER matenantserver
    OPTIONS (schema_name 'tenant', table_name 'esgassessment');

ALTER FOREIGN TABLE madata.esgassessment OWNER TO olap;

---------------------------------------------
--    FOREIGN TABLE: madata.esgquestion
---------------------------------------------

DROP FOREIGN TABLE IF EXISTS madata.esgquestion;

CREATE FOREIGN TABLE madata.esgquestion(
    id_ character varying COLLATE pg_catalog."default" NOT NULL,
    pkid_ character varying COLLATE pg_catalog."default" NOT NULL,
    jsondoc_ jsonb NOT NULL,
    wfid_ character varying COLLATE pg_catalog."default" NOT NULL,
    taskid_ character varying COLLATE pg_catalog."default" NOT NULL,
    versionid_ integer NOT NULL,
    statusid_ integer NOT NULL,
    isdeleted_ boolean NOT NULL DEFAULT false,
    islatestversion_ boolean NOT NULL,
    baseversionid_ integer NOT NULL,
    contextuserid_ character varying COLLATE pg_catalog."default" DEFAULT 'admin'::character varying,
    isvisible_ boolean DEFAULT true,
    isvalid_ boolean DEFAULT true,
    snapshotid_ integer DEFAULT 0,
    t_ character varying COLLATE pg_catalog."default" NOT NULL,
    createdby_ character varying COLLATE pg_catalog."default",
    createddate_ timestamp without time zone DEFAULT timezone('utc'::text, now()),
    updatedby_ character varying COLLATE pg_catalog."default",
    updateddate_ timestamp without time zone,
    fkid_esgmaster character varying COLLATE pg_catalog."default"
)
    SERVER matenantserver
    OPTIONS (schema_name 'tenant', table_name 'esgquestion');

ALTER FOREIGN TABLE madata.esgquestion OWNER TO olap;

---------------------------------------------
--    FOREIGN TABLE: madata.esgoverallassessment
---------------------------------------------

DROP FOREIGN TABLE IF EXISTS madata.esgoverallassessment;

CREATE FOREIGN TABLE madata.esgoverallassessment(
	id_ character varying COLLATE pg_catalog."default" NOT NULL,
    pkid_ character varying COLLATE pg_catalog."default" NOT NULL,
    jsondoc_ jsonb NOT NULL,
    wfid_ character varying COLLATE pg_catalog."default" NOT NULL,
    taskid_ character varying COLLATE pg_catalog."default" NOT NULL,
    versionid_ integer NOT NULL,
    statusid_ integer NOT NULL,
    isdeleted_ boolean NOT NULL DEFAULT false,
    islatestversion_ boolean NOT NULL,
    baseversionid_ integer NOT NULL,
    contextuserid_ character varying COLLATE pg_catalog."default" DEFAULT 'admin'::character varying,
    isvisible_ boolean DEFAULT true,
    isvalid_ boolean DEFAULT true,
    snapshotid_ integer DEFAULT 0,
    t_ character varying COLLATE pg_catalog."default" NOT NULL,
    createdby_ character varying COLLATE pg_catalog."default",
    createddate_ timestamp without time zone DEFAULT timezone('utc'::text, now()),
    updatedby_ character varying COLLATE pg_catalog."default",
    updateddate_ timestamp without time zone,
    fkid_entity character varying COLLATE pg_catalog."default"
	)
    SERVER matenantserver
    OPTIONS (schema_name 'tenant', table_name 'esgoverallassessment');

ALTER FOREIGN TABLE madata.esgoverallassessment OWNER TO olap;
   
	

-----------------------------------
--Check if the tables were created
----------------------------------

--select * from madata.esgassessment limit 10
--select * from madata.esgquestion limit 10
--select * from madata.esgoverallassessment limit 10 





