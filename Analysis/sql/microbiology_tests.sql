-- CRITERIOS DE INCLUSIÓN: 48 HORAS ANTES Y DESPUES DE PRUEBAS, POSITIVAS
SELECT *
FROM `physionet-data.eicu_crd.microlab`
WHERE (culturetakenoffset <= 2880 AND culturetakenoffset >= -2880)
