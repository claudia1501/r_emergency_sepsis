-- FILTRAR
SELECT *
FROM `physionet-data.eicu_crd.patient`
WHERE ((age IS NULL OR TRIM(age) = '') OR age >= '16') AND hospitaladmitsource = 'Emergency Department' AND apacheadmissiondx LIKE '%Sepsis%'