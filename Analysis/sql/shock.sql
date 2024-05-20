SELECT DISTINCT patientunitstayid,treatmentstring,treatmentoffset
FROM `physionet-data.eicu_crd.treatment`
WHERE treatmentOffset BETWEEN 0 AND 1440
  AND treatmentstring LIKE '%shock%';
