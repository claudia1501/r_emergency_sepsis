SELECT
  patientunitstayid,
  MAX(apachescore) AS max_apachescore
FROM
  `physionet-data.eicu_crd.apachepatientresult`
GROUP BY
  patientunitstayid
