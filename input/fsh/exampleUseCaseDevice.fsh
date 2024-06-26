// Cancer clinical trial example 
Instance: patient-example-kaitlyn-b1
InstanceOf: Patient
Description: "Compass Trial example patient Kaitlynn B1"
* identifier.use = #usual
* identifier.type = http://terminology.hl7.org/CodeSystem/v2-0203#MR "Medical Record Number"
* identifier.system = "http://hospital.example.org"
* identifier.value = "m1234"
* name.family = "Hammer"
* name.given[0] = "Kaitlynn"
* contact.telecom[0].system = #phone
* contact.telecom[0].value = "549-123-4560"
* contact.telecom[0].use = #home
* contact.telecom[1].system = #email
* contact.telecom[1].value = "kaitlynb1@example.com"
* gender = #female
* birthDate = "1985-02-25"
* address.line = "123 Main St"
* address.city = "Anytown"
* address.postalCode = "12347"
* address.country = "US"
* communication.language = urn:ietf:bcp:47#en-US "English (Region=United States)"
* communication.language.text = "English"


Instance: medication-request-example-kadcyla1
InstanceOf: MedicationRequest
Description: "Example showing clinical trial medication Kadcyla"
* status = #active "active"
* intent = #order
* medicationCodeableConcept = http://www.nlm.nih.gov/research/umls/rxnorm#1371046 "KADCYLA"
* subject = Reference(patient-example-kaitlyn-b1)
* requester = Reference(practitioner-owen-oncologist)
* dosageInstruction.timing.repeat.boundsPeriod.start = "2020-04-03"
* authoredOn = "2020-03-15"
* dosageInstruction.text = "Kadcyla IV at 3.6mg"
* dosageInstruction.route = http://snomed.info/sct#47625008 "Intravenous route (qualifier value)"
* dosageInstruction.doseAndRate.rateQuantity = 3.6 'mg' "mg"
// Once every 21 days
* dosageInstruction.maxDosePerAdministration.value = 1


Instance: medication-administration-kadcyla1
InstanceOf: MedicationAdministration
Description: "Example showing clinical trial medication adminstration Kadcyla"
* status = #completed "completed"
* medicationCodeableConcept = http://www.nlm.nih.gov/research/umls/rxnorm#1371046 "KADCYLA"
* subject = Reference(patient-example-kaitlyn-b1)
* performer.actor = Reference(practitioner-oncology-nurse-jane)
//* reasonReference = Reference(kaitlyn-primary-cancer-condition-ex1)
* request = Reference(medication-request-example-kadcyla1)
* effectiveDateTime = "2020-04-01"
* note.authorReference = Reference(practitioner-oncology-nurse-jane)
* note.time = "2020-04-01"
* note.text = "3.6mg administered by continuous infusion. Patient tolerated infusion without side effects."
* dosage.dose = 3.6 'mg' "mg"
* dosage.route = http://snomed.info/sct#47625008 "Intravenous route (qualifier value)"

Instance: clinical-trial-example-subject1
InstanceOf: ResearchSubject
Description: "Alliance COMPASS trial research subject"
* identifier[0].use = #usual
* identifier[=].value = "ABC21348"
* status = #withdrawn
* study = Reference(clinical-trial-example-compass)
* individual = Reference(patient-example-kaitlyn-b1)
* consent.display = "this would be a reference to a Consent instance"


Instance: adverse-event-device-death
InstanceOf: AdverseEvent-clinical-research
Description: "Device suspected entity"
* subject = Reference(patient-example-kaitlyn-b1)
* modifierExtension[status].valueCode = #completed //http://hl7.org/fhir/event-status#completed

* event = http://snomed.info/sct#370903006  "Patient death or serious disability associated with the use or function of a device in patient care, in which the device is used or functions other than as intended (event)" 
* event.text = "Patient death due to device explosion"

* category = http://terminology.hl7.org/CodeSystem/adverse-event-category#device "Device"

* extension[ae-grade].valueCodeableConcept = http://ncicb.nci.nih.gov/xml/owl/EVS/Thesaurus.owl#C48275
* extension[ae-grade].valueCodeableConcept.text = "Grade 5 Death related to adverse event"

* seriousness = http://terminology.hl7.org/CodeSystem/adverse-event-seriousness#serious "Serious"

* extension[seriousness-criteria][0].extension[criterionCode].valueCodeableConcept = http://ncicb.nci.nih.gov/xml/owl/EVS/Thesaurus.owl#C11338	"Results In Persistent Or Significant Disability"
* extension[seriousness-criteria][=].extension[criterionPresent].valueBoolean = false
* extension[seriousness-criteria][+].extension[criterionCode].valueCodeableConcept = http://ncicb.nci.nih.gov/xml/owl/EVS/Thesaurus.owl#C83052	"Requires Inpatient Hospitalization"
* extension[seriousness-criteria][=].extension[criterionPresent].valueBoolean = false
* extension[seriousness-criteria][+].extension[criterionCode].valueCodeableConcept = http://ncicb.nci.nih.gov/xml/owl/EVS/Thesaurus.owl#C48275	"Death Related to Adverse Event"
* extension[seriousness-criteria][=].extension[criterionPresent].valueBoolean = true
* extension[seriousness-criteria][+].extension[criterionCode].valueCodeableConcept = http://ncicb.nci.nih.gov/xml/owl/EVS/Thesaurus.owl#C84266	"Is Life Threatening"
* extension[seriousness-criteria][=].extension[criterionPresent].valueBoolean = false
* extension[seriousness-criteria][+].extension[criterionCode].valueCodeableConcept = http://ncicb.nci.nih.gov/xml/owl/EVS/Thesaurus.owl#C83117	"Congenital Anomaly or Birth Defect"
* extension[seriousness-criteria][=].extension[criterionPresent].valueBoolean = false
* extension[seriousness-criteria][+].extension[criterionCode].valueCodeableConcept = http://ncicb.nci.nih.gov/xml/owl/EVS/Thesaurus.owl#C82521	"Other Medically Important Condition"
* extension[seriousness-criteria][=].extension[criterionPresent].valueBoolean = false
* extension[seriousness-criteria][+].extension[criterionCode].valueCodeableConcept = http://ncicb.nci.nih.gov/xml/owl/EVS/Thesaurus.owl#C201939 "Required Intervention to Prevent Permanent Impairment/damage"
//$fda-add-seriousness-criteria-cs#requiresPreventImpairment "Required Intervention to Prevent Permanent Impairment or Damage (Devices)"
* extension[seriousness-criteria][=].extension[criterionPresent].valueBoolean = false

* extension[resultingEffect][0].valueReference.display = "Condition with Deep puncture wound (disorder) - SNOMED CT code. Note this different than the AdverseEvent.code in this instance."
* outcome = http://ncicb.nci.nih.gov/xml/owl/EVS/Thesaurus.owl#C48275 
* outcome.text = "Fatal"
* date = "2020-05-20"

* recorder = Reference(practitioner-oncology-nurse-jane)

* extension[participant][0].extension[function].valueCodeableConcept = http://terminology.hl7.org/CodeSystem/v3-ParticipationType#AUTHEN 
* extension[participant][0].extension[actor].valueReference = Reference(practitioner-owen-oncologist)

* study = Reference(clinical-trial-example-compass)

* extension[suspect-entity][0].extension[instance].valueReference = Reference(device-infuser)
* extension[suspect-entity][=].extension[causality].extension[entityRelatedness].valueCodeableConcept = http://ncicb.nci.nih.gov/xml/owl/EVS/Thesaurus.owl#C53260 "Related"

* extension[suspect-entity][+].extension[instance].valueReference = Reference(medication-administration-kadcyla1)
* extension[suspect-entity][=].extension[causality].extension[entityRelatedness].valueCodeableConcept = http://ncicb.nci.nih.gov/xml/owl/EVS/Thesaurus.owl#C53256 "Not Related"

* extension[expected-in-research-study].valueBoolean  = false

* extension[note][0].valueAnnotation.text = "During infusion of kadcyla an infuser exploded, shrapnel from the explosion caused a fatal puncture wound."


Instance: device-infuser
InstanceOf: Device
Description: "Device - Infuser that exploded"
Usage: #example
* identifier.type.coding.system = "http://hl7.org/fhir/NamingSystem/hibcc-dI"
* identifier.value = "10896128002012"
//* displayName = "Hyperspeed Chemo Infuser"
* udiCarrier.deviceIdentifier = "10896128002012"
* udiCarrier.issuer = "http://hl7.org/fhir/NamingSystem/hibcc-dI"
* udiCarrier.jurisdiction = "http://hl7.org/fhir/NamingSystem/fda-udi"
* status = #inactive
* manufacturer = "Safe Device Co"
* manufactureDate = "2000-02-01"
* expirationDate = "2021-02-01"
* modelNumber = "FRN"
* serialNumber = "C7H5N3O6"
//* category = http://hl7.org/fhir/device-category#reusable "Reusable"
* deviceName[0].name = "Hyperspeed"
* deviceName[=].type = http://hl7.org/fhir/device-nametype#manufacturer-name "Manufacturer name"
* deviceName[+].name = "Hyperspeed Chemo Infuser"
* deviceName[=].type = http://hl7.org/fhir/device-nametype#user-friendly-name "User Friendly name"
* type.text = "Infusion Pump"
* owner.display = "Place that owns the device"
* location.display = "Where device is found"



