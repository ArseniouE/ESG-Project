----------------------------------VIEW esgreport_view----------------------------------

-- DROP VIEW olapts.esgreport_view;

CREATE OR REPLACE VIEW olapts.esgreport_view
 AS
 SELECT esgreport.record_type,
    esgreport.as_of_dt,
    esgreport.src_stm_code,
    esgreport.unq_asses_id,
    esgreport.inv_pty_rtg_ent_id,
    esgreport.inv_pty_rtg_oblg_tax_id,
    esgreport.inv_pty_rtg_oblg_cdi_code,
    esgreport.inv_pty_rtg_oblg_nace_code,
    esgreport.inv_pty_rtg_esg_ev_dt,
    esgreport.inv_pty_rtg_esg_stm_rtrvl_dt,
    esgreport.inv_pty_rtg_esg_asses_dt,
    esgreport.inv_pty_aprv_rtg_aprv_dt,
    esgreport.inv_pty_rtg_cr_cmte_dt,
    esgreport.inv_pty_rtg_next_rvw_dt,
    esgreport.inv_pty_rtg_aprv_ahr_id,
    esgreport.inv_pty_rtg_anl_nm,
    esgreport.inv_pty_rtg_ovrd_rsn_tp_id,
    esgreport.inv_pty_rtg_aprv_nm,
    esgreport.inv_pty_rtg_bsn_prtf,
    esgreport.inv_pty_rtg_ovrd_drvr,
    esgreport.inv_pty_rtg_tp,
    esgreport.inv_pty_rtg_envrnm_scor,
    esgreport.inv_pty_rtg_envrnm_zon,
    esgreport.inv_pty_rtg_scl_scor,
    esgreport.inv_pty_rtg_scl_zon,
    esgreport.inv_pty_rtg_gvrnc_scor,
    esgreport.inv_pty_rtg_gvrnc_zon,
    esgreport.inv_pty_rtg_esg_scor,
    esgreport.inv_pty_rtg_esg_zon,
    esgreport.inv_pty_rtg_tp_sctr,
    esgreport.quest_id,
    esgreport.quest_vrsn,
    esgreport.oblg_rgstrn_num,
    esgreport.jrsctn
   FROM olapts.esgreport;

ALTER TABLE olapts.esgreport_view
    OWNER TO olap;

