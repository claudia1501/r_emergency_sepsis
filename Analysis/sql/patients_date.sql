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
WHERE  p.hospitaladmitsource = 'Emergency Department'
  AND a.age_numeric >= 16
  AND p.unitstaytype = 'admit'
  AND (p.apacheadmissiondx LIKE '%Sepsis%'
    OR p.apacheadmissiondx = 'Cellulitis and localized soft tissue infections, surgery for'
    OR p.apacheadmissiondx = 'Abscess/infection-cranial, surgery for'
    OR p.apacheadmissiondx = 'Renal infection/abscess'
    OR p.apacheadmissiondx = 'Cellulitis and localized soft tissue infections'
    OR p.apacheadmissiondx = 'Thoracotomy for thoracic/respiratory infection'
    OR p.apacheadmissiondx = 'Infection/abscess, other surgery for'
    OR p.apacheadmissiondx = 'Abscess, neurologic'
    OR p.apacheadmissiondx = 'ARDS-adult respiratory distress syndrome, non-cardiogenic pulmonary edema'
    OR p.apacheadmissiondx = 'Arthritis, septic'
    OR p.apacheadmissiondx = 'Cholecystectomy/cholangitis, surgery for (gallbladder removal)'
    OR p.apacheadmissiondx = 'Complications of previous GI surgery; surgery for (anastomotic leak, bleeding, abscess, infection, dehiscence, etc.)'
    OR p.apacheadmissiondx = 'Complications of previous open heart surgery (i.e. bleeding, infection etc.)'
    OR p.apacheadmissiondx = 'Complications of previous open-heart surgery, surgery for (i.e. bleeding, infection, mediastinal rewiring,leaking aortic graft etc.)'
    OR p.apacheadmissiondx = 'Diverticular disease, surgery for'
    OR p.apacheadmissiondx = 'Endocarditis'
    OR p.apacheadmissiondx = 'Fistula/abscess, surgery for (not inflammatory bowel disease)'
    OR p.apacheadmissiondx = 'GI abscess/cyst'
    OR p.apacheadmissiondx = 'GI Abscess/cyst-primary, surgery for'
    OR p.apacheadmissiondx = 'GI obstruction, surgery for (including lysis of adhesions)'
    OR p.apacheadmissiondx = 'GI perforation/rupture'
    OR p.apacheadmissiondx = 'GI perforation/rupture, surgery for'
    OR p.apacheadmissiondx = 'Inflammatory bowel disease, surgery for'
    OR p.apacheadmissiondx = 'Meningitis'
    OR p.apacheadmissiondx = 'Myositis, viral'
    OR p.apacheadmissiondx = 'Pancreatitis, surgery for'
    OR p.apacheadmissiondx = 'Peritonitis'
    OR p.apacheadmissiondx = 'Peritonitis, surgery for'
    OR p.apacheadmissiondx = 'Pneumonia, aspiration'
    OR p.apacheadmissiondx = 'Pneumonia, bacterial'
    OR p.apacheadmissiondx = 'Pneumonia, fungal'
    OR p.apacheadmissiondx = 'Pneumonia, other'
    OR p.apacheadmissiondx = 'Pneumonia, parasitic (i.e., Pneumocystic pneumonia)'
    OR p.apacheadmissiondx = 'Pneumonia, viral')
