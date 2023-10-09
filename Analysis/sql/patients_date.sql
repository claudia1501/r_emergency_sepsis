-- CRITERIOS DE INCLUSIÓN: >16 AÑOS, ENTRADA EMERGENCIA, Y SEPSIS
SELECT
  patientunitstayid, patienthealthsystemstayid, gender, age, ethnicity, hospitalid, wardid,apacheadmissiondx, admissionheight, hospitaladmitoffset, hospitaladmitsource, hospitaldischargeyear, hospitaldischargeoffset, hospitaldischargelocation, hospitaldischargestatus, unittype, unitadmitsource, unitvisitnumber, unitstaytype, admissionweight, dischargeweight, unitdischargeoffset, unitdischargelocation, unitdischargestatus, 	
uniquepid 
FROM
  `physionet-data.eicu_crd.patient`
WHERE
  (age IS NULL
    OR TRIM(age) = ''
    OR age >= '16')
  AND hospitaladmitsource = 'Emergency Department'
  AND unitadmitsource = 'Emergency Department'
  AND (apacheadmissiondx LIKE '%Sepsis%'
    OR apacheadmissiondx = 'Cellulitis and localized soft tissue infections, surgery for'
    OR apacheadmissiondx = 'Abscess/infection-cranial, surgery for'
    OR apacheadmissiondx = 'Renal infection/abscess'
    OR apacheadmissiondx = 'Cellulitis and localized soft tissue infections'
    OR apacheadmissiondx = 'Thoracotomy for thoracic/respiratory infection'
    OR apacheadmissiondx = 'Infection/abscess, other surgery for')