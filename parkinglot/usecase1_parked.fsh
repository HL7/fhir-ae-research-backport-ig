
Instance: ClinicalResearchAdverseEventexample1
InstanceOf: AdverseEvent-clinical-research
Usage: #example
Title: "ClinicalResearchAdverseEventexample1"
Description: "example"
//* actuality = http://hl7.org/fhir/adverse-event-actuality#actual 
* modifierExtension[status].valueCode = #completed //http://hl7.org/fhir/event-status#completed
* subject = Reference(ClinicalTrialSubject5)
* outcome = urn:oid:2.16.840.1.113883.3.989.2.1.1.19#notrecoveredorresolved "Not recovering/not resolved"
//http://snomed.info/sct#405532008 "Adverse incident resulting in potentially permanent disabling damage"
//* seriousness = http://terminology.hl7.org/CodeSystem/adverse-event-seriousness#serious
//* resultingCondition[0] = Reference(AEHepaticFailureUseCase7) "condition caused"
* extension[ResultingEffect][0].valueReference = Reference(AEHepaticFailureUseCase7) 
//* e"condition caused"
//* resultingCondition[1] = Reference(AEHepaticFailureUseCase7complication)
* extension[ResultingEffect][1].valueReference = Reference(AEHepaticFailureUseCase7complication)
* category = http://terminology.hl7.org/CodeSystem/adverse-event-category#medication-mishap "Medication Mishap"
* study.display = "NCT1010101"
* extension[suspect-entity][0].extension[instance].valueReference.display = "Aspirin"
//* extension[suspect-entity][=].instance.display = "see instance-codeable-concept"
//* suspectEntity[=].causality.entityRelatedness = http://terminology.hl7.org/CodeSystem/adverse-event-causality-assess#certain "Certain"
* extension[suspect-entity][=].extension[causality].extension[entityRelatedness].valueCodeableConcept = http://terminology.hl7.org/CodeSystem/adverse-event-causality-assess#certain "Certain"
* extension[suspect-entity][+].extension[instance].valueReference.display = "Study Medication Use Case 7"
//* extension[suspect-entity][=].instance.display = "see instance-codeable-concept"
//* suspectEntity[=].causality.entityRelatedness = http://terminology.hl7.org/CodeSystem/adverse-event-causality-assess#certain "Certain"
* extension[suspect-entity][=].extension[causality].extension[entityRelatedness].valueCodeableConcept = http://terminology.hl7.org/CodeSystem/adverse-event-causality-assess#certain "Certain"

* extension[suspect-entity][+].extension[instance].valueReference = Reference(medadmin0301)
//* suspectEntity[=].causality.entityRelatedness = http://terminology.hl7.org/CodeSystem/adverse-event-causality-assess#certain "Certain"
* extension[suspect-entity][=].extension[causality].extension[entityRelatedness].valueCodeableConcept = http://terminology.hl7.org/CodeSystem/adverse-event-causality-assess#certain "Certain"

//* suspectEntity[=].study-information
//* suspectEntity[=].extension.url
//.extension[studyAssociatedWithAE].display = "NCT1010101"
//.extension[StudyAssociatedWithAE].display = "NCT1010101"
* seriousness = http://terminology.hl7.org/CodeSystem/adverse-event-seriousness#serious

* recorder.display = "Clinical Research Associate"
* detected = "1905-08-23"
* recordedDate = "1905-08-24"
* event = http://snomed.info/sct#370901008 "Serious reportable event associated with product or device"
* extension[seriousness-criteria].extension[criterionPresent].valueBoolean = true
//* extension[seriousness].extension[seriousnessCriteria].valueCodeableConcept = seriousness-criteria-cs#requiresPreventImpairment "required intervention to prevent permanent damage"
* extension[seriousness-criteria].extension[criterionCode].valueCodeableConcept = fda-add-seriousness-criteria-cs#requiresPreventImpairment "Required Intervention to Prevent Permanent Impairment or Damage (Devices)"
//#requiresPreventImpairment "required intervention to prevent permanent damage"
* extension[severity-or-grade].valueCodeableConcept = $ae-severity-or-grade-cs#3 "Severe"

