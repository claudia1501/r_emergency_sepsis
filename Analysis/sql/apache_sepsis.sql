SELECT
  patientunitstayid,
  apacheadmissiondx,
  CASE
    WHEN apacheadmissiondx LIKE '%Sepsis%' THEN 'sí'
  ELSE
  'no'
END
  AS sepsis_bin
FROM
  `physionet-data.eicu_crd.patient`
WHERE
  (age IS NULL
    OR TRIM(age) = ''
    OR age >= '16')
  AND hospitaladmitsource = 'Emergency Department'
  AND unitadmitsource = 'Emergency Department'
  AND unitstaytype = 'admit'
  AND (apacheadmissiondx LIKE '%Sepsis%'
    OR apacheadmissiondx = 'Cellulitis and localized soft tissue infections, surgery for'
    OR apacheadmissiondx = 'Abscess/infection-cranial, surgery for'
    OR apacheadmissiondx = 'Renal infection/abscess'
    OR apacheadmissiondx = 'Cellulitis and localized soft tissue infections'
    OR apacheadmissiondx = 'Thoracotomy for thoracic/respiratory infection'
    OR apacheadmissiondx = 'Infection/abscess, other surgery for')
GROUP BY
  patientunitstayid,
  apacheadmissiondx
ORDER BY patientunitstayid ASC
