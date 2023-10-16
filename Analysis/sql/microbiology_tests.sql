-- CRITERIOS DE INCLUSIÓN: 48 HORAS ANTES Y DESPUES DE PRUEBAS, POSITIVAS (RESISTANT)
SELECT
  patientunitstayid,
  MAX(CASE WHEN culturetakenoffset BETWEEN -2880 AND 2880 AND sensitivitylevel = 'Resistant' THEN culturetakenoffset ELSE NULL END) AS culturetakenoffset,
  MAX(CASE WHEN culturetakenoffset BETWEEN -2880 AND 2880 AND sensitivitylevel = 'Resistant' THEN sensitivitylevel ELSE NULL END) AS sensitivitylevel
FROM
  `physionet-data.eicu_crd.microlab`
GROUP BY
  patientunitstayid
ORDER BY
  patientunitstayid ASC;
