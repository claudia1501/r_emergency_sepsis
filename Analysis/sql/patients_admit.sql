SELECT
  patientunitstayid,unitstaytype
FROM
  `physionet-data.eicu_crd.patient` 
WHERE
  unitstaytype = 'admit'
