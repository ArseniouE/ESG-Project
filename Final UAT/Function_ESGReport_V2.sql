-- FUNCTION: olapts.esgreport(date)

-- DROP FUNCTION olapts.esgreport(date);

CREATE OR REPLACE FUNCTION olapts.esgreport(
	ref_date date)
    RETURNS boolean
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE PARALLEL UNSAFE
AS $BODY$
declare
 pl_status boolean:=FALSE;
begin
	
	TRUNCATE TABLE olapts.esgreport; 
	
----------------------------ESG Obligor Report---------------------------------

drop table if exists latest_assessment;
create temporary table latest_assessment as
select distinct on (assess.pkid_,entity.gc18, entity.cdicode)  
			   assess.pkid_ 
        	  ,assess.entityid 
        	  ,entity.gc18::char(20) gc18 
        	  ,case when ltrim(entity.gc18::char(20),'0') in ('999999999','777777777') --non 999999999, 777777777
			        or (ltrim(entity.gc18::char(20),'0') ~* '[a-z]')=true --non alphanumeric
        	  		or (ltrim(entity.gc18::char(20),'0') ~* '[α-ω]')=true --non alphanumeric
					or (ltrim(entity.gc18::char(20),'0')~*'[Α-Ω]')=true --non alphanumeric
					or (ltrim(entity.gc18::char(20),'0')~*'[A-Z]')=true --non alphanumeric
					or coalesce(entity.gc18,'0') ~ '^[0]+$' --non zero		
				    then '000000000'::char(20) 
					else ltrim(entity.gc18::char(20),'0')::char(20) 
			   end as gc18_new							
        	  --,case when entity.cdicode in ('999999999','777777777') or (entity.cdicode ~* '[a-z]')=true or (entity.cdicode ~* '[α-ω]')=true or (entity.cdicode~*'[Α-Ω]')=true or (entity.cdicode~*'[A-Z]')=true 
        	  --		then '000000000'::char(10) 
        	  --		else entity.cdicode::char(10) 
        	  --		end	as cdicode_new
        	  ,entity.cdicode::char(10) 
              ,case when entity.industrycode in (select nace_lookup.key_ from olapts.nace_industry_lookup) then industrycode 
        	        when entity.industrycode not in (select nace_lookup.key_ from olapts.nace_industry_lookup) and industrycode <>'' then '-100' 
        	        else null	
        	   end as industrycode 
        	  ,assess.questionnairedate 
        	  ,assess.assessmentdate 
        	  ,assess.approvaldate 
        	  ,assess.creditcommitteedate 
        	  ,assess.nextreviewdate 
              ,case when entity.creditcommittee in (select key_ from olapts.Credit_Committee_Lookup) then datamart_value 
        	        when entity.creditcommittee not in (select key_ from olapts.Credit_Committee_Lookup) and creditcommittee <>'' then '-100' 
        	        else null	
        	   end as creditcommittee 
        	  ,assess.assessmentuser
        	  ,assess.overridereason 
        	  ,approvaluser 
        	  ,case when entity.businessportfolio in (select key_ from olapts.businessportolio_lookup) then businessportfolio 
        	        when entity.businessportfolio not in (select key_ from olapts.businessportolio_lookup) and businessportfolio <>'' then '-100' 
        	        else null	
        	   end as businessportfolio 
        	  ,assess.overridedriver 
        	  ,case when assess.overridegrade is null then '01' --systemic 
        	        else '02' --override
        	   end as overridegrade 
        	  ,case when assess.esubscore::decimal(19,2) >0 then concat('+',assess.esubscore)
        	           when assess.esubscore::decimal(19,2) <0 then concat('-',assess.esubscore)
        	           else null
                  end as esubscore 
        	  ,case when assess.ezoneoutcome = 'red'   then '01'
        	        when assess.ezoneoutcome = 'amber' then '02'
        	        when assess.ezoneoutcome = 'green' then '03'
        	        when assess.ezoneoutcome not in ('red','amber','green') and assess.ezoneoutcome is not null then '-100'
        	        else null
                end as ezoneoutcome 
        	  ,case when assess.ssubscore::decimal(19,2) >0 then concat('+',assess.ssubscore)
        	        when assess.ssubscore::decimal(19,2) <0 then concat('-',assess.ssubscore)
        	        else null
               end as ssubscore 
        	  ,case when assess.szoneoutcome = 'red'   then '01'
        	        when assess.szoneoutcome = 'amber' then '02'
        	        when assess.szoneoutcome = 'green' then '03'
        	        when assess.szoneoutcome not in ('red','amber','green') and assess.szoneoutcome is not null then '-100'
        	        else null
               end as szoneoutcome 
        	  ,case when assess.gsubscore::decimal(19,2) >0 then concat('+',assess.gsubscore)
        	        when assess.gsubscore::decimal(19,2) <0 then concat('-',assess.gsubscore)
        	        else null
               end as gsubscore 
        	  ,case when assess.gzoneoutcome = 'red'   then '01'
        	        when assess.gzoneoutcome = 'amber' then '02'
        	        when assess.gzoneoutcome = 'green' then '03'
        	        when assess.gzoneoutcome not in ('red','amber','green') and assess.gzoneoutcome is not null then '-100'
        	        else null
                end as gzoneoutcome 
        	  ,case when assess.totalesgscore::decimal(19,2) >0 then concat('+',assess.totalesgscore)
        	        when assess.totalesgscore::decimal(19,2) <0 then concat('-',assess.totalesgscore)
        	        else null
               end as totalesgscore 
        	  ,case when assess.esgzonesoutcome = 'red'   then '01'
        	        when assess.esgzonesoutcome = 'amber' then '02'
        	        when assess.esgzonesoutcome = 'green' then '03'
        	        when assess.esgzonesoutcome not in ('red','amber','green') and assess.esgzonesoutcome is not null then '-100'
        	        else null
               end as esgzonesoutcome 
        	  ,case when assess.questionnairetype is not null and nace_lookup.value_ is not null and nace_lookup.Key_ is not null 
        	        then concat(assess.questionnairetype,'/',nace_lookup.value_,'',nace_lookup.Key_)
        	        else null
        	   end as questionnairetype 
        	  ,assess.questionnaireid 
        	  ,assess.questionnaireversion 
        	  ,entity.registrationnumber 
        	  ,entity.jurisdiction 
			  ,assess.sourcepopulateddate_ as sourcepopulateddate_assess
from olapts.factesgassessment assess
left join olapts.factentity entity on assess.entityid::int = entity.entityid and assess.entityversionid::int = entity.versionid_ 
left join olapts.nace_industry_lookup nace_lookup on entity.industrycode = nace_lookup.Key_ 
left join olapts.Credit_Committee_Lookup creditcommitte_lookup on entity.creditcommittee = creditcommitte_lookup.key_ 
where assess.authorizationflag  --isapproved
	  --and assess.islatestversion_ 
	  and assess.expirationdate is null 
	  and assess.sourcepopulateddate_ <= cast(ref_date as date) + time '23:59:59'	 	  
order by assess.pkid_, entity.gc18, entity.cdicode, assess.sourcepopulateddate_ desc;
 
---------------------FINAL_TABLE--------------------

insert into olapts.esgreport (
select distinct on (case when INV_PTY_RTG_OBLG_TAX_ID != '000000000'  then INV_PTY_RTG_OBLG_TAX_ID else INV_PTY_RTG_OBLG_CDI_CODE end) *	
from (
	  select distinct on (INV_PTY_RTG_OBLG_TAX_ID, INV_PTY_RTG_OBLG_CDI_CODE) 
        	'2'::smallint as RECORD_TYPE
        	,ref_date AS AS_OF_DT --parameter
        	,'SDP'::char(5) as SRC_STM_CODE
        	,coalesce(pkid_::char(40),'') UNQ_ASSES_ID  
        	,coalesce(entityid::char(10),'') INV_PTY_RTG_ENT_ID
        	,coalesce(gc18_new,'')::char(20) as INV_PTY_RTG_OBLG_TAX_ID 
	        ,coalesce(cdicode::char(10),'') INV_PTY_RTG_OBLG_CDI_CODE	  
        	,coalesce(industrycode,'')::char(5) INV_PTY_RTG_OBLG_NACE_CODE
        	,coalesce(TO_CHAR(questionnairedate::date,'YYYYMMDD'),'00000101')::char(8) as INV_PTY_RTG_ESG_EV_DT  
        	,coalesce(TO_CHAR(assessmentdate::date,'YYYYMMDD'),'00000101')::char(8) as INV_PTY_RTG_ESG_STM_RTRVL_DT  
        	,coalesce(TO_CHAR(assessmentdate::date,'YYYYMMDD'),'00000101')::char(8) as INV_PTY_RTG_ESG_ASSES_DT 	  
        	,coalesce(TO_CHAR(approvaldate::date,'YYYYMMDD'),'00000101')::char(8) as INV_PTY_APRV_RTG_APRV_DT  	  
        	,coalesce(TO_CHAR(creditcommitteedate::date,'YYYYMMDD'),'00000101')::char(8) as INV_PTY_RTG_CR_CMTE_DT  	  
        	,coalesce(TO_CHAR(nextreviewdate::date,'YYYYMMDD'),'00000101')::char(8) as INV_PTY_RTG_NEXT_RVW_DT  	  
        	,coalesce(creditcommittee,'')::char(5) INV_PTY_RTG_APRV_AHR_ID  
        	,coalesce(assessmentuser,'')::char(50) INV_PTY_RTG_ANL_NM
        	,coalesce(overridereason,'')::char(5) INV_PTY_RTG_OVRD_RSN_TP_ID  
        	,coalesce(approvaluser,'')::char(50) INV_PTY_RTG_APRV_NM
        	,coalesce(businessportfolio,'')::char(5) INV_PTY_RTG_BSN_PRTF
        	,coalesce(overridedriver,'')::char(5) INV_PTY_RTG_OVRD_DRVR  
        	,coalesce(overridegrade,'')::char(5) INV_PTY_RTG_TP 
        	,coalesce(esubscore,'N0000000,00000000')::char(18) INV_PTY_RTG_ENVRNM_SCOR	  
        	,coalesce(ezoneoutcome,'')::char(5) INV_PTY_RTG_ENVRNM_ZON
        	,coalesce(ssubscore,'N0000000,00000000')::char(18) INV_PTY_RTG_SCL_SCOR 
        	,coalesce(szoneoutcome,'')::char(5) INV_PTY_RTG_SCL_ZON  
        	,coalesce(gsubscore,'N0000000,00000000')::char(18) INV_PTY_RTG_GVRNC_SCOR  
        	,coalesce(gzoneoutcome,'')::char(5) INV_PTY_RTG_GVRNC_ZON
        	,coalesce(totalesgscore,'N0000000,00000000')::char(18) INV_PTY_RTG_ESG_SCOR  
        	,coalesce(esgzonesoutcome,'')::char(5) INV_PTY_RTG_ESG_ZON  
        	,coalesce(questionnairetype,'')::char(100) INV_PTY_RTG_TP_SCTR	  
        	,coalesce(questionnaireid,'')::char(50) QUEST_ID
        	,coalesce(questionnaireversion,'')::char(50) QUEST_VRSN
            ,coalesce(registrationnumber,'')::char(50) OBLG_RGSTRN_NUM
        	,coalesce(jurisdiction,'')::char(5) JRSCTN
from latest_assessment
order by INV_PTY_RTG_OBLG_TAX_ID, INV_PTY_RTG_OBLG_CDI_CODE, sourcepopulateddate_assess desc
)x
order by case when INV_PTY_RTG_OBLG_TAX_ID != '000000000'  then INV_PTY_RTG_OBLG_TAX_ID else INV_PTY_RTG_OBLG_CDI_CODE end, INV_PTY_RTG_OBLG_TAX_ID, INV_PTY_RTG_OBLG_CDI_CODE
);

pl_status:=TRUE;
RETURN pl_status;
EXCEPTION 
	WHEN OTHERS THEN	
		Return pl_status;		
end;
$BODY$;

ALTER FUNCTION olapts.esgreport(date)
    OWNER TO olap;

select * from olapts.esgreport('2023-12-02')
select * from olapts.esgreport_view
   
