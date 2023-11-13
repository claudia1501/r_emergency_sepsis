-- ONLY RESISTANT
SELECT 
  patientunitstayid,
  'Resistant' AS sensitivity_resistant
FROM `physionet-data.eicu_crd.microlab` 
WHERE sensitivitylevel = 'Resistant'
GROUP BY patientunitstayid, sensitivity_resistant
ORDER BY patientunitstayid ASC;

