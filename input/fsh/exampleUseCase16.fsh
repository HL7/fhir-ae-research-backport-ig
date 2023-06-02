Instance: patient-moumic
InstanceOf: Patient
Usage: #example
Title: "Use Case 16 Patient MOUMIC"
Description: "Use Case 16 Patient MOUMIC on Research Study DISNEY"
* name
  * given[0] = "MOUMIC"

Instance: research-study-DISNEY
InstanceOf: ResearchStudy
Description: "Use Case 16 Research Study DISNEY"
* title = "Research Study DISNEY"
* identifier.value = "DUCK-828"
* status =  http://hl7.org/fhir/research-study-status#active "Active"

// Study Medication 20 mg subcutaneously daily every morning for diabetes
Instance: study-medication-MMD
InstanceOf: Medication
Usage: #example
* code = http://www.nlm.nih.gov/research/umls/rxnorm#1991302
* code.text = "semaglutide"

Instance: study-medication-administration-MMD
InstanceOf: MedicationAdministration
Description: "Example for clinial trial medication MMD"
* status = #in-progress "In Progress"
* medicationReference = Reference(study-medication-MMD)
* subject = Reference(patient-moumic)
* effectiveDateTime = "2022-01-21"
* dosage.dose = 20 'mg' "mg"
* dosage.route = http://snomed.info/sct#263887005 "Subcutaneous"

// Tylenol for mitigating actoin
Instance: medication-tylenol
InstanceOf: Medication
Usage: #example
* code = http://www.nlm.nih.gov/research/umls/rxnorm#202433
* code.text = "Tylenol"

Instance: medication-administration-tylenol
InstanceOf: MedicationAdministration
Description: "Example of Tylenol"
* status = #in-progress "In Progress"
* medicationReference = Reference(medication-tylenol)
* subject = Reference(patient-moumic)
* effectiveDateTime = "2022-02-01"
* dosage.dose = 325 'mg' "mg"
* dosage.route = http://snomed.info/sct#26643006 "Oral use"


Instance: ClinicalResearchAdverseEventUseCase16
InstanceOf: AdverseEvent-clinical-research
Usage: #example
Title: "ClinicalResearchAdverseEventUseCase16"
Description: "Non-Serious Adverse Event Research Study Medication Example"
//* actuality = http://hl7.org/fhir/adverse-event-actuality#actual 
//* extension[status].valueCode = http://hl7.org/fhir/event-status#completed
* modifierExtension[status].valueCode = #completed //http://hl7.org/fhir/event-status#completed
* subject = Reference(patient-moumic)
* event = http://terminology.hl7.org/CodeSystem/MDRAE#10019211 "Headache"
* outcome = urn:oid:2.16.840.1.113883.3.989.2.1.1.19#notrecoveredorresolved	"Not recovering/not resolved"
* extension[severity-or-grade].valueCodeableConcept = http://hl7.org/fhir/uv/adverseeventclinicalresearch/CodeSystem/adverse-event-severity-or-grade-cs#1 "Mild"

* study = Reference(research-study-DISNEY)
* extension[suspect-entity][0].extension[instance].valueReference = Reference(study-medication-administration-MMD)
* extension[suspect-entity][=].extension[causality].extension[entityRelatedness].valueCodeableConcept = urn:oid:2.16.840.1.113883.3.989.2.1.1.19#unlikely "Unlikely Related"
* detected = "2022-02-01"

* seriousness = http://terminology.hl7.org/CodeSystem/adverse-event-seriousness#non-serious "Non-serious"
//mitigating actions
* extension[mitigating-action][+].extension[item].valueReference = Reference(medication-administration-tylenol)
* extension[mitigating-action][+].extension[item].valueCodeableConcept.text = "study drug dose not changed"

* extension[caused-subject-to-discontinue-study].valueBoolean = false	
* extension[expected-in-research-study].valueBoolean = true
* extension[note][0].valueAnnotation.text = "Headaches are mild, occur once a week and resolved with Tylenol, but still ongoing. Action taken with the study is dose not chnaged."
