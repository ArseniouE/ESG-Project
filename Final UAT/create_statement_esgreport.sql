-- Table: olapts.esgreport

-- DROP TABLE olapts.esgreport;

CREATE TABLE olapts.esgreport
(
    record_type smallint,
    as_of_dt text COLLATE pg_catalog."default",
    src_stm_code character(5) COLLATE pg_catalog."default",
    unq_asses_id character(40) COLLATE pg_catalog."default",
    inv_pty_rtg_ent_id character(10) COLLATE pg_catalog."default",
    inv_pty_rtg_oblg_tax_id character(20) COLLATE pg_catalog."default",
    inv_pty_rtg_oblg_cdi_code character(10) COLLATE pg_catalog."default",
    inv_pty_rtg_esg_ev_dt character(8) COLLATE pg_catalog."default",
    inv_pty_rtg_esg_stm_rtrvl_dt character(8) COLLATE pg_catalog."default",
    inv_pty_rtg_esg_asses_dt character(8) COLLATE pg_catalog."default",
    inv_pty_aprv_rtg_aprv_dt character(8) COLLATE pg_catalog."default",
    inv_pty_rtg_cr_cmte_dt character(8) COLLATE pg_catalog."default",
    inv_pty_rtg_next_rvw_dt character(8) COLLATE pg_catalog."default",
    inv_pty_rtg_aprv_ahr_id character(5) COLLATE pg_catalog."default",
    inv_pty_rtg_anl_nm character(50) COLLATE pg_catalog."default",
    inv_pty_rtg_ovrd_rsn_tp_id character(5) COLLATE pg_catalog."default",
    inv_pty_rtg_aprv_nm character(50) COLLATE pg_catalog."default",
    inv_pty_rtg_bsn_prtf character(5) COLLATE pg_catalog."default",
    inv_pty_rtg_ovrd_drvr character(5) COLLATE pg_catalog."default",
    inv_pty_rtg_tp character(5) COLLATE pg_catalog."default",
    inv_pty_rtg_envrnm_scor character(17) COLLATE pg_catalog."default",
    inv_pty_rtg_envrnm_zon character(5) COLLATE pg_catalog."default",
    inv_pty_rtg_scl_scor character(17) COLLATE pg_catalog."default",
    inv_pty_rtg_scl_zon character(5) COLLATE pg_catalog."default",
    inv_pty_rtg_gvrnc_scor character(17) COLLATE pg_catalog."default",
    inv_pty_rtg_gvrnc_zon character(5) COLLATE pg_catalog."default",
    inv_pty_rtg_esg_scor character(17) COLLATE pg_catalog."default",
    inv_pty_rtg_esg_zon character(5) COLLATE pg_catalog."default",
    inv_pty_rtg_tp_sctr character(100) COLLATE pg_catalog."default",
    quest_id character(50) COLLATE pg_catalog."default",
    quest_vrsn character(50) COLLATE pg_catalog."default",
    oblg_rgstrn_num character(50) COLLATE pg_catalog."default",
    jrsctn character(5) COLLATE pg_catalog."default"
)
WITH (
    OIDS = FALSE
)
TABLESPACE olap_data;

ALTER TABLE olapts.esgreport
    OWNER to olap;