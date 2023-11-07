SELECT patientunitstayid,sensitivitylevel
FROM `physionet-data.eicu_crd.microlab` 
WHERE sensitivitylevel = 'Resistant'
GROUP BY patientunitstayid, sensitivitylevel
ORDER BY patientunitstayid ASC
