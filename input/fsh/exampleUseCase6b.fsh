//https://confluence.hl7.org/pages/viewpage.action?pageId=49646529#AdverseEventUseCases-UseCase6-AdverseReactionreportingviaFDAMedWatchform
//PRE_IC07 Vulcan Accelerator Adverse Event Use Case_BakerWillis_2022-05-03_FINAL

//A 64-year old woman (Janet)
Instance: JanetPatient
InstanceOf: Patient
Usage: #example
Title: "Janet Patient"
Description: "Patient Janet, 64-year old woman on clinical trial"
//* extension[0].id = "race"
//* extension[=].extension[0].url = "ombCategory"
//* extension[=].extension[=].valueCoding = urn:oid:2.16.840.1.113883.6.238#2106-3 "White"
//* extension[=].extension[+].url = "text"
//* extension[=].extension[=].valueString = "White"
//* extension[=].url = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-race"
//* extension[+].id = "ethnicity"
//* extension[=].extension[0].url = "ombCategory"
//* extension[=].extension[=].valueCoding = urn:oid:2.16.840.1.113883.6.238#2186-5 "Not Hispanic or Latino"
//* extension[=].extension[+].url = "text"
//* extension[=].extension[=].valueString = "Not Hispanic or Latino"
//* extension[=].url = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-ethnicity"
* identifier[0].use = #usual
* identifier[=].type.coding.system = "http://terminology.hl7.org/CodeSystem/v2-0203"
* identifier[=].type.coding.code = #MR
* identifier[=].type.text = "EPI"
* identifier[=].system = "urn:oid:2.16.840.1.113883.2.4.6.3"
* identifier[=].value = "738472983"
* name
  * given[0] = "Janet"
  * family = "Clinical Trial Patient"
* telecom[0].system = #phone
* telecom[=].value = "0648352638"
* telecom[=].use = #mobile
* telecom[+].system = #email
* telecom[=].value = "p.heuvel@gmail.com"
* telecom[=].use = #home
* gender = #female
* birthDate = 1961-04-08
* deceasedBoolean = false
* address.use = #home
* address.line = "123 Just Moved from Overseas St"
* address.city = "Sagaponack"
* address.state = "NY"
* address.postalCode = "11962"
* address.country = "US"
* maritalStatus = http://terminology.hl7.org/CodeSystem/v3-MaritalStatus#M "Married"
* multipleBirthBoolean = true
* contact.relationship = http://terminology.hl7.org/CodeSystem/v2-0131#C
* contact.name.use = #usual
* contact.name.family = "Abels"
* contact.name.given = "Sarah"
* contact.telecom.system = #phone
* contact.telecom.value = "0690383372"
* contact.telecom.use = #mobile
* communication.language = urn:ietf:bcp:47#nl "Dutch"
* communication.language.text = "Nederlands"
* communication.preferred = true
* managingOrganization.identifier.system = "http://hospital.orgsrus/"
* managingOrganization.identifier.value = "f001"
* managingOrganization.display = "Reference(Organization/f001) Burgers University Medical Centre"

// is participating in a breast cancer clinical trial.
Instance: BreastCancerTrial
InstanceOf: ResearchStudy
Usage: #example
Title: "Breast Cancer Trial"
Description: "Breast Cancer clinical trial example"
* identifier.system = "http://clinicaltrials.gov/"
* identifier.value = "NCT01234567"
* identifier.assigner.display = "Allesgut Pharmaceuticals"
* title = "Breast Cancer Clinical Trial bresentrik study" 
* status = http://hl7.org/fhir/research-study-status#active
* primaryPurposeType = http://terminology.hl7.org/CodeSystem/research-study-prim-purp-type#treatment "Treatment"
* phase = http://terminology.hl7.org/CodeSystem/research-study-phase#phase-2-phase-3
//* category = http://hl7.org/fhir/study-design#SEVCO:01001 "Interventional research"
* category.text = "Interventional research"
* condition = http://snomed.info/sct#254837009 "Breast Cancer"
* contact.telecom.system = http://hl7.org/fhir/contact-point-system#phone
* contact.telecom.value = "123-123-1234"
* description = "Eligible participants will be those diagnosed with HER2-positive (IHC 3+ or ISH+), metastatic breast cancer, who have received no prior chemotherapy or HER2-targeted therapy for advanced or metastatic breast cancer. The study aims to evaluate the efficacy, and safety of bresentrik, alone or with pertuzumab, compared with the standard of care treatment (taxane [docetaxel or paclitaxel], trastuzumab and pertuzumab). This study aims to see if bresentrik allows patients to live longer without the cancer getting worse, or simply to live longer, compared to patients receiving standard of care chemotherapy. This study is also looking to see how the treatment and the cancer affects patients' quality of life."
* enrollment.display = "This would be a reference to a Group, use Group.characteristic to define inclusion and exclusion criteria"
* period.start = "2021-03-23"
* period.end = "2029-03-23"
* sponsor.display = "This would be a reference Organization and would be the body legally responsible for the trial"
* principalInvestigator.display = "This would be a reference to a Practitioner or PractionerRole"
* site.display = "This would be a reference to a Location containing the facility where the trial is taking place"
* arm[0].name = "Arm A"
//* arm[0].type = http://hl7.org/fhir/research-study-arm-type#experimental
* arm[0].type.text = "Experimental"
* arm[0].description = "Bresentrik (B) plus pertuzumab-matching placebo"
* arm[+].name = "Arm B"
//* arm[=].type = http://examplesystem#experimental
* arm[=].type.text = "Experimental"
* arm[=].description = "Bresentrik (B) plus pertuzumab"
* arm[+].name = "Arm C"
//* arm[=].type = http://examplesystem#active-comparator
* arm[=].type.text = "Active Comparator"
* arm[=].description = "Standard of care (Taxane (paclitaxel or docetaxel), trastuzumab, and pertuzumab)"
* protocol.display = "This would reference the PlanDefinition which would contain references to Bresentrik"


//weight observation example
Instance: weight-janet
InstanceOf: Observation
Usage: #example
Title: "Janet weight Observation"
Description: "Janet weight observation"
* status = #final
* category = http://terminology.hl7.org/CodeSystem/observation-category#vital-signs "Vital Signs"
* category.text = "Vital Signs"
* code = http://loinc.org#29463-7 "Body Weight"
* code.text = "weight"
* subject = Reference(JanetPatient) "Janet"
* encounter.display = "GP Visit"
* effectiveDateTime = "2023-04-10"
* valueQuantity = 20.09414 'kg' "kg"
* method.text = "Patient-entered"
* performer.display = "referred to in provenance for weight"


//Provenance for weight
Instance: provenance-for-weight
InstanceOf: Provenance
Usage: #example
Title: "Provenance for Janet weight Observation"
Description: "Provenance for Janet weight Observation"
//* target.extension.url = "http://hl7.org/fhir/StructureDefinition/targetElement"
//* target.extension.valueUri = "race"
* target = Reference(weight-janet)
* recorded = "2023-04-12T15:26:23.217+00:00"
//* agent[0].role =  http://terminology.hl7.org/CodeSystem/v3-RoleClass#PROV "healthcare provider"
* agent[0].type = http://terminology.hl7.org/CodeSystem/provenance-participant-type#author "Author"
* agent[=].who.display = "Provenance Author. Will be reference to the PractitionerRole that authored the measurement. Needs to include a reference to the organization that is responsible for the measurement, at a minimum"
* agent[+].type = http://terminology.hl7.org/CodeSystem/provenance-participant-type#informant "Informant"
* agent[=].who = Reference(JanetPatient)
* agent[=].who.display = "Janet, the patient who informed the system of the weight authored by the ProvanceAuthor"


//Blood pressure observation example
Instance: blood-pressure-janet
InstanceOf: Observation
Usage: #example
Title: "Janet Blood Pressure Observation"
Description: "Janet Blood Pressure Observation"
* status = #final
* category = http://terminology.hl7.org/CodeSystem/observation-category#vital-signs "Vital Signs"
* category.text = "Vital Signs"
* code = http://loinc.org#85354-9 "Blood pressure panel with all children optional"
* code.text = "Blood pressure systolic and diastolic"
* subject = Reference(JanetPatient) "Janet"
* encounter.display = "GP Visit"
* effectiveDateTime = "2023-04-10"
* component[0].code = http://loinc.org#8480-6 "Systolic blood pressure"
* component[=].code.text = "Systolic blood pressure"
* component[=].valueQuantity = 109 'mm[Hg]' "mmHg"
* component[+].code = http://loinc.org#8462-4 "Diastolic blood pressure"
* component[=].code.text = "Diastolic blood pressure"
* component[=].valueQuantity = 44 'mm[Hg]' "mmHg"
* performer.display = "referred to in provenance for blood-pressure-janet"


//Provenance for blood-pressure-janet
Instance: provenance-for-blood-pressure-janet
InstanceOf: Provenance
Usage: #example
Title: "Provenance for Janet Blood Pressure  Observation"
Description: "Provenance for Janet Blood Pressure  Observation"
//* target.extension.url = "http://hl7.org/fhir/StructureDefinition/targetElement"
//* target.extension.valueUri = "race"
* target = Reference(blood-pressure-janet)
* recorded = "2023-04-12T15:26:23.217+00:00"
//* agent[0].role =  http://terminology.hl7.org/CodeSystem/v3-RoleClass#PROV "healthcare provider"
* agent[0].type = http://terminology.hl7.org/CodeSystem/provenance-participant-type#author "Author"
* agent[=].who.display = "Provenance Author. Will be reference to the PractitionerRole that authored the measurement. Needs to include a reference to the organization that is responsible for the measurement, at a minimum"
* agent[+].type = http://terminology.hl7.org/CodeSystem/provenance-participant-type#informant "Informant"
* agent[=].who = Reference(JanetPatient)
* agent[=].who.display = "Janet, the patient who informed the system of the weight authored by the ProvanceAuthor"



//Janet medications
//reported by JanetPatient
Instance: example001
InstanceOf: MedicationStatement
Usage: #example
Title: "Janet Tylenol PM med"
Description: "Self reported Janet Tylenol PM med"
* contained = med0309
* identifier.use = #official
* identifier.system = "http://www.bmc.nl/portal/medstatements"
* identifier.value = "12345689"
* status = #active
* medicationReference = Reference(med0309)
* subject = Reference(JanetPatient) "Janet"
* effectiveDateTime = "2015-01-23"
* dateAsserted = "2023-04-12"
* informationSource = Reference(JanetPatient) "Janet"
* derivedFrom.identifier.system = "http://www.bmc.nl/portal/medstatements"
* derivedFrom.identifier.value = "medrx002"
* derivedFrom.display = "Reference(medrx002)"
* reasonCode = http://snomed.info/sct#32914008 "Restless Legs"
* note.text = "Patient indicates they miss the occasional dose"
* dosage.sequence = 1
* dosage.text = "1-2 tablets once daily at bedtime as needed for restless legs"
* dosage.additionalInstruction.text = "Taking at bedtime"
* dosage.timing.repeat.frequency = 1
* dosage.timing.repeat.period = 1
* dosage.timing.repeat.periodUnit = #d
* dosage.asNeededCodeableConcept = http://snomed.info/sct#32914008 "Restless Legs"
* dosage.route = http://snomed.info/sct#26643006 "Oral Route"
* dosage.doseAndRate.type = http://terminology.hl7.org/CodeSystem/dose-rate-type#ordered "Ordered"
* dosage.doseAndRate.doseRange.low = 1 http://terminology.hl7.org/CodeSystem/v3-orderableDrugForm#TAB "TAB"
* dosage.doseAndRate.doseRange.high = 2 http://terminology.hl7.org/CodeSystem/v3-orderableDrugForm#TAB "TAB"

Instance: med0309
InstanceOf: Medication
Usage: #inline
* code = http://hl7.org/fhir/sid/ndc#50580-506-02 
//"Tylenol PM Extra Strength, 2 TABLET, FILM COATED in 1 POUCH (50580-506-02) (package)"
* code.text = "Tylenol PM"
* form = http://snomed.info/sct#385057009 "Film-coated tablet"
* ingredient[0].itemCodeableConcept = http://www.nlm.nih.gov/research/umls/rxnorm#315266 "Acetaminophen 500 MG"
* ingredient[=].strength.numerator = 500 'mg'
* ingredient[=].strength.denominator = 1 http://terminology.hl7.org/CodeSystem/v3-orderableDrugForm#TAB
* ingredient[+].itemCodeableConcept = http://www.nlm.nih.gov/research/umls/rxnorm#901813 "Diphenhydramine Hydrochloride 25 mg"
* ingredient[=].strength.numerator = 25 'mg'
* ingredient[=].strength.denominator = 1 http://terminology.hl7.org/CodeSystem/v3-orderableDrugForm#TAB
* batch.lotNumber = "9494788"
* batch.expirationDate = "2025-05-25"

Instance: example007
InstanceOf: MedicationStatement
Usage: #example
Title: "Janet allergy med"
Description: "Self reported Janet allergy med"
* contained = med0315
* status = #active
* medicationReference = Reference(med0315)
* subject = Reference(JanetPatient) "Janet"
* dateAsserted = "2023-04-12"
* informationSource = Reference(JanetPatient) "Janet"
* note.text = "patient plans to start using for seasonal allergies in the Spring when pollen is in the air"

Instance: med0315
InstanceOf: Medication
Usage: #inline
* code = http://www.nlm.nih.gov/research/umls/rxnorm#358793 
//"mometasone furoate 0.05mg/Actuat"
* code.text = "Nasonex"
* form = http://snomed.info/sct#385157007 "Nasal Spray"

Instance: example003
InstanceOf: MedicationStatement
Usage: #example
Title: "Janet pill for water retention med not known"
Description: "Self reported Janet pill for water retention med not known"
* status = #active
* medicationCodeableConcept.text = "Little Pink Pill for water retention"
* subject = Reference(JanetPatient) "Janet"
* effectiveDateTime = "2023-02-01"
* dateAsserted = "2023-04-12"
* informationSource = Reference(JanetPatient) "Janet"
* reasonReference = Reference(blood-pressure-janet)
* note.text = "Patient cannot remember the name of the tablet, but takes it every day in the morning for water retention"
* dosage.sequence = 1
* dosage.text = "1 tablet per day"
* dosage.asNeededBoolean = false
* dosage.route = http://snomed.info/sct#26643006 "Oral Route"
* dosage.doseAndRate.type = http://terminology.hl7.org/CodeSystem/dose-rate-type#ordered "Ordered"
* dosage.doseAndRate.doseQuantity = 1 http://terminology.hl7.org/CodeSystem/v3-orderableDrugForm#TAB "tab"
* dosage.maxDosePerPeriod.numerator.value = 1
* dosage.maxDosePerPeriod.denominator = 1 'd'

//bresentrik study medication treatment MedicationAdministration
//has timing details
Instance: medicationAdministration-for-bresentrik
InstanceOf: MedicationAdministration
Usage: #example
Title: "Medication Administration for bresentrik"
Description: "Study medication info Medication Administration for bresentrik"
* contained[0] = signature-medicationAdministration-bresentrik
* status = #completed
* medicationReference = Reference(bresentrik)
* subject = Reference(JanetPatient) "Janet"
* context.identifier.system = "http://hospitalNumber2"
* context.identifier.value = "f001"
* context.display = "Reference(Encounter/f001) encounter which leads to this prescription"
* effectivePeriod.start = "2023-04-05T14:30:00+01:00"
* effectivePeriod.end = "2023-04-07T14:30:00+01:00"
* performer.actor.identifier.system = "http://a.fhir.server/svc/StructureDefinition/"
* performer.actor.identifier.value = "c8973a22-2b5b-4e76-9c66-00639c99e61b"
* performer.actor.display = "Reference(http://a.fhir.server/svc/StructureDefinition/c8973a22-2b5b-4e76-9c66-00639c99e61b) Patrick Pump"
* reasonCode = http://terminology.hl7.org/CodeSystem/reason-medication-given#b "Given as Ordered"
* request = Reference(medicationrequest-for-bresentrik)
* dosage.text = "6 mg PO daily for remission induction; adjust dosage to white blood cell (WBC) count.  With hold treatment if WBC is less than 15,000/µL; resume when WBC is greater than 50,000/µL"
* dosage.route = http://snomed.info/sct#26643006 "Oral route (qualifier value)"
* dosage.dose = 6 'mg' "mg"
* eventHistory = Reference(signature-medicationAdministration-bresentrik) "Author's Signature"
//* performer.actor = Reference(Practitioner/f007) "Patrick Pump"

Instance: signature-medicationAdministration-bresentrik
InstanceOf: Provenance
Usage: #inline
* target.identifier.system = "http://hospital2.org/"
* target.identifier.value = "oncology321"
* target.display = "Reference(ServiceRequest/oncology321)"
* recorded = "2023-04-05T17:23:07Z"
* agent.role = http://terminology.hl7.org/CodeSystem/v3-ParticipationType#AUT
* agent.who.display = "Reference(Practitioner/example) Dr Adam Careful"
* signature.type = urn:iso-astm:E1762-95:2013#1.2.840.10065.1.12.1.1 "Author's Signature"
* signature.when = "2023-04-05T17:23:07Z"
* signature.who.identifier.system = "http://hospital.org/"
* signature.who.identifier.value = "DrAdamCareful"
* signature.who.display = "Reference(Practitioner/example) Dr Adam Careful"
* signature.targetFormat = #application/fhir+xml
* signature.sigFormat = #application/signature+xml
* signature.data = "dGhpcyBibG9iIGlzIHNuaXBwZWQ="

//bresentrik study medication treatment MedicationRequest
//request
Instance: medicationrequest-for-bresentrik
InstanceOf: MedicationRequest
Title: "Medication Request for bresentrik"
Description: "Study medication info Medication Request for bresentrik"
Usage: #example
//* contained = bresentrik
* status = #active
* intent = #order
* identifier.use = #official
* identifier.system = "http://www.bmc.nl/portal/medstatements"
* identifier.value = "1234568900-studyDrug" 
* medicationReference = Reference(bresentrik) "bresentrik 2mg tablet"
* subject = Reference(JanetPatient) "Janet"
* authoredOn = "2023-04-05"
* requester.display = "Could be reference to inline contained profile such as Reference(practitioner-1) Ronald Bone, MD"
* reasonCode = http://snomed.info/sct#254837009 "Breast Cancer"
* dosageInstruction.sequence = 1
* dosageInstruction.text = "6 mg PO daily for remission induction; adjust dosage to white blood cell (WBC) count.  With hold treatment if WBC is less than 15,000/µL; resume when WBC is greater than 50,000/µL"
* dosageInstruction.timing.repeat.frequency = 1
* dosageInstruction.timing.repeat.period = 1
* dosageInstruction.timing.repeat.periodUnit = #d
* dosageInstruction.route = http://snomed.info/sct#26643006 "Oral route (qualifier value)"
* dosageInstruction.doseAndRate.type = http://terminology.hl7.org/CodeSystem/dose-rate-type#ordered "Ordered"
* dosageInstruction.doseAndRate.doseQuantity = 6 'mg' "mg"
* dispenseRequest.numberOfRepeatsAllowed = 1
* dispenseRequest.quantity = 600 'mg' "mg"
* dispenseRequest.expectedSupplyDuration = 30 'd' "days"
* supportingInformation = Reference(BreastCancerTrial)
* instantiatesCanonical = "http://baseUrlOfHospitalHolding/PlanDefinition/protocol-for-the-ResearchStudy"


Instance: bresentrik
InstanceOf: Medication
Usage: #example
Title: "Medication is bresentrik"
Description: "Study medication, bresentrik"
//* code = http://www.nlm.nih.gov/research/umls/rxnorm#000000 "bresentrik 15 MG/ML Oral Solution"
* code.text = "bresentrik 15 MG/ML Oral Solution"

//Janet went home and began vomiting uncontrollably. 
//problem
//Her husband called an ambulance and Janet was taken to the hospital where she was treated in the ER and released.
//ER Encounter, the ER encounter is referenced in the condition
//reference to condition where http://snomed.info/sct#332982000 "Uncontrollable vomiting"
Instance: janetReported-condition
InstanceOf: Condition
Usage: #example
Title: "Problem"
Description: "Patient reported AE problem"
* identifier.value = "12345"
* code = http://snomed.info/sct#332982000 "Uncontrollable vomiting"
* subject = Reference(JanetPatient) "Janet"
* encounter.display = "Reference to ER visit Janet went to. Be sure to include provenance"
* onsetDateTime = "2023-04-10"
* clinicalStatus = http://terminology.hl7.org/CodeSystem/condition-clinical#resolved
* abatementString = "around April 10, 2023"
* recordedDate = "2023-04-12"
* recorder = Reference(JanetPatient) "Janet"
* asserter = Reference(JanetPatient) "Janet"
* evidence.code = http://snomed.info/sct#258710007 "degrees C"
* evidence.detail.identifier.system = "http://hospital"
* evidence.detail.identifier.value = "f202"
* evidence.detail.display = "Reference(Observation/f202) Temperature"


//research subject Janet?
//no research subject added to the Patient reported one as the Patient would not be given their study id at this point


//ADVERSE EVENT
Instance: clinical-research-ae-example-medwatch-patient-report
InstanceOf: AdverseEvent-clinical-research
Usage: #example
Title: "Patient reported AE during research study"
Description: "Patient report of Adverse Event, example of data that would be on MedWatch form as reported by Patient" 
* modifierExtension[status].valueCode = http://hl7.org/fhir/event-status#completed

//A1 What kind of problem was it? (Check all that apply)
//Were hurt or had a bad side effect (including new or worsening symptoms)
* event = http://snomed.info/sct#370901008 "Serious reportable event associated with product or device"

//"Required help to prevent permanent harm"
//A2 Did any of the following happen?
* extension[seriousness-criteria][0].extension[criterionPresent].valueBoolean = true
* extension[seriousness-criteria][=].extension[criterionCode].valueCodeableConcept = http://ncicb.nci.nih.gov/xml/owl/EVS/Thesaurus.owl#C201939 "Required Intervention to Prevent Permanent Impairment/damage"
//#requiresPreventImpairment "required intervention to prevent permanent damage"

* extension[seriousness-criteria][0].extension[criterionCode].valueCodeableConcept = http://ncicb.nci.nih.gov/xml/owl/EVS/Thesaurus.owl#C11338 "Results In Persistent Or Significant Disability"
* extension[seriousness-criteria][=].extension[criterionPresent].valueBoolean = false
* extension[seriousness-criteria][+].extension[criterionCode].valueCodeableConcept = http://ncicb.nci.nih.gov/xml/owl/EVS/Thesaurus.owl#C83052 "Requires Inpatient Hospitalization"
* extension[seriousness-criteria][=].extension[criterionPresent].valueBoolean = false
* extension[seriousness-criteria][+].extension[criterionCode].valueCodeableConcept = http://ncicb.nci.nih.gov/xml/owl/EVS/Thesaurus.owl#C48275 "Death Related to Adverse Event"
* extension[seriousness-criteria][=].extension[criterionPresent].valueBoolean = false
* extension[seriousness-criteria][+].extension[criterionCode].valueCodeableConcept = http://ncicb.nci.nih.gov/xml/owl/EVS/Thesaurus.owl#C84266 "Is Life Threatening"
* extension[seriousness-criteria][=].extension[criterionPresent].valueBoolean = false
* extension[seriousness-criteria][+].extension[criterionCode].valueCodeableConcept = http://ncicb.nci.nih.gov/xml/owl/EVS/Thesaurus.owl#C83117 "Congenital Anomaly or Birth Defect"
* extension[seriousness-criteria][=].extension[criterionPresent].valueBoolean = false
* extension[seriousness-criteria][+].extension[criterionCode].valueCodeableConcept = http://ncicb.nci.nih.gov/xml/owl/EVS/Thesaurus.owl#C82521 "Other Medically Important Condition"
* extension[seriousness-criteria][=].extension[criterionPresent].valueBoolean = false

//A3
//After receiving the study drug (bresentrik) during a study visit, 
//timing medication given before ae reported on 4/12
* date = 2023-04-10

//A4 note
* extension[note][+].valueAnnotation.authorReference = Reference(JanetPatient)
* extension[note][=].valueAnnotation.time = 2023-04-12
* extension[note][=].valueAnnotation.text = "A 64-year-old woman (Janet) is participating in a breast cancer clinical trial and taking an investigational drug. As part of her participation in the study, she was instructed to use a patient reported outcomes (ePRO) application to report an adverse event that resulted in any of the following: hospitalization, required help to prevent permanent harm, disability or health problem, birth defect, life-threatening, death, other serious/important medical incident (this list identifies the event as being serious events). The application is designed to capture data elements found on the 3500A Form. 

The Clinical Investigator (CI) receives a notification that Janet has an adverse event and reviews the event in Janet’s EHR system. The adverse event form is pre-populated from EHR data for the clinical investigator. The CI assesses causality for Janet’s adverse event and submits the serious adverse event to the sponsor. The sponsor reviews the received adverse event and performs its own causality assessment. Since this event is a Suspected Unexpected Serious Adverse Reaction (SUSAR) within FDA’s regulation. If the Suspected Unexpected Serious Adverse Reaction (SUSAR) was life threatening or death, it is submitted within 7 calendar days.

Any other types of seriousness are submitted within 15 calendar days."


//Janet went home and began vomiting uncontrollably. 
//problem
//Her husband called an ambulance and Janet was taken to the hospital where she was treated in the ER and released.
//ER Encounter, the ER encounter is referenced in the condition
* extension[resultingEffect][0].valueReference = Reference(Condition/janetReported-condition)
//reference to condition where http://snomed.info/sct#332982000 "Uncontrollable vomiting"

//seriousness will be defined by investigator, but required so in this patient reported version we get the patient choosing !?
//probably should be 0..1 !? 
* seriousness = http://terminology.hl7.org/CodeSystem/adverse-event-seriousness#serious
//outcome is also strange for a patient to enter but can be revised by clinician
* outcome = http://ncicb.nci.nih.gov/xml/owl/EVS/Thesaurus.owl#C49498 "Recovered/Resolved"


//Section B PRODUCT AVAILABILITY
//Questionnaire? and DocuementReference for picture of product?
// add as an extension with 0..1 cardinality in use case specific IG, us realm? 

//Section C
//although some of this might also appear in section A4
//After receiving the study drug (bresentrik) during a study visit, 
//Medication - study drug given 4/10/2023
//Section C1,2,3,4,5,6,7,8,9,10,11,12,13,14,15 all derived from the medication reference 
// in suspect entity
// note also need supporting-Info medicationRequest
* extension[suspect-entity][+].extension[instance].valueReference = Reference(bresentrik) 
* extension[suspect-entity][=].extension[causality].extension[entityRelatedness].valueCodeableConcept = http://ncicb.nci.nih.gov/xml/owl/EVS/Thesaurus.owl#C53258 "Possibly Related"
* extension[suspect-entity][=].extension[causality].extension[author].valueReference = Reference(JanetPatient) "Janet"

* extension[supporting-info][+].extension[item].valueReference = Reference(MedicationAdministration/medicationAdministration-for-bresentrik)

* extension[suspect-entity][+].extension[instance].valueReference = Reference(BreastCancerTrial)
* extension[suspect-entity][=].extension[causality].extension[entityRelatedness].valueCodeableConcept = http://ncicb.nci.nih.gov/xml/owl/EVS/Thesaurus.owl#C53258 "Possibly Related"
* extension[suspect-entity][=].extension[causality].extension[author].valueReference = Reference(JanetPatient) "Janet"
* study = Reference(BreastCancerTrial)
 

//C16, C17 we do not know from the data in the use case
//section C16 and C17, are either going to be inferred or possible use questionnaire
//16. Did the problem stop after the person reduced the dose or stopped taking or using the product? Yes No
//17. Did the problem return if the person started taking or using the product again? Yes No Didn’t restart
 


//section E1, initials?

//section E2, E4 from Patient resource. 
//section E6 and E7 rely on US CORE use of Ethnicity and Race -- specific to US realm 
//section E3 Age would be calculated from BirthDate
* subject = Reference(JanetPatient) "Janet"

//section E5 weight most recent observation picked from list - US realm specific
* extension[supporting-info][+].extension[item].valueReference = Reference(weight-janet)

//The data from her health systems were aggregated to allow her a single view of all her medical information. 
//section E8, 9, 10, 11, 12 all are references selected from drop-down plus patient additions
* extension[supporting-info][+].extension[item].valueReference = Reference(blood-pressure-janet)

//section E8, 9, 10, 11, 12 patient additions Janet was able to add more information that was not included in her imported data (OTC drugs, vitamins, etc.). as fhir resource vitamin
* extension[supporting-info][+].extension[item].valueReference = Reference(example001)
* extension[supporting-info][+].extension[item].valueReference = Reference(example007)
* extension[supporting-info][+].extension[item].valueReference = Reference(example003)


//The following morning, Janet opened the study designated consumer facing FHIR application and completed the MedWatch Form FDA 3500B autofill (demographics, meds, allergies, conditions, labs). She is given the option to display and choose the relevant items from each category (example: only current meds she is taking, current labs, etc. which might be a subset of her full PHR).
//section F
//if Janet Husband then would use RelatedPerson
* recorder = Reference(JanetPatient)

//section F10 and F11
//10. Did you report this problem to the company that makes the product (the manufacturer/compounder)? Yes No
//11. If you do NOT want your identity disclosed to the manufacturer, place an "X" in this box:
//Questionnaire? DocReference? 

//The data is then absorbed within the receiver’s system to auto populate a MedWatch Form FDA 3500B for submission to the FDA within 24 hours.

//Severity or grade is applied by clinical researcher, so a Patient would not provide one
//* severity = http://terminology.hl7.org/CodeSystem/adverse-event-severity#moderate "Moderate"