
Instance: SCHJO
InstanceOf: Patient
Usage: #example
Title: "Serious Adverse Event"
Description: "SAE Patient SCHJO on Research Study XYZ, Study ID XYZ-123, Subject number XYZ-123-002. "
* name
  * given[0] = "SCHJO"
  //* family = "Clinical Trial"
//* identifier

Instance: ClinicalTrialSubject5
InstanceOf: Patient
Usage: #example
Title: "ClinicalTrialSubject5"
Description: "Clinical Trial subject number 5. Acute Hepatic Failure."
* name
  * given[0] = "Subject 5"
  * family = "Clinical Trial"
* identifier

//https://confluence.hl7.org/pages/viewpage.action?pageId=49646529#AdverseEventUseCases--Clinicaltrial:significantadverseevent
Instance: ClinicalTrialSignificantAdverseEvent
InstanceOf: AdverseEvent-clinical-research
Usage: #example
Title: "ClinicalTrialSignificantAdverseEvent"
Description: "example"
//* actuality = http://hl7.org/fhir/adverse-event-actuality#actual 
* modifierExtension[status].valueCode = http://hl7.org/fhir/event-status#completed
* subject = Reference(ClinicalTrialSubject5)
* outcome = http://ncicb.nci.nih.gov/xml/owl/EVS/Thesaurus.owl#C49496 "Recovering/Resolving"
//* seriousness = http://terminology.hl7.org/CodeSystem/adverse-event-seriousness#serious
//* resultingCondition[0] = Reference(AEHepaticFailure)
* extension[ResultingEffect][0].valueReference = Reference(AEHepaticFailure)
//* resultingCondition[1] = Reference(AEHepaticFailurecomplication)
* extension[ResultingEffect][1].valueReference = Reference(AEHepaticFailurecomplication)
//* category = http://terminology.hl7.org/CodeSystem/adverse-event-category#medication-mishap "Medication Mishap"
* study.display = "NCT1010101"
//https://www.ncbi.nlm.nih.gov/pmc/articles/PMC4435341/
//* extension[suspect-entity][0].extension[instance].valueReference.display = "Aspirin"
//* extension[suspect-entity][0].instance.display = "see instance-codeable-concept"
//* suspectEntity[=].causality.entityRelatedness = http://terminology.hl7.org/CodeSystem/adverse-event-causality-assess#certain "Certain"
//* extension[suspect-entity][=].extension[causality].extension[entityRelatedness].valueCodeableConcept = http://terminology.hl7.org/CodeSystem/adverse-event-causality-assess#certain "Certain"

* extension[suspect-entity][+].extension[instance].valueReference = Reference(medadmin0301) "Study Medication Use Case 7"
* extension[suspect-entity][=].extension[causality].extension[entityRelatedness].valueCodeableConcept = http://ncicb.nci.nih.gov/xml/owl/EVS/Thesaurus.owl#C53260 "Related"

* recorder.display = "Clinical Research Associate"
* detected = "1905-08-23"
* recordedDate = "1905-08-24"
* event = http://snomed.info/sct#370901008 "Serious reportable event associated with product or device"

* extension[seriousness-criteria][0].extension[criterionCode].valueCodeableConcept = http://ncicb.nci.nih.gov/xml/owl/EVS/Thesaurus.owl#C11338 "Results In Persistent Or Significant Disability"
* extension[seriousness-criteria][=].extension[criterionPresent].valueBoolean = false
* extension[seriousness-criteria][+].extension[criterionCode].valueCodeableConcept = http://ncicb.nci.nih.gov/xml/owl/EVS/Thesaurus.owl#C83052 "Requires Inpatient Hospitalization"
* extension[seriousness-criteria][=].extension[criterionPresent].valueBoolean = true
* extension[seriousness-criteria][+].extension[criterionCode].valueCodeableConcept = http://ncicb.nci.nih.gov/xml/owl/EVS/Thesaurus.owl#C48275 "Death Related to Adverse Event"
* extension[seriousness-criteria][=].extension[criterionPresent].valueBoolean = false
* extension[seriousness-criteria][+].extension[criterionCode].valueCodeableConcept = http://ncicb.nci.nih.gov/xml/owl/EVS/Thesaurus.owl#C84266 "Is Life Threatening"
* extension[seriousness-criteria][=].extension[criterionPresent].valueBoolean = true
* extension[seriousness-criteria][+].extension[criterionCode].valueCodeableConcept = http://ncicb.nci.nih.gov/xml/owl/EVS/Thesaurus.owl#C83117 "Congenital Anomaly or Birth Defect"
* extension[seriousness-criteria][=].extension[criterionPresent].valueBoolean = false
* extension[seriousness-criteria][+].extension[criterionCode].valueCodeableConcept = http://ncicb.nci.nih.gov/xml/owl/EVS/Thesaurus.owl#C82521 "Other Medically Important Condition"
* extension[seriousness-criteria][=].extension[criterionPresent].valueBoolean = false
* extension[seriousness-criteria][+].extension[criterionCode].valueCodeableConcept = http://ncicb.nci.nih.gov/xml/owl/EVS/Thesaurus.owl#C201939 "Required Intervention to Prevent Permanent Impairment/damage"
//$fda-add-seriousness-criteria-cs#requiresPreventImpairment "Required Intervention to Prevent Permanent Impairment or Damage (Devices)"
* extension[seriousness-criteria][=].extension[criterionPresent].valueBoolean = true


* seriousness = http://terminology.hl7.org/CodeSystem/adverse-event-seriousness#serious
* severity = http://terminology.hl7.org/CodeSystem/adverse-event-severity#severe "Severe"
//* extension[severity-or-grade].valueCodeableConcept = $ae-severity-or-grade-cs#4 "Life Threatening or Disabling"

* extension[mitigating-action][+].extension[item].valueReference = Reference(medicationrequest0301-discontinue)
* extension[mitigating-action][=].extension[item].valueReference.display = "Medication Request where study drug prescription was discontinued"


//Here we indicate medication discontinued with stopped status
Instance: medicationrequest0301-discontinue
InstanceOf: MedicationRequest
Usage: #example
Title: "Medication Request for discontinued clinical trial medication 0301"
Description: "Study medication info Medication Request for clinical trial medication 0301 - discontinued"
* contained[0] = med0301
* status = #stopped "Stopped"
* intent = #order
* identifier.use = #official
* identifier.system = "http://www.bmc.nl/portal/medstatements"
* identifier.value = "med0301-studyDrug" 
* medicationReference = Reference(med0301) 
* medicationReference.display = "study medication"
* subject = Reference(ClinicalTrialSubject5)
* authoredOn = "1905-08-23"
* requester.display = "Could be reference to inline contained profile such as Reference(practitioner-1) Ronald Bone, MD"
* reasonCode = http://snomed.info/sct#9014002 "Psoriasis"
* dosageInstruction.text = "500mg IV q6h x 3 days"
* dosageInstruction.route = http://snomed.info/sct#47625008 "Intravenous route (qualifier value)"
* dosageInstruction.method.text = "IV Push"

Instance: AEHepaticFailure
InstanceOf: Condition
Usage: #example
Title: "AEHepaticFailure"
Description: "The fifth subject enrolled in the trial develops severe hepatic failure complicated by encephalopathy one month after starting the study. The study sponsors determined that is an unanticipated problem that must be reported because although the risk of mild liver injury was foreseen, severe liver injury resulting in hepatic failure was unexpected in severity; possibly related to participation in the research; and serious."
* subject = Reference(ClinicalTrialSubject5)
* severity = http://snomed.info/sct#24484000 "Severe"
* code =  http://snomed.info/sct#197270009 "Acute Hepatic Failure"
* clinicalStatus = http://terminology.hl7.org/CodeSystem/condition-clinical#active

Instance: AEHepaticFailurecomplication
InstanceOf: Condition
Usage: #example
Title: "AEHepaticFailurecomplication"
Description: "The fifth subject enrolled in the trial develops severe hepatic failure complicated by encephalopathy one month after starting the study. The study sponsors determined that is an unanticipated problem that must be reported because although the risk of mild liver injury was foreseen, severe liver injury resulting in hepatic failure was unexpected in severity; possibly related to participation in the research; and serious."
* subject = Reference(ClinicalTrialSubject5)
* severity = http://snomed.info/sct#24484000 "Severe"
* code =  http://snomed.info/sct#13920009 "Hepatic encephalopathy"
* clinicalStatus = http://terminology.hl7.org/CodeSystem/condition-clinical#active

Instance: medadmin0301
InstanceOf: MedicationAdministration
Usage: #example
Title: "Medication Administration of Med0301"
Description: "Medication administration example"
* contained[0] = med0301
* contained[+] = signature
* status = #in-progress
* medicationReference = Reference(med0301)
* subject.display = "Reference(Patient/pat1) Donald Duck"
* subject.identifier.system = "http://hospital.org/"
* subject.identifier.value = "pat1"
* context.identifier.system = "http://hospital.org/"
* context.identifier.value = "f001"
* context.display = "Reference(Encounter/f001) encounter who leads to this prescription"
* effectivePeriod.start = "2015-01-15T14:30:00+01:00"
* performer.actor.identifier.system = "http://hospital.org/"
* performer.actor.identifier.value = "f007"
* performer.actor.display = "Reference(Practitioner/f007) Patrick Pump"
* reasonCode = http://terminology.hl7.org/CodeSystem/reason-medication-given#b "Given as Ordered"
* request.identifier.system = "http://hospital.org/"
* request.identifier.value = "medrx0318"
* request.display = "Reference(MedicationRequest/medrx0318)"
* dosage.text = "500mg IV q6h x 3 days"
* dosage.route = http://snomed.info/sct#47625008 "Intravenous route (qualifier value)"
* dosage.method.text = "IV Push"
* dosage.dose = 500 'mg' "mg"
* eventHistory = Reference(signature) "Author's Signature"

Instance: med0301
InstanceOf: Medication
Usage: #inline
* code = http://hl7.org/fhir/sid/ndc#0069-2587-10 
* code.text = "Vancomycin"
//"Vancomycin Hydrochloride (VANCOMYCIN HYDROCHLORIDE)"

Instance: signature
InstanceOf: Provenance
Usage: #inline
* target.identifier.system = "http://hospital.org/"
* target.identifier.value = "physiotherapy"
* target.display = "Reference(ServiceRequest/physiotherapy)"
* recorded = "2017-02-01T17:23:07Z"
* agent.role = http://terminology.hl7.org/CodeSystem/v3-ParticipationType#AUT
* agent.who.display = "Reference(Practitioner/example) Dr Adam Careful"
* signature.type = urn:iso-astm:E1762-95:2013#1.2.840.10065.1.12.1.1 "Author's Signature"
* signature.when = "2017-02-01T17:23:07Z"
* signature.who.display = "Practitioner/example Dr Adam Careful"
* signature.targetFormat = #application/fhir+xml
* signature.sigFormat = #application/signature+xml
* signature.data = "dGhpcyBibG9iIGlzIHNuaXBwZWQ="