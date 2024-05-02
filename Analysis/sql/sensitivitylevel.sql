--- We take variable sensitivity_level to divide the values into three categories: 
--- resistant = resitant; sensitive and intermediate = not resistant; na or empty 
--- values ​​= no infection. All this is collected in a new variable called bact_resist_level
SELECT 
  patientunitstayid,
  MAX(
    CASE 
      WHEN sensitivitylevel = 'Resistant' THEN 'Resistant'
      WHEN sensitivitylevel IN ('Sensitive', 'Intermediate') THEN 'Not resistant'
      WHEN sensitivitylevel = '' THEN 'No infection'
      ELSE sensitivitylevel
    END
  ) AS bact_resist_level
FROM `physionet-data.eicu_crd.microlab`
GROUP BY patientunitstayid;

