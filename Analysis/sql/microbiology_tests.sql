-- CRITERIOS DE INCLUSIÓN: 48 HORAS ANTES Y DESPUES DE PRUEBAS, POSITIVAS (RESISTANT)
WITH FilteredMicrolab AS (
  SELECT
    patientunitstayid,
    culturetakenoffset,
    sensitivitylevel,
    culturesite,
    organism,
    antibiotic
  FROM
    `physionet-data.eicu_crd.microlab`
  WHERE
    culturetakenoffset BETWEEN -2880 AND 2880
    AND sensitivitylevel = 'Resistant'
)
SELECT m.*, fm.culturetakenoffset, fm.sensitivitylevel, fm.culturesite, fm.organism, fm.antibiotic
FROM
  (SELECT DISTINCT patientunitstayid FROM FilteredMicrolab) m
JOIN FilteredMicrolab fm
ON m.patientunitstayid = fm.patientunitstayid
ORDER BY m.patientunitstayid;
