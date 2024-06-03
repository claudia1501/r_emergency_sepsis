WITH FirstStay AS (
  SELECT 
    patientunitstayid, 
    MIN(treatmentoffset) AS first_treatmentoffset
  FROM 
    `physionet-data.eicu_crd.treatment`
  WHERE 
    treatmentOffset BETWEEN 0 AND 1440
  GROUP BY 
    patientunitstayid
)

SELECT DISTINCT
  t.patientunitstayid,
  t.treatmentstring,
  t.treatmentoffset
FROM 
  `physionet-data.eicu_crd.treatment` t
JOIN 
  FirstStay fs
ON 
  t.patientunitstayid = fs.patientunitstayid
  AND t.treatmentoffset = fs.first_treatmentoffset
WHERE 
  t.treatmentstring LIKE 'toxicology|drug overdose|vasopressors|vasopressin'            
  OR t.treatmentstring LIKE 'toxicology|drug overdose|vasopressors|phenylephrine (Neosynephrine)'
  OR t.treatmentstring LIKE 'toxicology|drug overdose|vasopressors|norepinephrine > 0.1 micrograms/kg/min'
  OR t.treatmentstring LIKE 'toxicology|drug overdose|vasopressors|norepinephrine <= 0.1 micrograms/kg/min' 
  OR t.treatmentstring LIKE 'toxicology|drug overdose|vasopressors|epinephrine > 0.1 micrograms/kg/min' 
  OR t.treatmentstring LIKE 'toxicology|drug overdose|vasopressors|epinephrine <= 0.1 micrograms/kg/min'
  OR t.treatmentstring LIKE 'toxicology|drug overdose|vasopressors|dopamine 5-15 micrograms/kg/min' 
  OR t.treatmentstring LIKE 'toxicology|drug overdose|vasopressors|dopamine >15 micrograms/kg/min'
  OR t.treatmentstring LIKE 'toxicology|drug overdose|vasopressors' 
  OR t.treatmentstring LIKE 'surgery|cardiac therapies|vasopressors|vasopressin' 
  OR t.treatmentstring LIKE 'surgery|cardiac therapies|vasopressors|phenylephrine (Neosynephrine)'
  OR t.treatmentstring LIKE 'surgery|cardiac therapies|vasopressors|norepinephrine > 0.1 micrograms/kg/min'
  OR t.treatmentstring LIKE 'surgery|cardiac therapies|vasopressors|norepinephrine <= 0.1 micrograms/kg/min'
  OR t.treatmentstring LIKE 'surgery|cardiac therapies|vasopressors|epinephrine > 0.1 micrograms/kg/min'
  OR t.treatmentstring LIKE 'surgery|cardiac therapies|vasopressors|epinephrine <= 0.1 micrograms/kg/min'
  OR t.treatmentstring LIKE 'surgery|cardiac therapies|vasopressors|dopamine  5-15 micrograms/kg/min'
  OR t.treatmentstring LIKE 'surgery|cardiac therapies|vasopressors|dopamine >15 micrograms/kg/min'
  OR t.treatmentstring LIKE 'surgery|cardiac therapies|vasopressors'
  OR t.treatmentstring LIKE 'renal|electrolyte correction|treatment of hypernatremia|vasopressin'   
  OR t.treatmentstring LIKE 'neurologic|therapy for controlling cerebral perfusion pressure|vasopressors|phenylephrine (Neosynephrine)'
  OR t.treatmentstring LIKE 'neurologic|therapy for controlling cerebral perfusion pressure|vasopressors|norepinephrine > 0.1 micrograms/kg/min'
  OR t.treatmentstring LIKE 'neurologic|therapy for controlling cerebral perfusion pressure|vasopressors|norepinephrine <= 0.1 micrograms/kg/min'
  OR t.treatmentstring LIKE 'neurologic|therapy for controlling cerebral perfusion pressure|vasopressors|epinephrine > 0.1 micrograms/kg/min'
  OR t.treatmentstring LIKE 'neurologic|therapy for controlling cerebral perfusion pressure|vasopressors|epinephrine <= 0.1 micrograms/kg/min'
  OR t.treatmentstring LIKE 'neurologic|therapy for controlling cerebral perfusion pressure|vasopressors|dopamine 5-15 micrograms/kg/min'
  OR t.treatmentstring LIKE 'neurologic|therapy for controlling cerebral perfusion pressure|vasopressors|dopamine > 15 micrograms/kg/min'
  OR t.treatmentstring LIKE 'neurologic|therapy for controlling cerebral perfusion pressure|vasopressors'
  OR t.treatmentstring LIKE 'gastrointestinal|medications|hormonal therapy (for varices)|vasopressin'
  OR t.treatmentstring LIKE 'cardiovascular|shock|vasopressors|vasopressin'
  OR t.treatmentstring LIKE 'cardiovascular|shock|vasopressors|phenylephrine (Neosynephrine)'
  OR t.treatmentstring LIKE 'cardiovascular|shock|vasopressors|norepinephrine > 0.1 micrograms/kg/min'
  OR t.treatmentstring LIKE 'cardiovascular|shock|vasopressors|norepinephrine <= 0.1 micrograms/kg/min'
  OR t.treatmentstring LIKE 'cardiovascular|shock|vasopressors|epinephrine > 0.1 micrograms/kg/min'
  OR t.treatmentstring LIKE 'cardiovascular|shock|vasopressors|epinephrine <= 0.1 micrograms/kg/min' 
  OR t.treatmentstring LIKE 'cardiovascular|shock|vasopressors|dopamine  5-15 micrograms/kg/min' 
  OR t.treatmentstring LIKE 'cardiovascular|shock|vasopressors|dopamine >15 micrograms/kg/min' 
  OR t.treatmentstring LIKE 'cardiovascular|shock|vasopressors'
  OR t.treatmentstring LIKE 'toxicology|drug overdose|agent specific therapy|beta blockers overdose|dopamine' 
  OR t.treatmentstring LIKE 'cardiovascular|ventricular dysfunction|inotropic agent|norepinephrine > 0.1 micrograms/kg/min' 
  OR t.treatmentstring LIKE 'cardiovascular|ventricular dysfunction|inotropic agent|norepinephrine <= 0.1 micrograms/kg/min' 
  OR t.treatmentstring LIKE 'cardiovascular|ventricular dysfunction|inotropic agent|epinephrine > 0.1 micrograms/kg/min' 
  OR t.treatmentstring LIKE 'cardiovascular|ventricular dysfunction|inotropic agent|epinephrine <= 0.1 micrograms/kg/min' 
  OR t.treatmentstring LIKE 'cardiovascular|shock|inotropic agent|norepinephrine > 0.1 micrograms/kg/min' 
  OR t.treatmentstring LIKE 'cardiovascular|shock|inotropic agent|norepinephrine <= 0.1 micrograms/kg/min'
  OR t.treatmentstring LIKE 'cardiovascular|shock|inotropic agent|epinephrine > 0.1 micrograms/kg/min' 
  OR t.treatmentstring LIKE 'cardiovascular|shock|inotropic agent|epinephrine <= 0.1 micrograms/kg/min'
  OR t.treatmentstring LIKE 'cardiovascular|shock|inotropic agent|dopamine <= 5 micrograms/kg/min'
  OR t.treatmentstring LIKE 'cardiovascular|shock|inotropic agent|dopamine  5-15 micrograms/kg/min'
  OR t.treatmentstring LIKE 'cardiovascular|shock|inotropic agent|dopamine >15 micrograms/kg/min' 
  OR t.treatmentstring LIKE 'surgery|cardiac therapies|inotropic agent|dopamine <= 5 micrograms/kg/min' 
  OR t.treatmentstring LIKE 'surgery|cardiac therapies|inotropic agent|dopamine  5-15 micrograms/kg/min' 
  OR t.treatmentstring LIKE 'surgery|cardiac therapies|inotropic agent|dopamine >15 micrograms/kg/min' 
  OR t.treatmentstring LIKE 'cardiovascular|myocardial ischemia / infarction|inotropic agent|norepinephrine > 0.1 micrograms/kg/min'
  OR t.treatmentstring LIKE 'cardiovascular|myocardial ischemia / infarction|inotropic agent|norepinephrine <= 0.1 micrograms/kg/min'
  OR t.treatmentstring LIKE 'cardiovascular|myocardial ischemia / infarction|inotropic agent|epinephrine > 0.1 micrograms/kg/min' 
  OR t.treatmentstring LIKE  'cardiovascular|myocardial ischemia / infarction|inotropic agent|epinephrine <= 0.1 micrograms/kg/min'
  OR t.treatmentstring LIKE  'cardiovascular|ventricular dysfunction|inotropic agent|dopamine <= 5 micrograms/kg/min' 
  OR t.treatmentstring LIKE  'cardiovascular|ventricular dysfunction|inotropic agent|dopamine  5-15 micrograms/kg/min' 
  OR t.treatmentstring LIKE  'cardiovascular|ventricular dysfunction|inotropic agent|dopamine >15 micrograms/kg/min'
  OR t.treatmentstring LIKE  'cardiovascular|myocardial ischemia / infarction|inotropic agent|dopamine <= 5 micrograms/kg/min'
  OR t.treatmentstring LIKE  'cardiovascular|myocardial ischemia / infarction|inotropic agent|dopamine  5-15 micrograms/kg/min'
  OR t.treatmentstring LIKE  'cardiovascular|myocardial ischemia / infarction|inotropic agent|dopamine >15 micrograms/kg/min' 
