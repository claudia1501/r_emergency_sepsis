-- Combina los tres conjuntos de datos para identificar la presencia de diabetes
WITH hist_diabetes_bin AS (
    SELECT 
        patientunitstayid,
        CASE 
            WHEN pasthistorypath IN (
                'notes/Progress Notes/Past History/Organ Systems/Endocrine (R)/Insulin Dependent Diabetes/insulin dependent diabetes', 
                'notes/Progress Notes/Past History/Organ Systems/Endocrine (R)/Non-Insulin Dependent Diabetes/non-medication dependent', 
                'notes/Progress Notes/Past History/Organ Systems/Endocrine (R)/Non-Insulin Dependent Diabetes/medication dependent'
            ) THEN 1
            ELSE 0
        END AS diabetes
    FROM 
        `physionet-data.eicu_crd.pasthistory`
),
apache_diabetes AS (
    SELECT
        DISTINCT patientunitstayid,
        1 AS diabetes
    FROM
        `physionet-data.eicu_crd.apachepredvar`
    WHERE
        diabetes = 1
),
diagnosis_diabetes AS (
    SELECT
        DISTINCT patientunitstayid,
        1 AS diabetes
    FROM
        `physionet-data.eicu_crd.diagnosis`
    WHERE
        LOWER(diagnosisstring) LIKE '%diab%'
)

-- Combina todos los datos en una sola vista
SELECT 
    patientunitstayid,
    MAX(hist_diabetes) AS hist_diabetes,
    MAX(apache_diabetes) AS apache_diabetes,
    MAX(diagnosis_diabetes) AS diagnosis_diabetes
FROM (
    SELECT patientunitstayid, diabetes AS hist_diabetes, 0 AS apache_diabetes, 0 AS diagnosis_diabetes FROM hist_diabetes_bin
    UNION ALL
    SELECT patientunitstayid, 0 AS hist_diabetes, diabetes AS apache_diabetes, 0 AS diagnosis_diabetes FROM apache_diabetes
    UNION ALL
    SELECT patientunitstayid, 0 AS hist_diabetes, 0 AS apache_diabetes, diabetes AS diagnosis_diabetes FROM diagnosis_diabetes
) combined
GROUP BY 
    patientunitstayid
ORDER BY
    patientunitstayid;
