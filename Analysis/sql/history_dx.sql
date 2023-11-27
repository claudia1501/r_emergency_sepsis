SELECT
  patientunitstayid,
  MAX(hist_metastasis_bin) AS hist_metastasis_bin,
  MAX(hist_vih_sida_bin) AS hist_vih_sida_bin,
  MAX(hist_cirrosis_liver_bin) AS hist_cirrosis_liver_bin,
  MAX(hist_stroke_bin) AS hist_stroke_bin,
  MAX(hist_renal_bin) AS histrenal_bin,
  MAX(hist_diabetes_bin) AS hist_diabetes_bin,
  MAX(hist_cancer_bin) AS hist_cancer_bin,
  MAX(hist_leukemia_bin) AS hist_leukemia_bin,
  MAX(hist_lymphoma_bin) AS hist_lymphoma_bin,
  MAX(hist_myocardial_infar_bin) AS hist_myocardial_infar_bin,
  MAX(hist_chf_bin) AS hist_chf_bin,
  MAX(hist_pvd_bin) AS hist_pvd_bin,
  MAX(hist_tia_bin) AS hist_tia_bin,
  MAX(hist_dementia_bin) AS hist_dementia_bin,
  MAX(hist_copd_bin) AS hist_copd_bin,
  MAX(hist_ctd_bin) AS hist_ctd_bin,
  MAX(hist_pud_bin) AS hist_pud_bin,
  MAX(hist_liver_bin) AS hist_liver_bin
FROM(
SELECT
    patientunitstayid,
    CASE
        WHEN pasthistorypath IN ( 'notes/Progress Notes/Past History/Organ Systems/Hematology/Oncology (R)/Cancer/Metastases/other', 'notes/Progress Notes/Past History/Organ Systems/Hematology/Oncology (R)/Cancer/Metastases/brain', 'notes/Progress Notes/Past History/Organ Systems/Hematology/Oncology (R)/Cancer/Metastases/carcinomatosis', 'notes/Progress Notes/Past History/Organ Systems/Hematology/Oncology (R)/Cancer/Metastases/nodes', 'notes/Progress Notes/Past History/Organ Systems/Hematology/Oncology (R)/Cancer/Metastases/lung', 'notes/Progress Notes/Past History/Organ Systems/Hematology/Oncology (R)/Cancer/Metastases/intra-abdominal', 'notes/Progress Notes/Past History/Organ Systems/Hematology/Oncology (R)/Cancer/Metastases/bone', 'notes/Progress Notes/Past History/Organ Systems/Hematology/Oncology (R)/Cancer/Metastases/liver') THEN 1
      ELSE
      0
    END
       AS hist_metastasis_bin,
    CASE
        WHEN pasthistorypath = 'notes/Progress Notes/Past History/Organ Systems/Infectious Disease (R)/AIDS/AIDS' THEN 1
      ELSE
      0
    END
       AS hist_vih_sida_bin,
    CASE 
        WHEN pasthistorypath IN ( 'notes/Progress Notes/Past History/Organ Systems/Gastrointestinal (R)/Cirrhosis/UGI bleeding', 'notes/Progress Notes/Past History/Organ Systems/Gastrointestinal (R)/Cirrhosis/varices', 'notes/Progress Notes/Past History/Organ Systems/Gastrointestinal (R)/Cirrhosis/coma', 'notes/Progress Notes/Past History/Organ Systems/Gastrointestinal (R)/Cirrhosis/jaundice', 'notes/Progress Notes/Past History/Organ Systems/Gastrointestinal (R)/Cirrhosis/ascites', 'notes/Progress Notes/Past History/Organ Systems/Gastrointestinal (R)/Cirrhosis/encephalopathy') THEN 1
      ELSE
      0
    END
       AS hist_cirrosis_liver_bin,
    CASE
        WHEN pasthistorypath IN ( 'notes/Progress Notes/Past History/Organ Systems/Neurologic/Strokes/multiple/multiple', 'notes/Progress Notes/Past History/Organ Systems/Neurologic/Strokes/stroke - remote', 'notes/Progress Notes/Past History/Organ Systems/Neurologic/Strokes/stroke - within 5 years', 'notes/Progress Notes/Past History/Organ Systems/Neurologic/Strokes/stroke - within 2 years', 'notes/Progress Notes/Past History/Organ Systems/Neurologic/Strokes/stroke - date unknown', 'notes/Progress Notes/Past History/Organ Systems/Neurologic/Strokes/stroke - within 6 months') THEN 1
      ELSE
      0
    END
       AS hist_stroke_bin,
    CASE 
        WHEN pasthistorypath IN ( 'notes/Progress Notes/Past History/Organ Systems/Renal  (R)/Renal Insufficiency/renal insufficiency - creatinine 1-2', 'notes/Progress Notes/Past History/Organ Systems/Renal  (R)/Renal Insufficiency/renal insufficiency - creatinine 3-4', 'notes/Progress Notes/Past History/Organ Systems/Renal  (R)/Renal Insufficiency/renal insufficiency - creatinine > 5', 'notes/Progress Notes/Past History/Organ Systems/Renal  (R)/Renal Insufficiency/renal insufficiency - baseline creatinine unknown', 'notes/Progress Notes/Past History/Organ Systems/Renal  (R)/Renal Insufficiency/renal insufficiency - creatinine 4-5', 'notes/Progress Notes/Past History/Organ Systems/Renal  (R)/Renal Insufficiency/renal insufficiency - creatinine 2-3', 'notes/Progress Notes/Past History/Organ Systems/Renal  (R)/Renal Failure/renal failure - peritoneal dialysis', 'notes/Progress Notes/Past History/Organ Systems/Renal  (R)/Renal Failure/renal failure- not currently dialyzed', 'notes/Progress Notes/Past History/Organ Systems/Renal  (R)/Renal Failure/renal failure - hemodialysis') THEN 1
      ELSE
      0
    END
       AS hist_renal_bin,
    CASE 
        WHEN pasthistorypath IN ( 'notes/Progress Notes/Past History/Organ Systems/Endocrine (R)/Insulin Dependent Diabetes/insulin dependent diabetes', 'notes/Progress Notes/Past History/Organ Systems/Endocrine (R)/Non-Insulin Dependent Diabetes/non-medication dependent', 'notes/Progress Notes/Past History/Organ Systems/Endocrine (R)/Non-Insulin Dependent Diabetes/medication dependent') THEN 1
      ELSE
      0
    END
       AS hist_diabetes_bin,
    CASE 
        WHEN pasthistorypath IN ( 'notes/Progress Notes/Past History/Organ Systems/Hematology/Oncology (R)/Cancer Therapy/Chemotherapy/Anthracyclines (adriamycin, daunorubicin)', 'notes/Progress Notes/Past History/Organ Systems/Hematology/Oncology (R)/Cancer/Cancer-Primary Site/bone', 'notes/Progress Notes/Past History/Organ Systems/Hematology/Oncology (R)/Cancer/Cancer-Primary Site/stomach', 'notes/Progress Notes/Past History/Organ Systems/Hematology/Oncology (R)/Cancer/Cancer-Primary Site/bile duct', 'notes/Progress Notes/Past History/Organ Systems/Hematology/Oncology (R)/Cancer/Cancer-Primary Site/kidney', 'notes/Progress Notes/Past History/Organ Systems/Hematology/Oncology (R)/Cancer/Cancer-Primary Site/unknown', 'notes/Progress Notes/Past History/Organ Systems/Hematology/Oncology (R)/Cancer Therapy/Radiation Therapy within past 6 months/primary site', 'notes/Progress Notes/Past History/Organ Systems/Hematology/Oncology (R)/Cancer/Cancer-Primary Site/breast', 'notes/Progress Notes/Past History/Organ Systems/Hematology/Oncology (R)/Cancer/Cancer-Primary Site/uterus', 'notes/Progress Notes/Past History/Organ Systems/Hematology/Oncology (R)/Cancer Therapy/Radiation Therapy within past 6 months/bone', 'notes/Progress Notes/Past History/Organ Systems/Hematology/Oncology (R)/Cancer/Cancer-Primary Site/prostate', 'notes/Progress Notes/Past History/Organ Systems/Hematology/Oncology (R)/Cancer/Cancer-Primary Site/liver', 'notes/Progress Notes/Past History/Organ Systems/Hematology/Oncology (R)/Cancer/Cancer-Primary Site/pancreas - adenocarcinoma', 'notes/Progress Notes/Past History/Organ Systems/Hematology/Oncology (R)/Cancer/Cancer-Primary Site/ovary', 'notes/Progress Notes/Past History/Organ Systems/Hematology/Oncology (R)/Cancer Therapy/Radiation Therapy within past 6 months/other', 'notes/Progress Notes/Past History/Organ Systems/Hematology/Oncology (R)/Cancer/Cancer-Primary Site/sarcoma', 'notes/Progress Notes/Past History/Organ Systems/Hematology/Oncology (R)/Cancer Therapy/Chemotherapy/chemotherapy within past mo.', 'notes/Progress Notes/Past History/Organ Systems/Hematology/Oncology (R)/Cancer/Cancer-Primary Site/other', 'notes/Progress Notes/Past History/Organ Systems/Hematology/Oncology (R)/Cancer Therapy/Chemotherapy/Alkylating agents (bleomycin, cytoxan, cyclophos.)', 'notes/Progress Notes/Past History/Organ Systems/Hematology/Oncology (R)/Cancer/Cancer-Primary Site/testes', 'notes/Progress Notes/Past History/Organ Systems/Hematology/Oncology (R)/Cancer/Cancer-Primary Site/lung', 'notes/Progress Notes/Past History/Organ Systems/Hematology/Oncology (R)/Cancer/Cancer-Primary Site/melanoma', 'notes/Progress Notes/Past History/Organ Systems/Hematology/Oncology (R)/Cancer Therapy/Radiation Therapy within past 6 months/nodes', 'notes/Progress Notes/Past History/Organ Systems/Hematology/Oncology (R)/Cancer Therapy/Chemotherapy/BMT within past 12 mos.', 'notes/Progress Notes/Past History/Organ Systems/Hematology/Oncology (R)/Cancer Therapy/Chemotherapy/Cis-platinum', 'notes/Progress Notes/Past History/Organ Systems/Hematology/Oncology (R)/Cancer Therapy/Radiation Therapy within past 6 months/liver', 'notes/Progress Notes/Past History/Organ Systems/Hematology/Oncology (R)/Cancer/Cancer-Primary Site/head and neck', 'notes/Progress Notes/Past History/Organ Systems/Hematology/Oncology (R)/Cancer/Cancer-Primary Site/esophagus', 'notes/Progress Notes/Past History/Organ Systems/Hematology/Oncology (R)/Cancer/Cancer-Primary Site/bladder', 'notes/Progress Notes/Past History/Organ Systems/Hematology/Oncology (R)/Cancer Therapy/Chemotherapy/chemotherapy within past 6 mos.', 'notes/Progress Notes/Past History/Organ Systems/Hematology/Oncology (R)/Cancer Therapy/Radiation Therapy within past 6 months/lung', 'notes/Progress Notes/Past History/Organ Systems/Hematology/Oncology (R)/Cancer/Cancer-Primary Site/none', 'notes/Progress Notes/Past History/Organ Systems/Hematology/Oncology (R)/Cancer/Cancer-Primary Site/pancreas - islet cell', 'notes/Progress Notes/Past History/Organ Systems/Hematology/Oncology (R)/Cancer/Cancer-Primary Site/colon', 'notes/Progress Notes/Past History/Organ Systems/Hematology/Oncology (R)/Cancer Therapy/Radiation Therapy within past 6 months/brain', 'notes/Progress Notes/Past History/Organ Systems/Hematology/Oncology (R)/Cancer Therapy/Chemotherapy/Vincristine', 'notes/Progress Notes/Past History/Organ Systems/Hematology/Oncology (R)/Cancer/Cancer-Primary Site/brain') THEN 1
      ELSE
      0
    END
       AS hist_cancer_bin,
    CASE
      WHEN pasthistorypath IN ( 'notes/Progress Notes/Past History/Organ Systems/Hematology/Oncology (R)/Cancer/Hematologic Malignancy/AML', 'notes/Progress Notes/Past History/Organ Systems/Hematology/Oncology (R)/Cancer/Hematologic Malignancy/ALL', 'notes/Progress Notes/Past History/Organ Systems/Hematology/Oncology (R)/Cancer/Hematologic Malignancy/CLL', 'notes/Progress Notes/Past History/Organ Systems/Hematology/Oncology (R)/Cancer/Hematologic Malignancy/CML', 'notes/Progress Notes/Past History/Organ Systems/Hematology/Oncology (R)/Cancer/Hematologic Malignancy/leukemia - other') THEN 1
      ELSE
      0
    END
       AS hist_leukemia_bin,
    CASE 
       WHEN pasthistorypath IN ( 'notes/Progress Notes/Past History/Organ Systems/Hematology/Oncology (R)/Cancer/Hematologic Malignancy/non-Hodgkins lymphoma', 'notes/Progress Notes/Past History/Organ Systems/Hematology/Oncology (R)/Cancer/Hematologic Malignancy/Hodgkins disease') THEN 1
      ELSE
      0
    END
       AS hist_lymphoma_bin,
    CASE 
       WHEN pasthistorypath IN ( 'notes/Progress Notes/Past History/Organ Systems/Cardiovascular (R)/Myocardial Infarction/MI - within 5 years', 'notes/Progress Notes/Past History/Organ Systems/Cardiovascular (R)/Myocardial Infarction/MI - remote', 'notes/Progress Notes/Past History/Organ Systems/Cardiovascular (R)/Myocardial Infarction/MI - within 6 months', 'notes/Progress Notes/Past History/Organ Systems/Cardiovascular (R)/Myocardial Infarction/MI - date unknown', 'notes/Progress Notes/Past History/Organ Systems/Cardiovascular (R)/Myocardial Infarction/MI - within 2 years', 'notes/Progress Notes/Past History/Organ Systems/Cardiovascular (R)/Myocardial Infarction/multiple/multiple') THEN 1
      ELSE
      0
    END
       AS hist_myocardial_infar_bin,
    CASE 
       WHEN pasthistorypath IN ( 'notes/Progress Notes/Past History/Organ Systems/Cardiovascular (R)/Congestive Heart Failure/CHF - class I', 'notes/Progress Notes/Past History/Organ Systems/Cardiovascular (R)/Congestive Heart Failure/CHF - class II', 'notes/Progress Notes/Past History/Organ Systems/Cardiovascular (R)/Congestive Heart Failure/CHF - severity unknown', 'notes/Progress Notes/Past History/Organ Systems/Cardiovascular (R)/Congestive Heart Failure/CHF - class III', 'notes/Progress Notes/Past History/Organ Systems/Cardiovascular (R)/Congestive Heart Failure/CHF', 'notes/Progress Notes/Past History/Organ Systems/Cardiovascular (R)/Congestive Heart Failure/CHF - class IV') THEN 1
      ELSE
      0
    END
       AS hist_chf_bin,
    CASE 
       WHEN pasthistorypath = 'notes/Progress Notes/Past History/Organ Systems/Cardiovascular (R)/Peripheral Vascular Disease/peripheral vascular disease' THEN 1
      ELSE
      0
    END
       AS hist_pvd_bin,
    CASE 
       WHEN pasthistorypath IN ( 'notes/Progress Notes/Past History/Organ Systems/Neurologic/TIA(s)/TIA(s) - within 6 months', 'notes/Progress Notes/Past History/Organ Systems/Neurologic/TIA(s)/TIA(s) - within 2 years', 'notes/Progress Notes/Past History/Organ Systems/Neurologic/TIA(s)/TIA(s) - remote', 'notes/Progress Notes/Past History/Organ Systems/Neurologic/TIA(s)/TIA(s) - within 5 years', 'notes/Progress Notes/Past History/Organ Systems/Neurologic/TIA(s)/multiple/multiple', 'notes/Progress Notes/Past History/Organ Systems/Neurologic/TIA(s)/TIA(s) - date unknown') THEN 1
      ELSE
      0
    END
       AS hist_tia_bin,
    CASE
       WHEN pasthistorypath = 'notes/Progress Notes/Past History/Organ Systems/Neurologic/Dementia/dementia' THEN 1
      ELSE
      0
    END
       AS hist_dementia_bin,
    CASE
       WHEN pasthistorypath IN ( 'notes/Progress Notes/Past History/Organ Systems/Pulmonary/COPD/COPD  - no limitations', 'notes/Progress Notes/Past History/Organ Systems/Pulmonary/COPD/COPD  - moderate', 'notes/Progress Notes/Past History/Organ Systems/Pulmonary/COPD/COPD  - severe') THEN 1
      ELSE
      0
    END
       AS hist_copd_bin,
    CASE 
       WHEN pasthistorypath IN ( 'notes/Progress Notes/Past History/Organ Systems/Rheumatic/SLE/SLE', 'notes/Progress Notes/Past History/Organ Systems/Rheumatic/Rheumatoid Arthritis/rheumatoid arthritis', 'notes/Progress Notes/Past History/Organ Systems/Rheumatic/Scleroderma/scleroderma', 'notes/Progress Notes/Past History/Organ Systems/Rheumatic/Vasculitis/vasculitis', 'notes/Progress Notes/Past History/Organ Systems/Rheumatic/Dermato/Polymyositis/dermatomyositis') THEN 1
      ELSE
      0
    END
       AS hist_ctd_bin,
    CASE 
       WHEN pasthistorypath IN ( 'notes/Progress Notes/Past History/Organ Systems/Gastrointestinal (R)/Peptic Ulcer Disease/peptic ulcer disease', 'notes/Progress Notes/Past History/Organ Systems/Gastrointestinal (R)/Peptic Ulcer Disease/peptic ulcer disease with h/o GI bleeding', 'notes/Progress Notes/Past History/Organ Systems/Gastrointestinal (R)/Peptic Ulcer Disease/hx GI bleeding/no') THEN 1
      ELSE
      0
    END
       AS hist_pud_bin,
    CASE
       WHEN pasthistorypath IN ( 'notes/Progress Notes/Past History/Organ Systems/Gastrointestinal (R)/Cirrhosis/clinical diagnosis', 'notes/Progress Notes/Past History/Organ Systems/Gastrointestinal (R)/Cirrhosis/biopsy proven') THEN 1
      ELSE
      0
    END
       AS hist_liver_bin,
FROM `physionet-data.eicu_crd.pasthistory` ) AS subquery
GROUP BY patientunitstayid
ORDER BY patientunitstayid
