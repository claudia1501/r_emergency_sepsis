SELECT
  DISTINCT patientunitstayid,
  1 AS diabetes_dos
FROM
  `physionet-data.eicu_crd.apachepredvar`
WHERE
  diabetes = 1;
