
select 
	RECORD_TYPE
	,AS_OF_DT
	,SRC_STM_CODE
	,UNQ_ASSES_ID
	,INV_PTY_RTG_ENT_ID
	,case when gc18_new = '000000000' or gc18_new is null then cdicode_new else gc18_new end as INV_PTY_RTG_OBLG_TAX_ID 
	,INV_PTY_RTG_OBLG_CDI_CODE
	,INV_PTY_RTG_OBLG_NACE_CODE
	--,INV_PTY_RTG_ESG_EV_DT
	,INV_PTY_RTG_ESG_STM_RTRVL_DT
	,INV_PTY_RTG_ESG_ASSES_DT
	,INV_PTY_APRV_RTG_APRV_DT
	,INV_PTY_RTG_CR_CMTE_DT
	,INV_PTY_RTG_NEXT_RVW_DT
	,INV_PTY_RTG_APRV_AHR_ID
	,INV_PTY_RTG_ANL_NM
	,INV_PTY_RTG_OVRD_RSN_TP_ID
	,INV_PTY_RTG_APRV_NM
	,INV_PTY_RTG_BSN_PRTF
	,INV_PTY_RTG_OVRD_DRVR
	,INV_PTY_RTG_TP
	,INV_PTY_RTG_ENVRNM_SCORE
	,INV_PTY_RTG_ENVRNM_ZON
	,INV_PTY_RTG_SCL_SCOR
	,INV_PTY_RTG_SCL_ZON
	,INV_PTY_RTG_GVRNC_SCOR
	,INV_PTY_RTG_GVRNC_ZON
	,INV_PTY_RTG_ESG_SCOR
	,INV_PTY_RTG_ESG_ZON
	,INV_PTY_RTG_TP_SCTR
	,QUEST_ID
	,QUEST_VRSN
	,OBLG_RGSTRN_NUM
	,JRSCTN
from (
	select 
		'2'::smallint AS RECORD_TYPE
		,'20231023'::date AS AS_OF_DT
		,'SDP'::char(5) as SRC_STM_CODE
		,assess.pkid_::char(40) as UNQ_ASSES_ID
		,assess.entityid::char(10) as INV_PTY_RTG_ENT_ID
		,entity.gc18::char(20) 
		,case when entity.gc18 in ('999999999','777777777') or (entity.gc18 ~* '[a-z]')=true 
				or (entity.gc18 ~* '[α-ω]')=true or (entity.gc18~*'[Α-Ω]')=true or (entity.gc18~*'[A-Z]')=true then '000000000'::char(20) else entity.gc18::char(20) end as gc18_new
		,case when entity.cdicode in ('999999999','777777777') or (entity.cdicode ~* '[a-z]')=true or (entity.cdicode ~* '[α-ω]')=true or (entity.cdicode~*'[Α-Ω]')=true or (entity.cdicode~*'[A-Z]')=true 
				then '000000000'::char(10) 
				else entity.cdicode::char(10) 
				end	as cdicode_new
		,entity.cdicode::char(10) as INV_PTY_RTG_OBLG_CDI_CODE
		,entity.industrycode::char(5) as INV_PTY_RTG_OBLG_NACE_CODE
		--INV_PTY_RTG_ESG_EV_DT	DATE: When the questionnaire was filled at Tiresias ESGR 
		--perimenoume neo pedio
		,coalesce(assess.assessmentdate,'00000101')::date as INV_PTY_RTG_ESG_STM_RTRVL_DT --retrieveddate
		,coalesce(assess.assessmentdate,'00000101')::date as INV_PTY_RTG_ESG_ASSES_DT --scoringdate
		,coalesce(assess.approvaldate,'00000101')::date as INV_PTY_APRV_RTG_APRV_DT --approvaldate
		,coalesce(assess.creditcommitteedate,'00000101')::date as INV_PTY_RTG_CR_CMTE_DT --creditcommitteedate
		,coalesce(assess.nextreviewdate,'00000101')::date as INV_PTY_RTG_NEXT_RVW_DT --nextreviewdate
		,entity.creditcommittee::char(5) as INV_PTY_RTG_APRV_AHR_ID
		,assess.assessmentuser::char(50) as INV_PTY_RTG_ANL_NM
		,assess.overridereason::char(5) as INV_PTY_RTG_OVRD_RSN_TP_ID
		,approvaluser::char(50) as INV_PTY_RTG_APRV_NM
		,entity.businessportfolio::char(5) as INV_PTY_RTG_BSN_PRTF
		,assess.overridedriver::char(5) as INV_PTY_RTG_OVRD_DRVR
		,case when assess.overridegrade::char(5) is null then '01' --systemic 
		else '02' --override
		end as INV_PTY_RTG_TP --ratingtype --overriderating type 21 tou excel
		,assess.esubscore::numeric(16,8) as INV_PTY_RTG_ENVRNM_SCORE
		,assess.ezoneoutcome::char(5) as INV_PTY_RTG_ENVRNM_ZON
		,assess.ssubscore::numeric(16,8) as INV_PTY_RTG_SCL_SCOR
		,assess.szoneoutcome::char(5) as INV_PTY_RTG_SCL_ZON
		,assess.gsubscore::numeric(16,8) as INV_PTY_RTG_GVRNC_SCOR
		,assess.gzoneoutcome::char(5) as INV_PTY_RTG_GVRNC_ZON
		,assess.totalesgscore::numeric(16,8) as INV_PTY_RTG_ESG_SCOR
		,assess.esgzonesoutcome::char(5) as INV_PTY_RTG_ESG_ZON
		,concat(assess.questionnairetype,'\',nace_lookup.value_,'\',key_)::char(100) INV_PTY_RTG_TP_SCTR
		,assess.id_::char(50) as QUEST_ID
		,question.questionnaireversion::char(50) as QUEST_VRSN
		,entity.registrationnumber::char(50) as OBLG_RGSTRN_NUM
		,entity.jurisdiction::char(5) as JRSCTN
	from olapts.factesgassessment assess
		left join olapts.factentity entity on assess.entityid::int = entity.entityid and assess.entityversionid::int = entity.versionid_
		left join olapts.factesgquestion question on assess.pkid_=question.fkid_esgmaster and assess.versionid_=question.versionid_ and question.islatestversion_
		left join olapts.nace_industry_lookup nace_lookup on entity.industrycode = nace_lookup.Key_ 
	where assess.authorizationflag  --isapproved
			and assess.islatestversion_ 
			and assess.expirationdate is null 
)x 
	