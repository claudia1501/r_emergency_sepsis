SELECT 
  patientunitstayid,
  CASE 
    WHEN sensitivitylevel = 'Resistant' THEN 'RESISTANT'
    WHEN sensitivitylevel IN ('Sensitive', 'Intermediate') THEN 'NO RESISTANT'
    WHEN sensitivitylevel = '' THEN 'NO INFECTION'
    ELSE sensitivitylevel
  END AS sensitivity_level
FROM `physionet-data.eicu_crd.microlab`;
