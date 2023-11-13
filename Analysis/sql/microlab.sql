-- VARIABLE DEL MODELO (CONFOUNDER) RESISTENTES O NO
SELECT 
  patientunitstayid,
  sensitivitylevel,
  CASE 
    WHEN sensitivitylevel = 'Resistant' THEN '1'
    WHEN sensitivitylevel = '' THEN ''  -- Para mantener los valores vacíos
    ELSE '0'
  END AS sensitivity_counf
FROM `physionet-data.eicu_crd.microlab`
GROUP BY patientunitstayid, sensitivitylevel
