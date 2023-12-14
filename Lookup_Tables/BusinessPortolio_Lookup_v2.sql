--select * from olapts.businessportolio_lookup order by cl_key::int
drop table if exists olapts.businessportolio_lookup;
CREATE TABLE olapts.businessportolio_lookup(
	datamart_code character varying , 
	cl_key character varying, 
	cl_value character varying
);

INSERT INTO olapts.businessportolio_lookup (datamart_code, cl_key, cl_value) VALUES (N'0951', N'30', N'ΔΙΕΥΘΥΝΣΗ ΚΑΘΥΣΤΕΡΗΣΕΩΝ ΛΙΑΝΙΚΗΣ ΤΡΑΠΕΖΙΚΗΣ')
;INSERT INTO olapts.businessportolio_lookup (datamart_code, cl_key, cl_value) VALUES (N'2000', N'31', N'ALPHA LEASING ΧΡΗΜΑΤΟΔΟΤΙΚΗΣ ΜΙΣΘΩΣΕΩΣ A.E.')
;INSERT INTO olapts.businessportolio_lookup (datamart_code, cl_key, cl_value) VALUES (N'8144', N'32', N'ΔΙΕΥΘΥΝΣΗ ΟΡΙΣΤΙΚΩΝ ΚΑΘΥΣΤΕΡΗΣΕΩΝ WHOLESALE BANKING')
;INSERT INTO olapts.businessportolio_lookup (datamart_code, cl_key, cl_value) VALUES (N'8145', N'33', N'ΚΕΝΤΡΟ ΑΠΑΙΤΗΣΕΩΝ ΕΙΔΙΚΟΥ ΧΕΙΡΙΣΜΟΥ ΜΕΣΑΙΩΝ ΕΠΙΧΕΙΡΗΣΕΩΝ')
;INSERT INTO olapts.businessportolio_lookup (datamart_code, cl_key, cl_value) VALUES (N'8252', N'34', N'ΔΙΕΥΘΥΝΣΗ ΣΥΝΑΛΛΑΓΩΝ ΚΑΘΥΣΤΕΡΗΣΕΩΝ WB – ΕΛΛΑΔΑ')
;INSERT INTO olapts.businessportolio_lookup (datamart_code, cl_key, cl_value) VALUES (N'8887', N'35', N'ΔΙΕΥΘΥΝΣΗ ΚΑΘΥΣΤΕΡΗΣΕΩΝ ΕΠΙΧΕΙΡΗΣΕΩΝ – PROBATION')
;INSERT INTO olapts.businessportolio_lookup (datamart_code, cl_key, cl_value) VALUES (N'8888', N'36', N'ΛΟΙΠΟΙ ΠΕΛΑΤΕΣ SME')
;INSERT INTO olapts.businessportolio_lookup (datamart_code, cl_key, cl_value) VALUES (N'9144', N'37', N'ΚΕΝΤΡΟ ΑΝΑΔΙΑΡΘΡΩΣΕΩΣ ΟΡΙΣΤΙΚΩΝ ΚΑΘΥΣΤΕΡΗΣΕΩΝ ΜΕΣΑΙΩΝ ΕΠΙΧΕΙΡΗΣΕΩΝ')
;INSERT INTO olapts.businessportolio_lookup (datamart_code, cl_key, cl_value) VALUES (N'9145', N'38', N'ΔΙΕΥΘΥΝΣΗ ΣΥΝΑΛΛΑΓΩΝ ΚΑΘΥΣΤΕΡΗΣΕΩΝ WB – ΕΞΩΤΕΡΙΚΟ')
;INSERT INTO olapts.businessportolio_lookup (datamart_code, cl_key, cl_value) VALUES (N'9162', N'39', N'LUXEMBURG BRANCH')
;INSERT INTO olapts.businessportolio_lookup (datamart_code, cl_key, cl_value) VALUES (N'9163', N'40', N'CEPAL CORE PROBATION  Ι (CORPORATE)')
;INSERT INTO olapts.businessportolio_lookup (datamart_code, cl_key, cl_value) VALUES (N'9164', N'41', N'CEPAL CORE PROBATION II (SME)')
;INSERT INTO olapts.businessportolio_lookup (datamart_code, cl_key, cl_value) VALUES (N'9165', N'42', N'CEPAL CORE PROBATION III (SHIPPING)')
;INSERT INTO olapts.businessportolio_lookup (datamart_code, cl_key, cl_value) VALUES (N'9250', N'43', N'LONDON BRANCH')
;INSERT INTO olapts.businessportolio_lookup (datamart_code, cl_key, cl_value) VALUES (N'9251', N'44', N'ΔΙΕΥΘΥΝΣΗ ΣΥΝΑΛΛΑΓΩΝ ΚΑΘΥΣΤΕΡΗΣΕΩΝ WB – PROBATION')
;INSERT INTO olapts.businessportolio_lookup (datamart_code, cl_key, cl_value) VALUES (N'9252', N'45', N'ΚΕΝΤΡΟ ΑΠΑΙΤΗΣΕΩΝ ΕΙΔΙΚΟΥ ΧΕΙΡΙΣΜΟΥ CORPORATE BANKING')
;INSERT INTO olapts.businessportolio_lookup (datamart_code, cl_key, cl_value) VALUES (N'9253', N'46', N'ΔΚΕΕσ - Αναγγελίες Shipping')
;INSERT INTO olapts.businessportolio_lookup (datamart_code, cl_key, cl_value) VALUES (N'9254', N'47', N'ΔΚΕΕσ - Αναγγελίες Project Finance')
;INSERT INTO olapts.businessportolio_lookup (datamart_code, cl_key, cl_value) VALUES (N'9256', N'48', N'ΔΙΕΥΘΥΝΣΗ ΣΥΝΑΛΛΑΓΩΝ ΚΑΘΥΣΤΕΡΗΣΕΩΝ WB - ΧΑΡΤΟΦΥΛΑΚΙΑ ΣΕ ΠΛΑΤΦΟΡΜΕΣ')
;INSERT INTO olapts.businessportolio_lookup (datamart_code, cl_key, cl_value) VALUES (N'9257', N'49', N'ΔΙΕΥΘΥΝΣΗ ΥΠΟΣΤ.ΚΑΘΥΣΤΕΡΗΣΕΩΝ WB-ΧΑΡΤΟΦΥΛΑΚΙΑ ΠΡΟΣ ΠΩΛΗΣΗ')
;INSERT INTO olapts.businessportolio_lookup (datamart_code, cl_key, cl_value) VALUES (N'9258', N'50', N'LONDON BRANCH - ARREARS UNIT')
;INSERT INTO olapts.businessportolio_lookup (datamart_code, cl_key, cl_value) VALUES (N'9259', N'51', N'LUXEMBURG BRANCH - ARREARS UNIT')
;INSERT INTO olapts.businessportolio_lookup (datamart_code, cl_key, cl_value) VALUES (N'9260', N'52', N'NSRM')
;INSERT INTO olapts.businessportolio_lookup (datamart_code, cl_key, cl_value) VALUES (N'9261', N'53', N'CEPAL CORE REMEDIAL')
;INSERT INTO olapts.businessportolio_lookup (datamart_code, cl_key, cl_value) VALUES (N'9262', N'54', N'CEPAL CORE LEGAL')
;INSERT INTO olapts.businessportolio_lookup (datamart_code, cl_key, cl_value) VALUES (N'9263', N'55', N'CEPAL CORE SHIPPING')
;INSERT INTO olapts.businessportolio_lookup (datamart_code, cl_key, cl_value) VALUES (N'9264', N'56', N'GALAXY LEGAL')
;INSERT INTO olapts.businessportolio_lookup (datamart_code, cl_key, cl_value) VALUES (N'9265', N'57', N'GALAXY REMEDIAL')
;INSERT INTO olapts.businessportolio_lookup (datamart_code, cl_key, cl_value) VALUES (N'9266', N'58', N'NSRM &#8211; SOLAR')
;INSERT INTO olapts.businessportolio_lookup (datamart_code, cl_key, cl_value) VALUES (N'9267', N'59', N'NSRM &#8211; INTERNATIONAL')
;INSERT INTO olapts.businessportolio_lookup (datamart_code, cl_key, cl_value) VALUES (N'9268', N'60', N'CEPAL CORE WRITTEN-OFF')
;INSERT INTO olapts.businessportolio_lookup (datamart_code, cl_key, cl_value) VALUES (N'923', N'3', N'ΕΚΑ-1')
;INSERT INTO olapts.businessportolio_lookup (datamart_code, cl_key, cl_value) VALUES (N'924', N'4', N'ΕΚΑ-2')
;INSERT INTO olapts.businessportolio_lookup (datamart_code, cl_key, cl_value) VALUES (N'926', N'6', N'ΕΚΑ-4')
;INSERT INTO olapts.businessportolio_lookup (datamart_code, cl_key, cl_value) VALUES (N'928', N'8', N'ΕΚ-ΘΕΣΣΑΛΟΝΙΚΗΣ')
;INSERT INTO olapts.businessportolio_lookup (datamart_code, cl_key, cl_value) VALUES (N'931', N'11', N'ΕΚ-ΘΕΣΣΑΛΙΑΣ')
;INSERT INTO olapts.businessportolio_lookup (datamart_code, cl_key, cl_value) VALUES (N'933', N'20', N'Διεύθυνση Χρημ/σεων Τουριστικών και Νησιωτ.Επιχ')
;INSERT INTO olapts.businessportolio_lookup (datamart_code, cl_key, cl_value) VALUES (N'941', N'22', N'Δ/ΝΣΗ ΤΡΑΠΕΖΙΚΗΣ ΜΙΚΡΩΝ ΕΠΙΧΕΙΡΗΣΕΩΝ')
;INSERT INTO olapts.businessportolio_lookup (datamart_code, cl_key, cl_value) VALUES (N'9161', N'21', N'ΔΝΣΗ ΧΡΗΜΑΤΟΟΙΚΟΝΟΜΙΚΗΣ ΔΙΑΧΕΙΡΙΣΕΩΣ')
;INSERT INTO olapts.businessportolio_lookup (datamart_code, cl_key, cl_value) VALUES (N'9198', N'2', N'Δ/ΝΣΗ CORPORATE BANKING')
;INSERT INTO olapts.businessportolio_lookup (datamart_code, cl_key, cl_value) VALUES (N'9248', N'15', N'Δ/ΝΣΗ ΝΑΥΤΙΛΙΑΚΩΝ ΕΡΓΑΣΙΩΝ')
;INSERT INTO olapts.businessportolio_lookup (datamart_code, cl_key, cl_value) VALUES (N'9249', N'14', N'Δ/ΝΣΗ ΣΥΝΘΕΤΩΝ ΧΡΗΜΑΤΟΔΟΤΗΣΕΩΝ')
;INSERT INTO olapts.businessportolio_lookup (datamart_code, cl_key, cl_value) VALUES (N'950', N'17', N'Δ/ΝΣΗ PRIVATE BANKING')
;INSERT INTO olapts.businessportolio_lookup (datamart_code, cl_key, cl_value) VALUES (N'925', N'24', N'ΕΠΙΧΕΙΡΗΜΑΤΙΚΟ ΚΕΝΤΡΟ ΘΕΣΣΑΛΟΝΙΚΗΣ,ΚΕΝΤΡΙΚΗΣ ΚΑΙ ΔΥΤΙΚΗΣ ΜΑΚΕΔΟΝΙΑΣ')
;INSERT INTO olapts.businessportolio_lookup (datamart_code, cl_key, cl_value) VALUES (N'932', N'23', N'ΕΠΙΧΕΙΡΗΜΑΤΙΚΟ ΚΕΝΤΡΟ ΔΥΤΙΚΗΣ ΑΤΤΙΚΗΣ,ΠΕΛΟΠΟΝΝΗΣΟΥ ΚΑΙ ΔΥΤΙΚΗΣ ΣΤΕΡΕΑΣ ΕΛΛΑΔΑΣ')
;INSERT INTO olapts.businessportolio_lookup (datamart_code, cl_key, cl_value) VALUES (N'9160', N'18', N'Δ/ΝΣΗ ΠΩΛΗΣΕΩΝ ΧΡΗΜΑΤΟΟΙΚ. ΠΡΟΙΟΝΤΩΝ')
;INSERT INTO olapts.businessportolio_lookup (datamart_code, cl_key, cl_value) VALUES (N'9411', N'25', N'ΔΙΕΥΘΥΝΣΗ ΤΡΑΠΕΖΙΚΗΣ ΜΙΚΡΩΝ ΕΠΙΧΕΙΡΗΣΕΩΝ-W')
;INSERT INTO olapts.businessportolio_lookup (datamart_code, cl_key, cl_value) VALUES (N'-9996', N'16', N'ABC FACTORS')
;INSERT INTO olapts.businessportolio_lookup (datamart_code, cl_key, cl_value) VALUES (N'9999', N'9999', N'OTHER')






