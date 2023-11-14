SELECT 
  patientunitstayid,
  MAX(
    CASE 
      WHEN sensitivitylevel = 'Resistant' THEN 'Resistant'
      WHEN sensitivitylevel IN ('Sensitive', 'Intermediate') THEN 'No resistant'
      WHEN sensitivitylevel = '' THEN 'No infection'
      ELSE sensitivitylevel
    END
  ) AS sensitivity_level
FROM `physionet-data.eicu_crd.microlab`
GROUP BY patientunitstayid;

