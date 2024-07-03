SELECT
distinct
  patientunitstayid, diabetes
FROM
  `physionet-data.eicu_crd.apachepredvar`
WHERE
  diabetes = 1

