// Adverse Event Example Use Case 17
Instance: patient-slp
InstanceOf: Patient
Title: "Example patient SLP"
Description: "Patient enrolled in ACME study, taking Study Medication WBY 10 mg orally daily every morning for moderate asthma"
* identifier.use = #usual
* identifier.type = http://terminology.hl7.org/CodeSystem/v2-0203#MR "Medical Record Number"
* identifier.system = "http://hospital.example.org"
* identifier.value = "mrn467"
* name.family = "Example"
* name.given[0] = "SLP"

Instance: research-study-acme
InstanceOf: ResearchStudy
Description: "Use Case 17 Research Study ACME"
* title = "Research Study ACME"
* identifier.value = "ACME-789"
* status =  http://hl7.org/fhir/research-study-status#active "Active"

Instance: clinical-trial-acme-subject
InstanceOf: ResearchSubject
Description: "Clinical trial ACME research subject"
* identifier[0].use = #usual
* identifier[=].value = "ACME-789-100"
* status = http://hl7.org/fhir/research-subject-status#on-study "On-study"
* study = Reference(research-study-acme)
* individual = Reference(patient-slp)

Instance: clinical-trial-acme-procedure
InstanceOf: Procedure
Description: "Clinical trial ACME protocol-prescribed procedure of a Lung CT Scan, with contrast dye"
* subject = Reference(patient-slp)
* status = http://hl7.org/fhir/event-status#completed "Completed"
* code = http://snomed.info/sct#241540006 "CT of lungs"

Instance: study-medication-WBY
InstanceOf: Medication
* code = http://www.nlm.nih.gov/research/umls/rxnorm#115713
* code.text = "montelukast sodium"

Instance: study-medication-administration-WBY
InstanceOf: MedicationAdministration
Description: "Example for clinial trial medication WBY"
* status = #in-progress "In Progress"
* medicationReference = Reference(study-medication-WBY)
* subject = Reference(patient-slp)
* effectiveDateTime = "2021-01-02"
* dosage.dose = 10 'mg' "mg"
* dosage.route = http://snomed.info/sct#26643006 "Oral use"

Instance: medication-contrast-dye
InstanceOf: Medication
Description: "Example contrast dye medication"
* code = http://snomed.info/sct#39290007
* code.text = "Barium"

Instance: medication-administration-contrast-dye
InstanceOf: MedicationAdministration
Description: "Example medication administration for contrast dye"
* status = #completed "Completed"
* medicationReference = Reference(medication-contrast-dye)
* subject = Reference(patient-slp)
* effectiveDateTime = "2021-01-15"
* dosage.dose = 150 'mg' "mg"
* dosage.route = http://snomed.info/sct#47625008 "Intravenous route (qualifier value)"

Instance: medication-forhives
InstanceOf: Medication
Description: "Example medication for hives"
* code = http://www.nlm.nih.gov/research/umls/rxnorm#1158446
* code.text = "diphenhydramine Injectable Product"

Instance: medication-administration-forhives
InstanceOf: MedicationAdministration
Description: "Example medication administration for hives"
* status = #completed "Completed"
* medicationReference = Reference(medication-forhives)
* subject = Reference(patient-slp)
* effectiveDateTime = "2021-01-15"
* dosage.dose = 50 'mg' "mg"
* dosage.route = http://snomed.info/sct#129326001 "Injection"

Instance: ClinicalResearchAdverseEventUseCase17
InstanceOf: AdverseEvent-clinical-research
Description: "Adverse event from procedure, not study drug"
* subject = Reference(patient-slp)
* modifierExtension[status].valueCode = #completed
* event = http://ncicb.nci.nih.gov/xml/owl/EVS/Thesaurus.owl#C57954 "Urticaria" 
* event.text = "Moderate hives"
* extension[severity-or-grade].valueCodeableConcept = http://hl7.org/fhir/uv/adverseeventclinicalresearch/CodeSystem/adverse-event-severity-or-grade-cs#2 "Moderate"
* seriousness = http://terminology.hl7.org/CodeSystem/adverse-event-seriousness#non-serious "Non-serious"
* outcome = urn:oid:2.16.840.1.113883.3.989.2.1.1.19#recoveredorresolved "Recovered/Resolved"
* date = "2021-01-15"
* extension[resolve-date].valueDateTime = "2021-01-15"
* study = Reference(research-study-acme)
* extension[research-subject-ref].valueReference = Reference(clinical-trial-acme-subject)
* extension[suspect-entity][0].extension[instance].valueReference = Reference(study-medication-administration-wby)
* extension[suspect-entity][=].extension[causality].extension[entityRelatedness].valueCodeableConcept = urn:oid:2.16.840.1.113883.3.989.2.1.1.19#notrelated "Not Related"
* extension[suspect-entity][+].extension[instance].valueReference = Reference(clinical-trial-acme-procedure)
* extension[suspect-entity][=].extension[causality].extension[entityRelatedness].valueCodeableConcept = urn:oid:2.16.840.1.113883.3.989.2.1.1.19#possibly "Possibly Related"
* extension[expected-in-research-study].valueBoolean = false
* extension[note][0].valueAnnotation.text = "The action taken with the study treatment was the study drug dose not changed"
* extension[caused-subject-to-discontinue-study].valueBoolean = false	
* extension[mitigating-action][+].extension[item].valueReference = Reference(medication-administration-forhives)
* extension[mitigating-action][+].extension[item].valueCodeableConcept.text = "study drug dose not changed"
* extension[contributing-factor][+].extension[item].valueReference = Reference(medication-administration-contrast-dye)