SELECT 
    patientunitstayid,
    MIN(treatmentoffset) AS first_treatmentoffset,
    1 AS has_treatment
FROM (
    SELECT 
        patientunitstayid, 
        treatmentoffset
    FROM 
        `physionet-data.eicu_crd.treatment`
    WHERE 
        treatmentOffset BETWEEN 0 AND 1440
        AND (
            treatmentstring LIKE 'cardiovascular|shock|vasopressors|vasopressin'
            OR treatmentstring LIKE 'cardiovascular|shock|vasopressors|phenylephrine (Neosynephrine)'
            OR treatmentstring LIKE 'cardiovascular|shock|vasopressors|norepinephrine > 0.1 micrograms/kg/min'
            OR treatmentstring LIKE 'cardiovascular|shock|vasopressors|norepinephrine <= 0.1 micrograms/kg/min'
            OR treatmentstring LIKE 'cardiovascular|shock|vasopressors|epinephrine > 0.1 micrograms/kg/min'
            OR treatmentstring LIKE 'cardiovascular|shock|vasopressors|epinephrine <= 0.1 micrograms/kg/min' 
            OR treatmentstring LIKE 'cardiovascular|shock|vasopressors|dopamine 5-15 micrograms/kg/min' 
            OR treatmentstring LIKE 'cardiovascular|shock|vasopressors|dopamine >15 micrograms/kg/min' 
            OR treatmentstring LIKE 'cardiovascular|shock|vasopressors'
        )
) AS filtered_treatments
GROUP BY 
    patientunitstayid

  
