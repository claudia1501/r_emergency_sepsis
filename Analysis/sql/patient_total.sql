WITH pt_age AS (
  SELECT patientunitstayid, age,
         CASE WHEN age = '> 89' THEN 90
         WHEN TRIM(age) = '' THEN NULL
         ELSE CAST(age AS NUMERIC)
         END AS age_numeric
  FROM `physionet-data.eicu_crd.patient`
)
SELECT
  p.patientunitstayid, p.gender, a.age_numeric, p.ethnicity, p.hospitaladmitoffset, p.unittype,unitdischargestatus, 
FROM
  `physionet-data.eicu_crd.patient` p
JOIN
  pt_age a
ON
  p.patientunitstayid = a.patientunitstayid
