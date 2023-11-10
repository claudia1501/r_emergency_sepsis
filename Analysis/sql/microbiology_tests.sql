-- VARIABLE DEL MODELO (CONFOUNDER) RESISTENTES O NO
SELECT 
  patientunitstayid,
  sensitivitylevel,
  CASE 
    WHEN sensitivitylevel IS NOT NULL AND TRIM(sensitivitylevel) = '' THEN '0'
    WHEN sensitivitylevel = 'Resistant' THEN '1'
    ELSE '0'
  END AS sensitivity_counf
FROM `physionet-data.eicu_crd.microlab`
GROUP BY patientunitstayid, sensitivitylevel;
