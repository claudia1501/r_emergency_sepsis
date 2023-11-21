--- https://intensivecarenetwork.com/Calculators/Files/Apache4.html
SELECT
  patientunitstayid,
  MAX(apachescore) AS apachescoreIV
FROM
  `physionet-data.eicu_crd.apachepatientresult`
GROUP BY
  patientunitstayid
