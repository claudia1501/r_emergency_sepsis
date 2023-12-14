--- https://intensivecarenetwork.com/Calculators/Files/Apache4.html. Los valores -1 
---significan que no hay información del apache para ese paciente, es decir, valores faltantes
SELECT
  patientunitstayid,
  MAX(apachescore) AS apachescoreIV
FROM
  `physionet-data.eicu_crd.apachepatientresult`
GROUP BY
  patientunitstayid
