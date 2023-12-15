--select * from olapts.businessportolio_lookup order by cl_key::int
drop table if exists olapts.businessportfolio_lookup;
CREATE TABLE olapts.businessportfolio_lookup(
	businessportfoliokey_ character varying , 
	businessportfoliovalue character varying, 
	datamart_code character varying,
	datamart_description character varying
);

INSERT INTO olapts.businessportfolio_lookup (businessportfoliokey_, businessportfoliovalue, datamart_code, datamart_description) VALUES (N'1', N'ICAP', N'999999', N'ICAP')
;INSERT INTO olapts.businessportfolio_lookup (businessportfoliokey_, businessportfoliovalue, datamart_code, datamart_description) VALUES (N'2', N'Δ/ΝΣΗ CORPORATE BANKING', N'9198', N'ΔΙΕΥΘΥΝΣΗ CORPORATE BANKING')
;INSERT INTO olapts.businessportfolio_lookup (businessportfoliokey_, businessportfoliovalue, datamart_code, datamart_description) VALUES (N'3', N'ΕΠΙΧΕΙΡΗΜΑΤΙΚΟ ΚΕΝΤΡΟ ΑΘΗΝΩΝ ΚΑΙ ΒΟΙΩΤΙΑΣ', N'923', N'ΕΠΙΧΕΙΡΗΜΑΤΙΚΟ ΚΕΝΤΡΟ ΑΘΗΝΩΝ ΚΑΙ ΒΟΙΩΤΙΑΣ')
;INSERT INTO olapts.businessportfolio_lookup (businessportfoliokey_, businessportfoliovalue, datamart_code, datamart_description) VALUES (N'4', N'ΕΠΙΧΕΙΡΗΜΑΤΙΚΟ ΚΕΝΤΡΟ ΑΝΑΤΟΛΙΚΗΣ ΚΑΙ ΝΟΤΙΑΣ ΑΤΤΙΚΗΣ', N'924', N'ΕΠΙΧΕΙΡΗΜΑΤΙΚΟ ΚΕΝΤΡΟ ΑΝΑΤΟΛΙΚΗΣ ΚΑΙ ΝΟΤΙΑΣ ΑΤΤΙΚΗΣ')
;INSERT INTO olapts.businessportfolio_lookup (businessportfoliokey_, businessportfoliovalue, datamart_code, datamart_description) VALUES (N'6', N'ΕΠΙΧΕΙΡΗΜΑΤΙΚΟ ΚΕΝΤΡΟ ΒΟΡΕΙΑΣ ΑΤΤΙΚΗΣ ΚΑΙ ΕΥΒΟΙΑΣ', N'926', N'ΕΠΙΧΕΙΡΗΜΑΤΙΚΟ ΚΕΝΤΡΟ ΒΟΡΕΙΑΣ ΑΤΤΙΚΗΣ ΚΑΙ ΕΥΒΟΙΑΣ')
;INSERT INTO olapts.businessportfolio_lookup (businessportfoliokey_, businessportfoliovalue, datamart_code, datamart_description) VALUES (N'8', N'ΕΠΙΧΕΙΡΗΜΑΤΙΚΟ ΚΕΝΤΡΟ ΘΕΣΣΑΛΟΝΙΚΗΣ, ΑΝΑΤΟΛΙΚΗΣ ΜΑΚΕΔΟΝΙΑΣ ΚΑΙ ΘΡΑΚΗΣ', N'928', N'ΕΠΙΧΕΙΡΗΜΑΤΙΚΟ ΚΕΝΤΡΟ ΘΕΣΣΑΛΟΝΙΚΗΣ, ΑΝΑΤΟΛΙΚΗΣ  ΜΑΚΕΔΟΝΙΑΣ ΚΑΙ ΘΡΑΚΗΣ')
;INSERT INTO olapts.businessportfolio_lookup (businessportfoliokey_, businessportfoliovalue, datamart_code, datamart_description) VALUES (N'11', N'ΕΠΙΧΕΙΡΗΜΑΤΙΚΟ ΚΕΝΤΡΟ ΚΕΝΤΡΙΚΗΣ ΕΛΛΑΔΑΣ ΚΑΙ ΗΠΕΙΡΟΥ', N'931', N'ΕΠΙΧΕΙΡΗΜΑΤΙΚΟ ΚΕΝΤΡΟ ΚΕΝΤΡΙΚΗΣ ΕΛΛΑΔΟΣ ΚΑΙ ΗΠΕΙΡΟΥ')
;INSERT INTO olapts.businessportfolio_lookup (businessportfoliokey_, businessportfoliovalue, datamart_code, datamart_description) VALUES (N'14', N'Δ/ΝΣΗ ΣΥΝΘΕΤΩΝ ΧΡΗΜΑΤΟΔΟΤΗΣΕΩΝ', N'9249', N'ΔΙΕΥΘΥΝΣΗ ΣΥΝΘΕΤΩΝ ΧΡΗΜΑΤΟΔΟΤΗΣΕΩΝ')
;INSERT INTO olapts.businessportfolio_lookup (businessportfoliokey_, businessportfoliovalue, datamart_code, datamart_description) VALUES (N'15', N'Δ/ΝΣΗ ΝΑΥΤΙΛΙΑΚΩΝ ΕΡΓΑΣΙΩΝ', N'9248', N'ΔΙΕΥΘΥΝΣΗ ΝΑΥΤΙΛΙΑΚΩΝ ΕΡΓΑΣΙΩΝ')
;INSERT INTO olapts.businessportfolio_lookup (businessportfoliokey_, businessportfoliovalue, datamart_code, datamart_description) VALUES (N'16', N'ABC FACTORS', N'2001', N'ABC FACTORS ΠΡΑΚΤΟΡΕΙΑ ΕΠΙΧΕΙΡΗΜΑΤΙΚΩΝ ΑΠΑΙΤΗΣΕΩΝ A.E.')
;INSERT INTO olapts.businessportfolio_lookup (businessportfoliokey_, businessportfoliovalue, datamart_code, datamart_description) VALUES (N'17', N'Δ/ΝΣΗ PRIVATE BANKING', N'950', N'ΔΙΕΥΘΥΝΣΗ PRIVATE BANKING')
;INSERT INTO olapts.businessportfolio_lookup (businessportfoliokey_, businessportfoliovalue, datamart_code, datamart_description) VALUES (N'18', N'Δ/ΝΣΗ ΠΩΛΗΣΕΩΝ ΧΡΗΜΑΤΟΟΙΚ.ΠΡΟΪΟΝΤΩΝ', N'9160', N'ΔΙΕΥΘΥΝΣΗ ΠΩΛΗΣΕΩΝ ΧΡΗΜΑΤΟΟΙΚΟΝΟΜΙΚΩΝ ΠΡΟΙΟΝΤΩΝ')
;INSERT INTO olapts.businessportfolio_lookup (businessportfoliokey_, businessportfoliovalue, datamart_code, datamart_description) VALUES (N'20', N'Δ/ΝΣΗ ΧΡΗΜ/ΣΕΩΝ ΤΟΥΡΙΣΤΙΚΩΝ & ΝΗΣΙΩΤΙΚΩΝ ΕΠΙΧΕΙΡΗΣΕΩΝ', N'933', N'ΔΙΕΥΘΥΝΣΗ ΧΡΗΜΑΤΟΔΟΤΗΣΕΩΝ ΤΟΥΡΙΣΤΙΚΩΝ ΚΑΙ ΝΗΣΙΩΤΙΚΩΝ ΕΠΙΧΕΙΡΗΣΕΩΝ')
;INSERT INTO olapts.businessportfolio_lookup (businessportfoliokey_, businessportfoliovalue, datamart_code, datamart_description) VALUES (N'21', N'Δ/ΝΣΗ ΧΡΗΜΑΤΟΟΙΚΟΝΟΜΙΚΗΣ ΔΙΑΧΕΙΡΙΣΕΩΣ', N'9161', N'ΔΙΕΥΘΥΝΣΗ ΧΡΗΜΑΤΟΟΙΚΟΝΟΜΙΚΗΣ ΔΙΑΧΕΙΡΙΣΕΩΣ')
;INSERT INTO olapts.businessportfolio_lookup (businessportfoliokey_, businessportfoliovalue, datamart_code, datamart_description) VALUES (N'22', N'Δ/ΝΣΗ ΤΡΑΠΕΖΙΚΗΣ ΜΙΚΡΩΝ ΕΠΙΧΕΙΡΗΣΕΩΝ', N'941', N'ΔΙΕΥΘΥΝΣΗ ΤΡΑΠΕΖΙΚΗΣ ΜΙΚΡΩΝ ΕΠΙΧΕΙΡΗΣΕΩΝ')
;INSERT INTO olapts.businessportfolio_lookup (businessportfoliokey_, businessportfoliovalue, datamart_code, datamart_description) VALUES (N'23', N'ΕΠΙΧΕΙΡΗΜΑΤΙΚΟ ΚΕΝΤΡΟ ΔΥΤΙΚΗΣ ΑΤΤΙΚΗΣ, ΠΕΛΟΠΟΝΝΗΣΟΥ ΚΑΙ ΔΥΤΙΚΗΣ ΣΤΕΡΕΑΣ ΕΛΛΑΔΟΣ',	N'932',	N'ΕΠΙΧΕΙΡΗΜΑΤΙΚΟ ΚΕΝΤΡΟ ΔΥΤΙΚΗΣ ΑΤΤΙΚΗΣ, ΠΕΛΟΠΟΝΝΗΣΟΥ ΚΑΙ ΔΥΤΙΚΗΣ ΣΤΕΡΕΑΣ ΕΛΛΑΔΟΣ')
;INSERT INTO olapts.businessportfolio_lookup (businessportfoliokey_, businessportfoliovalue, datamart_code, datamart_description) VALUES (N'24', N'ΕΠΙΧΕΙΡΗΜΑΤΙΚΟ ΚΕΝΤΡΟ ΘΕΣΣΑΛΟΝΙΚΗΣ, ΚΕΝΤΡΙΚΗΣ ΚΑΙ ΔΥΤΙΚΗΣ ΜΑΚΕΔΟΝΙΑΣ', N'925', N'ΕΠΙΧΕΙΡΗΜΑΤΙΚΟ ΚΕΝΤΡΟ ΘΕΣΣΑΛΟΝΙΚΗΣ, ΚΕΝΤΡΙΚΗΣ ΚΑΙ ΔΥΤΙΚΗΣ ΜΑΚΕΔΟΝΙΑΣ')
;INSERT INTO olapts.businessportfolio_lookup (businessportfoliokey_, businessportfoliovalue, datamart_code, datamart_description) VALUES (N'25', N'Δ/ΝΣΗ ΤΡΑΠΕΖΙΚΗΣ ΜΙΚΡΩΝ ΕΠΙΧΕΙΡΗΣΕΩΝ–W', N'9411', N'ΔΙΕΥΘΥΝΣΗ ΤΡΑΠΕΖΙΚΩΝ ΜΙΚΡΩΝ ΕΠΙΧΕΙΡΗΣΕΩΝ - W')


