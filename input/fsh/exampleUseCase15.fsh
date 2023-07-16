// Adverse Event Example Use Case 15
Instance: GIBleedUseCase15
InstanceOf: Condition
Description: "Gastrointestinal (GI) bleed"
* subject = Reference(SCHJO)
* severity = http://snomed.info/sct#24484000 "Severe"
* code =  http://snomed.info/sct#74474003 "GI hemorrhage"
* clinicalStatus = http://terminology.hl7.org/CodeSystem/condition-clinical#active

//Research Study XYZ, Study ID XYZ-123,
Instance: research-study-XYZ
InstanceOf: ResearchStudy
Description: "Use Case 15 Research Study XYZ"
* title = "Research Study XYZ"
* identifier.value = "XYZ-123"
* status =  http://hl7.org/fhir/research-study-status#active "Active"

// Study Medication ABC 10 mg orally daily every morning
// chose an ingredient for blood thinner just to create medication reference 
Instance: study-medication-ABC
InstanceOf: Medication
Description: "Example study medication ABC"
* code = http://www.nlm.nih.gov/research/umls/rxnorm#114194
* code.text = "warafin sodium"

Instance: study-medication-administration-ABC
InstanceOf: MedicationAdministration
Description: "Example for clinical trial medication ABC"
* status = #in-progress "In Progress"
* medicationReference = Reference(study-medication-ABC)
* subject = Reference(SCHJO)
* effectiveDateTime = "2021-06-12"
* dosage.dose = 10 'mg' "mg"
* dosage.route = http://snomed.info/sct#26643006 "Oral use"

//Here we indicate medication discontinued with stopped status
Instance: medicationrequest-for-study-medication-administration-ABC
InstanceOf: MedicationRequest
Title: "Medication Request for discontinued clinical trial medication ABC"
Description: "Study medication info Medication Request for clinical trial medication ABC - discontinued"
Usage: #example
* status = #stopped "Stopped"
* intent = #order
* identifier.use = #official
* identifier.system = "http://www.bmc.nl/portal/medstatements"
* identifier.value = "medABC-studyDrug" 
* medicationReference = Reference(study-medication-ABC) "study-medication-ABC 10 mg tablet"
* subject = Reference(SCHJO)
* authoredOn = "2021-06-12"
* requester.display = "Could be reference to inline contained profile such as Reference(practitioner-1) Ronald Bone, MD"
* reasonCode = http://snomed.info/sct#49436004  "Atrial fibrillation"
* dosageInstruction.sequence = 1
* dosageInstruction.text = "10 mg PO daily every morning"
* dosageInstruction.timing.repeat.frequency = 1
* dosageInstruction.timing.repeat.period = 1
* dosageInstruction.timing.repeat.periodUnit = #d
* dosageInstruction.route = http://snomed.info/sct#26643006 "Oral route (qualifier value)"
* dosageInstruction.doseAndRate.type = http://terminology.hl7.org/CodeSystem/dose-rate-type#ordered "Ordered"
* dosageInstruction.doseAndRate.doseQuantity = 10 'mg' "mg"
* dispenseRequest.numberOfRepeatsAllowed = 1
* dispenseRequest.quantity = 1000 'mg' "mg"
* dispenseRequest.expectedSupplyDuration = 100 'd' "days"
* supportingInformation = Reference(research-study-XYZ)
* supportingInformation.display = "http://baseUrlOfHospitalHolding/PlanDefinition/protocol-for-the-ResearchStudy"

// Upper Endoscopy Procedure for mitigating action
Instance: procedure-upper-endoscopy
InstanceOf: Procedure
Description: "Example Procedure Upper Endoscopy"
* subject = Reference(SCHJO)
* status = http://hl7.org/fhir/event-status#completed "Completed"
* code = http://snomed.info/sct#1255196002 "Esophagogastroduodenoscopy with control of hemorrhage of esophagus (procedure)"

Instance: ClinicalResearchAdverseEventUseCase15
InstanceOf: AdverseEvent-clinical-research
Title: "ClinicalResearchAdverseEventUseCase15"
Description: "Serious Adverse Event Research Study Medication Example"
* modifierExtension[status].valueCode = #completed //http://hl7.org/fhir/event-status#completed
* subject = Reference(SCHJO)
* event = http://terminology.hl7.org/CodeSystem/mdr#10017955 "Gastrointestinal haemorrhage"
* outcome = urn:oid:2.16.840.1.113883.3.989.2.1.1.19#recoveredorresolved "Recovered/Resolved"
* extension[severity-or-grade].valueCodeableConcept = $ae-severity-or-grade-cs#3 "Severe"

//* resultingCondition[0] = Reference(GIBleedUseCase15)
* extension[ResultingEffect][0].valueReference = Reference(GIBleedUseCase15)
* study = Reference(research-study-XYZ)
* extension[suspect-entity][0].extension[instance].valueReference = Reference(study-medication-administration-ABC)
* extension[suspect-entity][=].extension[causality].extension[entityRelatedness].valueCodeableConcept = urn:oid:2.16.840.1.113883.3.989.2.1.1.19#possibly "Possibly Related"
* date = "2021-12-02"
* extension[resolve-date].valueDateTime = "2021-12-09"

* seriousness = http://terminology.hl7.org/CodeSystem/adverse-event-seriousness#serious "Serious"

* extension[seriousness-criteria][0].extension[criterionCode].valueCodeableConcept = urn:oid:2.16.840.1.113883.3.989.2.1.1.19#35 "resultsInPersistentOrSignificantDisability"
* extension[seriousness-criteria][=].extension[criterionPresent].valueBoolean = false
* extension[seriousness-criteria][+].extension[criterionCode].valueCodeableConcept = urn:oid:2.16.840.1.113883.3.989.2.1.1.19#33 "requiresInpatientHospitalization"
* extension[seriousness-criteria][=].extension[criterionPresent].valueBoolean = true
* extension[seriousness-criteria][+].extension[criterionCode].valueCodeableConcept = urn:oid:2.16.840.1.113883.3.989.2.1.1.19#34 "resultsInDeath"
* extension[seriousness-criteria][=].extension[criterionPresent].valueBoolean = false
* extension[seriousness-criteria][+].extension[criterionCode].valueCodeableConcept = urn:oid:2.16.840.1.113883.3.989.2.1.1.19#21 "isLifeThreatening"
* extension[seriousness-criteria][=].extension[criterionPresent].valueBoolean = true
* extension[seriousness-criteria][+].extension[criterionCode].valueCodeableConcept = urn:oid:2.16.840.1.113883.3.989.2.1.1.19#12 "congenitalAnomalyBirthDefect"
* extension[seriousness-criteria][=].extension[criterionPresent].valueBoolean = false
* extension[seriousness-criteria][+].extension[criterionCode].valueCodeableConcept = urn:oid:2.16.840.1.113883.3.989.2.1.1.19#26 "otherMedicallyImportantCondition"
* extension[seriousness-criteria][=].extension[criterionPresent].valueBoolean = false
* extension[seriousness-criteria][+].extension[criterionCode].valueCodeableConcept = $fda-add-seriousness-criteria-cs#requiresPreventImpairment "Required Intervention to Prevent Permanent Impairment or Damage (Devices)"
* extension[seriousness-criteria][=].extension[criterionPresent].valueBoolean = true

* extension[mitigating-action][+].extension[item].valueReference = Reference(procedure-upper-endoscopy)

//consider changing to MedAmin reference to study drug being stopped
* extension[mitigating-action][+].extension[item].valueCodeableConcept = http://snomed.info/sct#274512008 "Drug therapy discontinued (situation)"
* extension[mitigating-action][=].extension[item].valueCodeableConcept.text = "study drug withdrawn"

* extension[mitigating-action][+].extension[item].valueReference = Reference(medicationrequest-for-study-medication-administration-ABC)
* extension[mitigating-action][=].extension[item].valueReference.display = "Medication Request where study drug prescription was discontinued"


* extension[caused-subject-to-discontinue-study].valueBoolean = true	
* extension[expected-in-research-study].valueBoolean = false
* extension[supporting-info][+].extension[item].valueReference.display = "Supporting info would have context such as an Observation on the drop in hemoglobin"
* extension[note][0].valueAnnotation.text = "The patient’s hemoglobin dropped to 6.5 g/dL and received 2 units of PRBCs. The patient had an upper endoscopy that showed a moderate amount of bleeding from the esophagus. The site was cauterized, and the patient had no further bleeding after the procedure. The GI bleed resolved within one week after discontinuation of study drug and the patient was discharged on 9-Dec-2021 in good condition."
