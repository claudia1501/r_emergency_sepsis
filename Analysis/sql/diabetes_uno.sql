   SELECT
        DISTINCT patientunitstayid,
        1 AS diabetes
    FROM
        `physionet-data.eicu_crd.diagnosis`
    WHERE
        LOWER(diagnosisstring) LIKE '%diab%'
