SELECT
  patientunitstayid,
  apacheadmissiondx,
  CASE
    WHEN apacheadmissiondx IN ('Cellulitis and localized soft tissue infections, surgery for','Abscess/infection-cranial, surgery for','Renal infection/abscess','Cellulitis and localized soft tissue infections','Thoracotomy for thoracic/respiratory infection','Infection/abscess, other surgery for') THEN 'sí'
  ELSE
  'no'
END
  AS infection_bin
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
