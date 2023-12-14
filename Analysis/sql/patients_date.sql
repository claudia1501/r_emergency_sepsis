-- INCLUSION CRITERIA: >16 YEARS (pacientes >89 años se sustituye por 90, ya que no hay información 
--específica de ellos ni media o mediana, y al haber pacientes de 89 si 
--lo sustituimos por ese mismo no se diferenciaria ni se sabría que hay pacientes con mas de 90 años), 
--ER ENTRY, AND SEPSIS/infection
WITH pt_age AS (
  SELECT patientunitstayid, age,
         CASE WHEN age = '> 89' THEN 90
         WHEN TRIM(age) = '' THEN NULL
         ELSE CAST(age AS NUMERIC)
         END AS age_numeric
  FROM `physionet-data.eicu_crd.patient`
)
SELECT
  p.patientunitstayid, p.gender, a.age_numeric, p.ethnicity, p.apacheadmissiondx, p.hospitaladmitoffset, p.hospitaladmitsource, p.hospitaldischargeoffset, p.unittype, p.unitdischargeoffset,unitdischargestatus, p.uniquepid, p.unitstaytype 
FROM
  `physionet-data.eicu_crd.patient` p
JOIN
  pt_age a
ON
  p.patientunitstayid = a.patientunitstayid
WHERE
  p.hospitaladmitsource = 'Emergency Department'
  AND p.unitadmitsource = 'Emergency Department'
  AND p.unitstaytype = 'admit'
  AND (p.apacheadmissiondx LIKE '%Sepsis%'
    OR p.apacheadmissiondx = 'Cellulitis and localized soft tissue infections, surgery for'
    OR p.apacheadmissiondx = 'Abscess/infection-cranial, surgery for'
    OR p.apacheadmissiondx = 'Renal infection/abscess'
    OR p.apacheadmissiondx = 'Cellulitis and localized soft tissue infections'
    OR p.apacheadmissiondx = 'Thoracotomy for thoracic/respiratory infection'
    OR p.apacheadmissiondx = 'Infection/abscess, other surgery for')
