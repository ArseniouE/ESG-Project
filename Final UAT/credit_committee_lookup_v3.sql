--select * from olapts.Credit_Committee_Lookup order by key_ 
drop table if exists olapts.Credit_Committee_Lookup;
CREATE TABLE olapts.Credit_Committee_Lookup(
    key_ character varying ,
    datamart_code character varying,
	datamart_description character varying
);

INSERT INTO olapts.Credit_Committee_Lookup (key_, datamart_code,datamart_description) VALUES (N'ΣΥΜΒΟΥΛΙΟ ΠΙΣΤΟΔΟΤΗΣΕΩΝ ABC FACTORS', N'1051', N'ABC FACTORS - ΣΥΜΒΟΥΛΙΟ ΠΙΣΤΟΔΟΤΗΣΕΩΝ ABC FACTORS')
;INSERT INTO olapts.Credit_Committee_Lookup (key_, datamart_code,datamart_description) VALUES (N'ABC FACTORS-ΣΥΜΒΟΥΛΙΟ ΕΡΓΑΣΙΩΝ', N'1052', N'ΑΒC FACTORS-ΣΥΜΒΟΥΛΙΟ ΕΡΓΑΣΙΩΝ')
;INSERT INTO olapts.Credit_Committee_Lookup (key_, datamart_code,datamart_description) VALUES (N'ABC FACTORS-ΣΥΜΒΟΥΛΙΟ ΕΡΓΑΣΙΩΝ ABC FACTORS', N'1053', N'ΑΒC FACTORS-ΣΥΜΒΟΥΛΙΟ ΕΡΓΑΣΙΩΝ ABC FACTORS')
;INSERT INTO olapts.Credit_Committee_Lookup (key_, datamart_code,datamart_description) VALUES (N'ABC FACTORS-ΤΜΗΜΑ ΑΞΙΟΛ ΚΙΝΔΥΝΟΥ ΟΦΕΙΛΕΤΩΝ', N'1054', N'ABC FACTORS- ΤΜΗΜΑ ΑΞΙΟΛ. ΚΙΝΔΥΝΟΥ ΟΦΕΙΛΕΤΩΝ')
;INSERT INTO olapts.Credit_Committee_Lookup (key_, datamart_code,datamart_description) VALUES (N'ABC FACTORS-ΓΕΝΙΚΗ ΔΙΕΥΘΥΝΣΗ', N'1055', N'ABC FACTORS - ΓΕΝΙΚΗ ΔΙΕΥΘΥΝΣΗ')
;INSERT INTO olapts.Credit_Committee_Lookup (key_, datamart_code,datamart_description) VALUES (N'ΣΥΜΒ. ΠΙΣΤ. W/SALE BANKING I', N'1150', N'ΣΥΜΒΟΥΛΙΟ ΠΙΣΤΟΔΟΤΗΣΕΩΝ WHOLESALE BANKING I')
;INSERT INTO olapts.Credit_Committee_Lookup (key_, datamart_code,datamart_description) VALUES (N'ΣΥΜΒ. ΠΙΣΤ. W/SALE BANKING II', N'1151', N'ΣΥΜΒΟΥΛΙΟ ΠΙΣΤΟΔΟΤΗΣΕΩΝ WHOLESALE BANKING ΙΙ')
;INSERT INTO olapts.Credit_Committee_Lookup (key_, datamart_code,datamart_description) VALUES (N'ΣΥΜΒ. ΠΙΣΤ. W/SALE BANKING III', N'1152', N'ΣΥΜΒΟΥΛΙΟ ΠΙΣΤΟΔΟΤΗΣΕΩΝ WHOLESALE BANKING ΙΙΙ')
;INSERT INTO olapts.Credit_Committee_Lookup (key_, datamart_code,datamart_description) VALUES (N'ΣΥΜΒ. ΠΙΣΤ. W/SALE BANKING IV', N'1153', N'ΣΥΜΒΟΥΛΙΟ ΠΙΣΤΟΔΟΤΗΣΕΩΝ WHOLESALE BANKING IV')
;INSERT INTO olapts.Credit_Committee_Lookup (key_, datamart_code,datamart_description) VALUES (N'ΣΥΜΒ. ΠΙΣΤ. W/SALE BANKING - ΣΥΜΒΟΥΛΙΟ Α', N'1154', N'ΣΥΜΒΟΥΛΙΑ ΠΙΣΤΟΔΟΤΗΣΕΩΝ WHOLESALE BANKING- ΣΥΜΒΟΥΛΙΟ Α')
;INSERT INTO olapts.Credit_Committee_Lookup (key_, datamart_code,datamart_description) VALUES (N'ΣΥΜΒ. ΠΙΣΤ. W/SALE BANKING - ΣΥΜΒΟΥΛΙΟ Β', N'1155', N'ΣΥΜΒΟΥΛΙΑ ΠΙΣΤΟΔΟΤΗΣΕΩΝ WHOLESALE BANKING- ΣΥΜΒΟΥΛΙΟ Β')
;INSERT INTO olapts.Credit_Committee_Lookup (key_, datamart_code,datamart_description) VALUES (N'ΣΥΜΒ. ΚΑΘΥΣΤ. W/SALE BANKING I', N'1156', N'ΣΥΜΒΟΥΛΙΟ ΚΑΘΥΣΤΕΡΗΣΕΩΝ WHOLESALE BANKING I')
;INSERT INTO olapts.Credit_Committee_Lookup (key_, datamart_code,datamart_description) VALUES (N'ΣΥΜΒ. ΚΑΘΥΣΤ. W/SALE BANKING II', N'1157', N'ΣΥΜΒΟΥΛΙΟ ΚΑΘΥΣΤΕΡΗΣΕΩΝ WHOLESALE BANKING IΙ')
;INSERT INTO olapts.Credit_Committee_Lookup (key_, datamart_code,datamart_description) VALUES (N'ΣΥΜΒ. ΚΑΘΥΣΤ. W/SALE BANKING III', N'1158', N'ΣΥΜΒΟΥΛΙΟ ΚΑΘΥΣΤΕΡΗΣΕΩΝ WHOLESALE BANKING IΙΙ')
;INSERT INTO olapts.Credit_Committee_Lookup (key_, datamart_code,datamart_description) VALUES (N'ΣΥΜΒ. ΠΙΣΤΟΔ. ΛΙΑΝ. ΤΡΑΠ. Ι', N'1161', N'ΣΥΜΒΟΥΛΙΟ ΠΙΣΤΟΔΟΤΗΣΕΩΝ ΛΙΑΝΙΚΗΣ ΤΡΑΠΕΖΙΚΗΣ I')
;INSERT INTO olapts.Credit_Committee_Lookup (key_, datamart_code,datamart_description) VALUES (N'ΣΥΜΒ. ΠΙΣΤΟΔ. ΛΙΑΝ. ΤΡΑΠ. ΙΙ', N'1162', N'ΣΥΜΒΟΥΛΙΟ ΠΙΣΤΟΔΟΤΗΣΕΩΝ ΛΙΑΝΙΚΗΣ ΤΡΑΠΕΖΙΚΗΣ II')
;INSERT INTO olapts.Credit_Committee_Lookup (key_, datamart_code,datamart_description) VALUES (N'ΣΥΜΒ. ΠΙΣΤΟΔ. ΛΙΑΝ. ΤΡΑΠ. ΙΙΙ', N'1163', N'ΣΥΜΒΟΥΛΙΟ ΠΙΣΤΟΔΟΤΗΣΕΩΝ ΛΙΑΝΙΚΗΣ ΤΡΑΠΕΖΙΚΗΣ III - (ΜΙΚΡΕΣ ΕΠΙΧΕΙΡΗΣΕΙΣ)')
;INSERT INTO olapts.Credit_Committee_Lookup (key_, datamart_code,datamart_description) VALUES (N'ΣΥΜΒ. ΠΙΣΤΟΔ. ΛΙΑΝ. ΤΡΑΠ. ΙV', N'1164', N'ΣΥΜΒΟΥΛΙΟ ΠΙΣΤΟΔΟΤΗΣΕΩΝ ΛΙΑΝΙΚΗΣ ΤΡΑΠΕΖΙΚΗΣ IV')
;INSERT INTO olapts.Credit_Committee_Lookup (key_, datamart_code,datamart_description) VALUES (N'ΣΥΜΒΟΥΛΙΟ ΠΙΣΤΟΔΟΤΗΣΕΩΝ PRIVATE BANKING I', N'1180', N'ΣΥΜΒΟΥΛΙΟ ΠΙΣΤΟΔΟΤΗΣΕΩΝ PRIVATE BANKING I')
;INSERT INTO olapts.Credit_Committee_Lookup (key_, datamart_code,datamart_description) VALUES (N'ΣΥΜΒΟΥΛΙΟ ΠΙΣΤΟΔΟΤΗΣΕΩΝ PRIVATE BANKING II', N'1181', N'ΣΥΜΒΟΥΛΙΟ ΠΙΣΤΟΔΟΤΗΣΕΩΝ PRIVATE BANKING II')
;INSERT INTO olapts.Credit_Committee_Lookup (key_, datamart_code,datamart_description) VALUES (N'CEPAL', N'1182', N'CEPAL')
