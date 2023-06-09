//https://confluence.hl7.org/pages/viewpage.action?pageId=49646529#AdverseEventUseCases-UseCase6-AdverseReactionreportingviaFDAMedWatchform
//PRE_IC07 Vulcan Accelerator Adverse Event Use Case_BakerWillis_2022-05-03_FINAL

//BROKEN NOT WRITTEN YET

Instance: PatientInitiatedonClinicalTrialMedWatch3500BuseCase6b
InstanceOf: AdverseEvent-clinical-research
Usage: #example
Title: "PatientInitiatedonClinicalTrialMedWatch3500BuseCase6b" 
Description: "BROKEN NOT WRITTEN YET   A patient on a clinical trial reported via MedWatch 3500B"
//* actuality = http://hl7.org/fhir/adverse-event-actuality#actual 
* status = #completed
* subject = Reference(ClinicalTrialSubject5)
* outcome = http://snomed.info/sct#405532008 "Adverse incident resulting in potentially permanent disabling damage"
//* seriousness = http://terminology.hl7.org/CodeSystem/adverse-event-seriousness#serious
* resultingCondition[0] = Reference(AEHepaticFailureUseCase7)
* resultingCondition[1] = Reference(AEHepaticFailureUseCase7complication)
* category = http://terminology.hl7.org/CodeSystem/adverse-event-category#medication-mishap "medication-mishap"
* study.display = "NCT1010101"
* suspectEntity[0].instanceCodeableConcept.text = "Aspirin"
* suspectEntity[=].causality.entityRelatedness = http://terminology.hl7.org/CodeSystem/adverse-event-causality-assess#certain "Certain"
* suspectEntity[+].instanceCodeableConcept.text = "Study Medication Use Case 7"
* suspectEntity[=].causality.entityRelatedness = http://terminology.hl7.org/CodeSystem/adverse-event-causality-assess#certain "Certain"
//* suspectEntity[=].study-information
//* suspectEntity[=].extension.url
//.extension[studyAssociatedWithAE].display = "NCT1010101"
//.extension[StudyAssociatedWithAE].display = "NCT1010101"
//* suspectEntity[=].extension[StudyInfoassociatedWithAE].ResearchSubjectAssociatedWithAE.display = "NCT1010101 subject 5"
//* suspectEntity[=].extension.ExpectedInResearchStudy = true
//* suspectEntity[=].extension.AEcausedStudyDiscontinuation = true
* recorder.display = "Clinical Research Associate"
* detected = "1905-08-23"
* recordedDate = "1905-08-24"
* code = http://snomed.info/sct#370901008 "Serious reportable event associated with product or device"

* extension[seriousness-criteria][0].extension[criterionPresent].valueBoolean = true
* extension[seriousness-criteria][=].extension[criterionCode].valueCodeableConcept = #requiresPreventImpairment "required intervention to prevent permanent damage"
* extension[seriousness-criteria][+].extension[criterionPresent].valueBoolean = true
* extension[seriousness-criteria][=].extension[criterionCode].valueCodeableConcept = #resultsinHospitalization
* extension[seriousness-criteria][+].extension[criterionPresent].valueBoolean = false
* extension[seriousness-criteria][=].extension[criterionCode].valueCodeableConcept = #resultsInDeath

* seriousness = http://terminology.hl7.org/CodeSystem/adverse-event-seriousness#serious

---

//A 64-year old woman (Janet)
Instance: JanetPatient
InstanceOf: Patient
Usage: #example
Title: "Janet Patient"
Description: "Patient Janet, 64-year old woman on clinical trial"
* extension[0].id = "race"
* extension[=].extension[0].url = "ombCategory"
* extension[=].extension[=].valueCoding = urn:oid:2.16.840.1.113883.6.238#2106-3 "White"
* extension[=].extension[+].url = "text"
* extension[=].extension[=].valueString = "White"
* extension[=].url = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-race"
* extension[+].id = "ethnicity"
* extension[=].extension[0].url = "ombCategory"
* extension[=].extension[=].valueCoding = urn:oid:2.16.840.1.113883.6.238#2186-5 "Not Hispanic or Latino"
* extension[=].extension[+].url = "text"
* extension[=].extension[=].valueString = "Not Hispanic or Latino"
* extension[=].url = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-ethnicity"
* identifier[0].use = #usual
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
* managingOrganization = Reference(Organization/f001) "Burgers University Medical Centre"

// is participating in a breast cancer clinical trial.
Instance: BreastCancerTrial
InstanceOf: ResearchStudy
Usage: #example
Title: "Janet Patient"
Description: "Breast Cancer clinical trial example"
* identifier.type.text = "Breast Cancer Clinical Trial bresentrik"
* identifier.system = "http://clinicaltrials.gov/"
* identifier.value = "NCT01234567"
* identifier.assigner.display = "Allesgut Pharmaceuticals"
* title = "Breast Cancer Clinical Trial bresentrik study" 
* status = http://hl7.org/fhir/research-study-status#active
* primaryPurposeType = http://terminology.hl7.org/CodeSystem/research-study-prim-purp-type#treatment
* phase = http://terminology.hl7.org/CodeSystem/research-study-phase#phase-2-phase-3
* category = #interventional
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
* arm[0].type = #experimental
* arm[0].description = "Bresentrik (B) plus pertuzumab-matching placebo"
* arm[+].name = "Arm B"
* arm[=].type = #experimental
* arm[=].description = "Bresentrik (B) plus pertuzumab"
* arm[+].name = "Arm C"
* arm[=].type = #active-comparator
* arm[=].description = "Standard of care (Taxane (paclitaxel or docetaxel), trastuzumab, and pertuzumab)"
* protocol.display = "This would reference the PlanDefinition which would contain references to Bresentrik"


//weight observation example
Instance: weight-janet
InstanceOf: Observation
Usage: #example
* meta.profile = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-body-weight"
* status = #final
* category = http://terminology.hl7.org/CodeSystem/observation-category#vital-signs "Vital Signs"
* category.text = "Vital Signs"
* code = http://loinc.org#29463-7 "Body Weight"
* code.text = "weight"
* subject = Reference(Patient/JanetPatient) "Janet"
* encounter.display = "GP Visit"
* effectiveDateTime = "2023-04-10"
* valueQuantity = 20.09414 'kg' "kg"
* method.text = "Patient-entered"


//Provenance for weight
Instance: provenance-for-weight
InstanceOf: Provenance
Usage: #example
* meta.profile = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-provenance"
//* target.extension.url = "http://hl7.org/fhir/StructureDefinition/targetElement"
//* target.extension.valueUri = "race"
* target = Reference(Observation/weight-janet)
* recorded = "2023-04-12T15:26:23.217+00:00"
//* agent[0].role =  http://terminology.hl7.org/CodeSystem/v3-RoleClass#PROV "healthcare provider"
* agent[0].type = http://terminology.hl7.org/CodeSystem/provenance-participant-type#author "Author"
* agent[=].who.display = "Provenance Author. Will be reference to the PractitionerRole that authored the measurement. Needs to include a reference to the organization that is responsible for the measurement, at a minimum"
* agent[+].type = http://terminology.hl7.org/CodeSystem/provenance-participant-type#informant "Informant"
* agent[=].who = Reference(Patient/Patient/JanetPatient)
* agent[=].who.display = "Janet, the patient who informed the system of the weight authored by the ProvanceAuthor"


//Blood pressure observation example
Instance: blood-pressure-janet
InstanceOf: Observation
Usage: #example
* meta.profile = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-blood-pressure"
* status = #final
* category = http://terminology.hl7.org/CodeSystem/observation-category#vital-signs "Vital Signs"
* category.text = "Vital Signs"
* code = http://loinc.org#85354-9 "Blood pressure panel with all children optional"
* code.text = "Blood pressure systolic and diastolic"
* subject = Reference(Patient/JanetPatient) "Janet"
* encounter.display = "GP Visit"
* effectiveDateTime = "2023-04-10"
* component[0].code = http://loinc.org#8480-6 "Systolic blood pressure"
* component[=].code.text = "Systolic blood pressure"
* component[=].valueQuantity = 109 'mm[Hg]' "mmHg"
* component[+].code = http://loinc.org#8462-4 "Diastolic blood pressure"
* component[=].code.text = "Diastolic blood pressure"
* component[=].valueQuantity = 44 'mm[Hg]' "mmHg"


//Provenance for blood-pressure-janet
Instance: provenance-for-blood-pressure-janet
InstanceOf: Provenance
Usage: #example
* meta.profile = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-provenance"
//* target.extension.url = "http://hl7.org/fhir/StructureDefinition/targetElement"
//* target.extension.valueUri = "race"
* target = Reference(Observation/blood-pressure-janet)
* recorded = "2023-04-12T15:26:23.217+00:00"
//* agent[0].role =  http://terminology.hl7.org/CodeSystem/v3-RoleClass#PROV "healthcare provider"
* agent[0].type = http://terminology.hl7.org/CodeSystem/provenance-participant-type#author "Author"
* agent[=].who.display = "Provenance Author. Will be reference to the PractitionerRole that authored the measurement. Needs to include a reference to the organization that is responsible for the measurement, at a minimum"
* agent[+].type = http://terminology.hl7.org/CodeSystem/provenance-participant-type#informant "Informant"
* agent[=].who = Reference(Patient/Patient/JanetPatient)
* agent[=].who.display = "Janet, the patient who informed the system of the weight authored by the ProvanceAuthor"



//Janet medications
//reported by JanetPatient
Instance: example001
InstanceOf: MedicationStatement
Usage: #example
* contained = med0309
* identifier.use = #official
* identifier.system = "http://www.bmc.nl/portal/medstatements"
* identifier.value = "12345689"
* status = #active
* medicationReference = Reference(med0309)
* subject = Reference(Patient/JanetPatient) "Janet"
* effectiveDateTime = "2015-01-23"
* dateAsserted = "2023-04-12"
* informationSource = Reference(Patient/JanetPatient) "Janet"
* derivedFrom = Reference(MedicationRequest/medrx002)
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
* code = http://hl7.org/fhir/sid/ndc#50580-506-02 "Tylenol PM"
* form = http://snomed.info/sct#385057009 "Film-coated tablet (qualifier value)"
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
* contained = med0315
* status = #active
* medicationReference = Reference(med0315)
* subject = Reference(Patient/JanetPatient) "Janet"
* dateAsserted = "2023-04-12"
* informationSource = Reference(Patient/JanetPatient) "Janet"
* note.text = "patient plans to start using for seasonal allergies in the Spring when pollen is in the air"

Instance: med0315
InstanceOf: Medication
Usage: #inline
* code = http://www.nlm.nih.gov/research/umls/rxnorm#358793 "Mometasone Furoate 0.05mg/Actuat"
* form = http://snomed.info/sct#385157007 "Nasal Spray"

Instance: example003
InstanceOf: MedicationStatement
Usage: #example
* status = #active
* medicationCodeableConcept.text = "Little Pink Pill for water retention"
* subject = Reference(Patient/JanetPatient) "Janet"
* effectiveDateTime = "2023-02-01"
* dateAsserted = "2023-04-12"
* informationSource = Reference(Patient/JanetPatient) "Janet"
* reasonReference = Reference(Observation/blood-pressure-janet)
* note.text = "Patient cannot remember the name of the tablet, but takes it every day in the morning for water retention"
* dosage.sequence = 1
* dosage.text = "1 tablet per day"
* dosage.asNeededBoolean = false
* dosage.route = http://snomed.info/sct#260548002 "Oral"
* dosage.doseAndRate.type = http://terminology.hl7.org/CodeSystem/dose-rate-type#ordered "Ordered"
* dosage.doseAndRate.doseQuantity = 1 http://terminology.hl7.org/CodeSystem/v3-orderableDrugForm#TAB "tab"
* dosage.maxDosePerPeriod.numerator.value = 1
* dosage.maxDosePerPeriod.denominator = 1 'd'


//bresentrik study medication treatment
Instance: medicationrequest-contained-bresentrik
InstanceOf: MedicationRequest
Usage: #example
* meta.profile = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-medicationrequest"
* contained = bresentrik
* status = #active
* intent = #order
* identifier.use = #official
* identifier.system = "http://www.bmc.nl/portal/medstatements"
* identifier.value = "1234568900-studyDrug" 
* medicationReference = Reference(bresentrik) "bresentrik 15 MG/ML Oral Solution"
* subject = Reference(Patient/JanetPatient) "Janet"
* authoredOn = "2008-04-05"
* requester = Reference(Practitioner/practitioner-1) "Ronald Bone, MD"
* reasonCode = http://snomed.info/sct#254837009 "Breast Cancer"
* dosageInstruction.text = "10 mL bid"
* dosageInstruction.timing.repeat.boundsPeriod.start = "2008-04-05"
* dosageInstruction.timing.repeat.frequency = 2
* dosageInstruction.timing.repeat.period = 1
* dosageInstruction.timing.repeat.periodUnit = #d
* dosageInstruction.doseAndRate.doseQuantity = 10 'mL' "ml"
* dispenseRequest.numberOfRepeatsAllowed = 1
* dispenseRequest.quantity = 480 'mL' "mL"
* dispenseRequest.expectedSupplyDuration = 30 'd' "days"
* supportingInformation = Reference(ResearchStudy/BreastCancerTrial)
* instantiatesCanonical = "http://baseUrlOfHospitalHolding/PlanDefinition/protocol-for-the-ResearchStudy"

Instance: bresentrik
InstanceOf: Medication
Usage: #inline
* code = http://www.nlm.nih.gov/research/umls/rxnorm#000000 "bresentrik 15 MG/ML Oral Solution"
* code.text = "bresentrik 15 MG/ML Oral Solution"


//Janet went home and began vomiting uncontrollably. 
//problem
//Her husband called an ambulance and Janet was taken to the hospital where she was treated in the ER and released.
//ER Encounter, the ER encounter is referenced in the condition
//reference to condition where http://snomed.info/sct#332982000 "Uncontrollable vomiting"
Instance: janetReported-condition
InstanceOf: Condition
Usage: #example
* identifier.value = "12345"
* code = http://snomed.info/sct#332982000 "Uncontrollable vomiting"
* subject = Reference(Patient/JanetPatient) "Janet"
* encounter.display = "Reference to ER visit Janet went to. Be sure to include provenance"
* onsetDateTime = "2023-04-10"
* abatementString = "around April 10, 2023"
* recordedDate = "2023-04-12"
* recorder = Reference(Patient/JanetPatient) "Janet"
* asserter = Reference(Patient/JanetPatient) "Janet"
* evidence.code = http://snomed.info/sct#258710007 "degrees C"
* evidence.detail = Reference(Observation/f202) "Temperature"


//research subject Janet?
//no research subject added to the Patient reported one as the Patient would not be given their study id at this point


//ADVERSE EVENT
Instance: clinical-research-ae-example-medwatch-patient-report
InstanceOf: AdverseEvent-clinical-research
Usage: #example
Title: "Patient report of Adverse Event, example of data that would be on MedWatch form as reported by Patient"
Description: "example" 
* extension[status].valueCode = http://hl7.org/fhir/event-status#completed

//A1 What kind of problem was it? (Check all that apply)
//Were hurt or had a bad side effect (including new or worsening symptoms)
* event = http://snomed.info/sct#370901008 "Serious reportable event associated with product or device"

//"Required help to prevent permanent harm"
//A2 Did any of the following happen?
* extension[seriousness-criteria][0].extension[criterionPresent].valueBoolean = true
* extension[seriousness-criteria][=].extension[criterionCode].valueCodeableConcept = #requiresPreventImpairment "required intervention to prevent permanent damage"

//A3
//After receiving the study drug (bresentrik) during a study visit, 
//timing medication given before ae reported on 4/12
* date = 2023-04-10

//A4 note
* extension[note][+].valueAnnotation.authorReference = Reference(Patient/JanetPatient)
* extension[note][=].valueAnnotation.time = 2023-04-12
* extension[note][=].valueAnnotation.text = "Use case for MedWatch Form FDA 3500B being used during a clinical trial%:  
A 64-year old woman %(Janet%) is participating in a breast cancer clinical trial. As part of her participation in the study, she was instructed to use a specific consumer facing FHIR application to report an adverse event that resulted in any of the following: hospitalization, required help to prevent permanent harm, disability or health problem, birth defect, life-threatening, death, other serious/important medical incident. %(This list identifies serious events.%)  

Janet created an account in the consumer facing FHIR application and imported her health records from her three %(3%) health systems. The data from her health systems were aggregated to allow her a single view of all her medical information. Janet was able to add more information that was not included in her imported data %(OTC drugs, vitamins, etc.%).  

After receiving the study drug %(bresentrik%) during a study visit, Janet went home and began vomiting uncontrollably. Her husband called an ambulance and Janet was taken to the hospital where she was treated in the ER and released.  

The following morning, Janet opened the study designated consumer facing FHIR application and completed the MedWatch Form FDA 3500B as earlier directed. The form provides her the opportunity to choose to auto fill several of the areas to allow for faster/easier completion of the form %(demographics, meds, allergies, conditions, labs%). She is given the option to display and choose the relevant items from each category %(example%: only current meds she is taking, current labs, etc. which might be a subset of her full PHR%).  

When Janet clicked “Submit” on the electronic form, the data automatically flowed to the investigator %(or to whomever was designated to receive the data%). The data is then absorbed within the receiver’s system to auto populate a MedWatch Form FDA 3500B for submission to the FDA within 24 hours."


//Janet went home and began vomiting uncontrollably. 
//problem
//Her husband called an ambulance and Janet was taken to the hospital where she was treated in the ER and released.
//ER Encounter, the ER encounter is referenced in the condition
* extension[resultingEffect][0].valueReference = Reference(Condition/janetReported-condition)
//reference to condition where http://snomed.info/sct#332982000 "Uncontrollable vomiting"

//seriousness will be defined by investigator, but required so in this patient reported version we get the patient choosing !?
//probably should be 0..1 !? 
* seriousness = http://terminology.hl7.org/CodeSystem/adverse-event-seriousness#Serious
//outcome is also strange for a patient to enter but can be revised by clinician
* outcome = urn:oid:2.16.840.1.113883.3.989.2.1.1.19#recoveredorresolved "Recovered/Resolved"


//Section C
//although some of this might also appear in section A4
//After receiving the study drug (bresentrik) during a study visit, 
//Medication - study drug given 4/10/2023
//Section C1,2,3,4,5,6,7,8,9,10,11,12,13,14,15 all derived from the medication reference 
// in suspect entity
* extension[suspect-entity][+].extension[instance].valueReference = Reference(Medication/medicationrequest-contained-bresentrik)
* extension[suspect-entity][=].extension[causality].extension[entityRelatedness].valueCodeableConcept = urn:oid:2.16.840.1.113883.3.989.2.1.1.19#possibly "Possibly"
* extension[suspect-entity][=].extension[causality].extension[author].valueReference = Reference(Patient/JanetPatient) "Janet"
* extension[suspect-entity][+].extension[instance].valueReference = Reference(Medication/medicationrequest-contained-bresentrik)
* extension[suspect-entity][=].extension[causality].extension[entityRelatedness].valueCodeableConcept = urn:oid:2.16.840.1.113883.3.989.2.1.1.19#possibly "Possibly"
* extension[suspect-entity][=].extension[causality].extension[author].valueReference = Reference(ResearchStudy/BreastCancerTrial)
* study = Reference(ResearchStudy/BreastCancerTrial)
 


//C17 we do not know from the data in the use case
 
 
//PRODUCT AVAILABILITY
// add as an extension with 0..1 cardinality

//section E1, initials?

//section E2, E4 from Patient resource. 
//section E6 and E7 rely on US CORE use of Ethnicity and Race -- specific to US realm 
//section E3 Age would be calculated from BirthDate
* subject = Reference(Patient/JanetPatient) "Janet"

//section E5 weight most recent observation picked from list - US realm specific
* extension[supporting-info][+].extension[item].valueReference = Reference(Observation/weight-janet)


//The data from her health systems were aggregated to allow her a single view of all her medical information. 
//section E8, 9, 10, 11, 12 all are references selected from drop-down plus patient additions
* extension[supporting-info][+].extension[item].valueReference = Reference(Observation/weight-janet)
* extension[supporting-info][+].extension[item].valueReference = Reference(Observation/blood-pressure-janet)

//section E8, 9, 10, 11, 12 patient additions Janet was able to add more information that was not included in her imported data (OTC drugs, vitamins, etc.). as fhir resource vitamin
* extension[supporting-info][+].extension[item].valueReference = Reference(Medication/example001)
* extension[supporting-info][+].extension[item].valueReference = Reference(Medication/example007)
* extension[supporting-info][+].extension[item].valueReference = Reference(Medication/example003)


//The following morning, Janet opened the study designated consumer facing FHIR application and completed the MedWatch Form FDA 3500B autofill (demographics, meds, allergies, conditions, labs). She is given the option to display and choose the relevant items from each category (example: only current meds she is taking, current labs, etc. which might be a subset of her full PHR).
//section F
//if Janet Husband then would use RelatedPerson
* recorder = Reference(Patient/JanetPatient)

//The data is then absorbed within the receiver’s system to auto populate a MedWatch Form FDA 3500B for submission to the FDA within 24 hours.

--
Janet's study's clinical research coordinator version?


C16, C17 we do not know from the data in the use case
//section C16 and C17, are either going to be inferred or possible use questionnaire
//16. Did the problem stop after the person reduced the dose or stopped taking or using the product? Yes No
//17. Did the problem return if the person started taking or using the product again? Yes No Didn’t restart
Help with C17. maybe labeled composition sections would help 


Section B and Section F10 and F11 seem to be very use case specific. Perhaps using a questionnaire would be the best way to handle them? 
//Section B PRODUCT AVAILABILITY
//Questionnaire? and Attachment for picture of product?
// add as an extension with 0..1 cardinality in use case specific IG, us realm? Probably better as questionnaire and DocuementReference? 
//section F10 and F11
10. Did you report this problem to the company that makes the product (the manufacturer/compounder)? Yes No
11. If you do NOT want your identity disclosed to the manufacturer, place an "X" in this box:
Questionnaire? DocReference? 
-- us use case specific PDF, from Debi, mitra looking to use PDF from FDA
-- how will it be used
-- single document - from Debi -- with all the non FHIR pieces



//section E1, initials?


US CORE realm specific expectations! of US CORE stuff and request of US CORE stuff
	should be a US CORE specific profile and guidance as well?
	e.g. in the US will MedicationRequest or MedicationAdministration be more likely to be found naively?
	but MedicationAdimnistration, right now, makes more sense as a place where 'how' the medication got into the patient would be found. MedicationRequest is currently supported by EPIC but only in the Netherlands is MedicationAdministration. This choice by EPIC is linked to US CORE adoption. Pharmacy is complex. We might want to be more loose with the bindings for supporting-info (somewhat a connectathon result)

FDA care about where the info comes from? Recall we're going from paper to computable. Could take an incremental approach but some things, such as provance (or where the data came from) are good to get out ahead of. maybe there are approaches out there that people have taken which could be codified as guidance? Provenance of weight and other observations? How is it handled?  I used Provenance with ProviderRole as author and Janet as informant. There are alternatives. I'm not as familiar with this problem.
should the Provenance be kept inline as a contained resource - seems good as a legal record (not so great for retrieval as contained resources do not show-up on searches for Resources. they are typically only available with a specialized contains search)
?! keep the reference with a URL that represents the original sources FHIR repo?? rather than use extra provenance instances 

Reference physicians, and other staff, at the multiple institutions. Would this be through contained in-line profiles? Or, more concise, with references that include the BaseURL of the FHIR server that created the profile in the first place? Or would a bundle that contains a distinct profile be used? All three have pluses and minuses. This is a general consideration in FHIR where multiple sources are being aggregated and sent on. One could send Logical References (where " know an identifier for the target of the reference, but there is no way for the application to convert this to a literal reference that directly references an actual resource") or (literal) Absolute URL (direct web-accessible path to data instance) ("Using absolute URLs provides a stable, scalable approach suitable for a cloud/web context, while using relative/logical references provides a flexible approach suitable for use when trading across closed ecosystem boundaries") Example of absolute url ""reference" : "http://fhir.hl7.org/svc/StructureDefinition/c8973a22-2b5b-4e76-9c66-00639c99e61b". see http://hl7.org/fhir/R4B/references.html

Patient's initials this is an odd field to have when the entire Patient Resource with name is known. Suggest that the computable, structured version, of the FDA form not replicate this field. Unless there is a down-stream process that needs it. Might take a look at the process to see about revising it. Which group is the informatics group for FDA? 

Where is the Study identified in the Forms? - assumed by application 

Some questions are irrelevant on section C if the MedicationRequest (order) for the study drug is present. Having the FHIR Resources to bear changes the questions needed to ask for downstream data analysis
	
!!!!note these considerations are not necessarily AdverseEvent considerations specifically. They are generally a problem with capture and exchange of data coming from multiple systems. FHIR can 
--