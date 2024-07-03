SELECT
distinct
  patientunitstayid
FROM
  `physionet-data.eicu_crd.apachepredvar`
WHERE
  diabetes = 1
