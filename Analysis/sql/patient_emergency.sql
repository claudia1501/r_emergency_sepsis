SELECT
  patientunitstayid, hospitaladmitsource,unitadmitsource
FROM
  `physionet-data.eicu_crd.patient` 
WHERE
  hospitaladmitsource = 'Emergency Department'

