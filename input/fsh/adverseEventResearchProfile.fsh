Extension: Note
Id: note
Title: "Note"
Description: "Comments made about the adverse event by the performer, subject or other participants."
* ^context.type = #element
* ^context.expression = "AdverseEvent"
* value[x] only Annotation

Extension: ExpectedInResearchStudy
Id: expected-in-research-study
Title: "Expected In Research Study"
Description: "Considered likely or probable or anticipated in the research study.  Whether the reported event matches any of the outcomes for the patient that are considered by the study as known or likely."
* ^context.type = #element
* ^context.expression = "AdverseEvent"
* value[x] only boolean

Extension: Status
Id: status
Title: "Workflow Status"
Description: "The current workflow state of the adverse event or potential adverse event. This is not the reporting of the event to any regulatory or quality organization.  This is not the outcome of the patient's condition."
* ^context.type = #element
* ^context.expression = "AdverseEvent"
* . ^isModifier = true
* . ^isModifierReason = "This element is labeled as a modifier because it is a status element that contains status entered-in-error which means that the resource should not be treated as valid"
* value[x] only code
* valueCode from adverse-event-status-vs (required)


//AdverseEvent.supportingMedicationInfo
//MedicationAdministration | MedicationStatement
//Extension: SupportingMedicationInfo
//Id: supporting-medication-info
//Title: "Additional information regarding medications the subject is taking"
//Description: "Provides references to medications the subject has been prescribed for additional context. These should be medications that are not suspected or considered as potential suspects for the adverse event. For example, a patient who became nauseous after eating a study drug that was not meant to be taken orally. This element could indicate that the patient was using topical acne medication."
//* value[x] only Reference(MedicationStatement)


//AdverseEvent.contributingFactor
Extension: ContributingFactor
Id: contributing-factor
Title: "Contributing Factor"
Description: "The contributing factors suspected to have increased the probability or severity of the adverse event."
* ^context.type = #element
* ^context.expression = "AdverseEvent"
* extension contains
    item 1..1
* extension[item] ^short = "Item suspected to have increased the probability or severity of the adverse event"
* extension[item].valueReference only Reference(Condition or Observation or AllergyIntolerance or FamilyMemberHistory or Immunization or Procedure or Device or DocumentReference or MedicationAdministration or MedicationStatement)
* extension[item].valueCodeableConcept from adverse-event-contributing-factor-vs (example)
* extension[item].valueCodeableConcept ^binding.extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName"
* extension[item].valueCodeableConcept ^binding.extension.valueString = "AdverseEventContributingFactor"
* extension[item].valueCodeableConcept ^binding.description = "Codes describing the contributing factors suspected to have increased the probability or severity of the adverse event."


//AdverseEvent.preventiveAction
//Extension: PreventiveAction
//Id: preventive-action
//Title: "Preventive Action"
//Description: "Preventive actions that contributed to avoiding the adverse event."
//* ^context.type = #element
//* ^context.expression = "AdverseEvent"
//* extension contains
//    item 1..1
//* extension[item] ^short = "Action that contributed to avoiding the adverse event"
//* extension[item].valueReference only Reference(Immunization or Procedure or DocumentReference or MedicationAdministration or MedicationRequest)
//* extension[item].valueCodeableConcept from adverse-event-preventive-action-vs (example)
//* extension[item].valueCodeableConcept ^binding.extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName"
//* extension[item].valueCodeableConcept ^binding.extension.valueString = "AdverseEventPreventiveAction"
//* extension[item].valueCodeableConcept ^binding.description = "Codes describing the preventive actions that contributed to avoiding the adverse event."



//AdverseEvent.mitigatingAction
Extension: MitigatingAction
Id: mitigating-action
Title: "Mitigating Action"
Description: "Ameliorating actions taken after the adverse event occurred in order to reduce the extent of harm."
* ^context.type = #element
* ^context.expression = "AdverseEvent"
* extension contains
    item 1..1
* extension[item] ^short = "Ameliorating action taken after the adverse event occurred in order to reduce the extent of harm"
* extension[item].valueReference only Reference(Procedure or DocumentReference or MedicationAdministration or MedicationRequest)
* extension[item].valueCodeableConcept from adverse-event-mitigating-action-vs (example)
* extension[item].valueCodeableConcept ^binding.extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName"
* extension[item].valueCodeableConcept ^binding.extension.valueString = "AdverseEventMitigatingAction"
* extension[item].valueCodeableConcept ^binding.description = "Codes describing the ameliorating actions taken after the adverse event occurred in order to reduce the extent of harm."



//AdverseEvent.suspectEntity
//AdverseEvent.suspectEntity.causality
Extension: SuspectEntity
Id: suspect-entity
Title: "Suspect Entity"
Description: "Describes the entity that is suspected to have caused the adverse event."
* ^context.type = #element
* ^context.expression = "AdverseEvent"
* extension contains
    instance 1..1 and
	causality 1..1
* extension[instance] ^short = "Refers to the specific entity that is suspected of causing the adverse event"
* extension[instance].valueCodeableConcept 
//from http://snomed.info/sct (example)
* extension[instance].valueReference only Reference(Immunization or Procedure or Substance or Medication or MedicationAdministration or MedicationStatement or Device or BiologicallyDerivedProduct or ResearchStudy)

//AdverseEvent.suspectEntity.causality
* extension[causality] ^short = "Causality - information on the possible cause of the event"

* extension[causality].extension contains
    assessmentMethod 0..1 and
    entityRelatedness 0..1 and
    author 0..1
* extension[causality].extension[assessmentMethod] ^short = "Method of evaluating the relatedness of the suspected entity to the event."
* extension[causality].extension[assessmentMethod].valueCodeableConcept from http://hl7.org/fhir/ValueSet/adverse-event-causality-method (preferred)
* extension[causality].extension[assessmentMethod].valueCodeableConcept ^binding.extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName"
* extension[causality].extension[assessmentMethod].valueCodeableConcept ^binding.extension.valueString = "AdverseEventCausalityMethod"
* extension[causality].extension[assessmentMethod].valueCodeableConcept ^binding.description = "Codes for the method of evaluating the relatedness of the suspected entity to the event, such as ProbabilityScale | Bayesian | Checklist."

* extension[causality].extension[entityRelatedness] ^short = "Result of the assessment regarding the relatedness of the suspected entity to the event"
* extension[causality].extension[entityRelatedness].valueCodeableConcept from adverse-event-causality-related-vs (preferred)

* extension[causality].extension[author] ^short = "Author of the information on the possible cause of the event"
* extension[causality].extension[author].valueReference only Reference(Patient or Practitioner or PractitionerRole or RelatedPerson or ResearchSubject)


//AdverseEvent.supportingInfo
Extension: SupportingInfo
Id: supporting-info
Title: "Supporting information relevant to the event"
Description: "Relevant past history for the subject. In a clinical care context, an example being a patient had an adverse event following a penicillin administration and the patient had a previously documented penicillin allergy. In a clinical trials context, an example is a bunion or rash that was present prior to the study. Additionally, the supporting item can be a document that is relevant to this instance of the adverse event that is not part of the subject's medical history. For example, a clinical note, staff list, or material safety data sheet (MSDS). Supporting information is not a contributing factor, preventive action, or mitigating action."
* ^context.type = #element
* ^context.expression = "AdverseEvent"
* extension contains
    item 1..1
* extension[item] ^short = "Subject medical history or document relevant to this adverse event"
* extension[item].valueReference only Reference(Condition or Observation or AllergyIntolerance or FamilyMemberHistory or Immunization or Procedure or DocumentReference or MedicationAdministration or MedicationStatement or QuestionnaireResponse)
* extension[item].valueCodeableConcept from adverse-event-supporting-info (example)
* extension[item].valueCodeableConcept ^binding.extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName"
* extension[item].valueCodeableConcept ^binding.extension.valueString = "Adverse Event Supporting Info"
* extension[item].valueCodeableConcept ^binding.description = "Codes describing the supporting information relevant to the event."



Extension: SeverityOrGrade
Id: severity-or-grade
Title: "Severity Or Grade"
Description: "Describes the severity of the adverse event, in relation to the subject not the resulting condition. In the context of clinical research, it is the investigator’s assessment of severity. For cancer related trials, severity is represented as a grade."
* ^context.type = #element
* ^context.expression = "AdverseEvent"
* value[x] only CodeableConcept
* valueCodeableConcept from adverse-event-severity-or-grade-vs (preferred)
//http://hl7.org/fhir/R4B/valueset-adverse-event-severity (preferred)
//http://hl7.org/fhir/ValueSet/adverse-event-severity (extensible)

Extension: CausedSubjectToDiscontinueStudy
Id: caused-subject-to-discontinue-study
Title: "Adverse event caused subject to discontinue the study"
Description: "Indicates if the subject discontinued the study due to the adverse event."
* ^context.type = #element
* ^context.expression = "AdverseEvent"
* value[x] only boolean

Extension: SeriousnessCriteria
Id: seriousness-criteria
Title: "Criteria reviewed in determining serious adverse event"
Description: "Element to capture the presence or absence of specific factors (criteria) associated with serious adverse events."
* ^context.type = #element
* ^context.expression = "AdverseEvent"
* extension contains
    criterionCode 1..1 MS and
    criterionPresent 1..1
* extension[criterionCode] ^short = "Action criteria usually associated with events that pose a threat to a patient's life or functioning"
//* extension[criterionCode] ^description = "Action criteria usually associated with events that pose a threat to a patient's life or functioning"
* extension[criterionCode].value[x] only CodeableConcept
* extension[criterionCode].valueCodeableConcept from adverse-event-seriousness-criteria-vs (extensible)
* extension[criterionCode].valueCodeableConcept 1..1

* extension[criterionPresent] ^short = "Presence or absence of the specified criteria"
//* extension[criterionPresent] ^description = "Boolean to indicate if the specified criteria is present or absence"
* extension[criterionPresent].value[x] only boolean
* extension[criterionPresent].value[x] 1..1


Extension: ResolvedDate
Id: resolve-date
Title: "Adverse Event resolution date"
Description: "The date the adverse event was resolved."
* ^context.type = #element
* ^context.expression = "AdverseEvent"
* value[x] only dateTime

Extension: ResearchSubjectRef
Id: research-subject-ref
Title: "Research Subject record of subject"
Description: "Communicates Research Subject related metadata."
* ^context.type = #element
* ^context.expression = "AdverseEvent"
* value[x] only Reference(ResearchSubject)

//AdverseEvent.resultingEffect
Extension: ResultingEffect
Id: resultingEffect
Title: "Resulting Effect"
Description: "Information about the condition that occurred as a result of the adverse event."
* ^context.type = #element
* ^context.expression = "AdverseEvent"
* value[x] only Reference(Condition or Observation)

//AdverseEvent.participant
Extension: Participant
Id: participant
Title: "Participant"
Description: "Indicates who or what participated in the adverse event and how they were involved."
* ^context.type = #element
* ^context.expression = "AdverseEvent"
* extension contains
    function 0..1 and
	actor 1..1
* extension[function] ^short = "Type of involvement"
* extension[function].valueCodeableConcept from adverse-event-participant-function-vs (example)
* extension[actor] ^short = "Who was involved in the adverse event or the potential adverse event"
* extension[actor].valueReference only Reference(Practitioner or PractitionerRole or Organization or CareTeam or Patient or Device or RelatedPerson or ResearchSubject)

ValueSet: AdverseEventParticipantFunction
Id: adverse-event-participant-function-vs
Title: "Adverse Event Participant Functions"
Description: "This value set includes codes that describe the type of involvement of the actor in the adverse event."
* ^status = #draft
* ^experimental = true
* http://terminology.hl7.org/CodeSystem/v3-ParticipationType#INF	"informant"
* http://terminology.hl7.org/CodeSystem/v3-ParticipationType#PART	"Participation" 
* http://terminology.hl7.org/CodeSystem/v3-ParticipationType#WIT	"witness"
* http://terminology.hl7.org/CodeSystem/v3-ParticipationType#AUT	"author (originator)"

ValueSet: AdverseEventSerCrit
Id: adverse-event-seriousness-criteria-vs 
Title: "Adverse Event Seriousness Criteria"
Description: "Action criteria usually associated with serious events that pose a threat to a patient's life or functioning. Adverse Events criteria to expand on the seriousness of the adverse event. Typically used in reporting for Clinical Research, post-market surveillance (e.g. Form FDA 3500A MedWatch). The adverse event seriousness criteria value set is based on the ICH E2D Post-Approval Safety Data Management: Definitions and Standards for Expedited Reporting guidance (https://database.ich.org/sites/default/files/E2D_Guideline.pdf). For information on ICH see https://admin.ich.org/sites/default/files/inline-files/OID_Information_Paper_1.pdf from the INTERNATIONAL CONFERENCE ON HARMONISATION OF TECHNICAL REQUIREMENTS FOR REGISTRATION OF PHARMACEUTICALS FOR HUMAN USE (ICH) document ICH E2B(R3), the Electronic Transmission of Individual Case Safety Reports (ICSRs) Implementation Guide Data Elements and Message Specification, and ICH M8, the Electronic Common Technical Document"
* ^status = #draft
* ^experimental = true
//* codes from system seriousness-criteria-cs
//* urn:oid:2.16.840.1.113883.3.989.2.1.1.19#34	"Results In Death" //"Was the serious adverse event life-threatening?"
//* urn:oid:2.16.840.1.113883.3.989.2.1.1.19#21	"Is Life Threatening" 
//* urn:oid:2.16.840.1.113883.3.989.2.1.1.19#33	"Requires Inpatient Hospitalization"
//* urn:oid:2.16.840.1.113883.3.989.2.1.1.19#35	"Results In Persistent Or Significant Disability"
//* urn:oid:2.16.840.1.113883.3.989.2.1.1.19#12	"Congenital Anomaly or Birth Defect"
//* urn:oid:2.16.840.1.113883.3.989.2.1.1.19#26	"Other Medically Important Condition" 
* fda-add-seriousness-criteria-cs#requiresPreventImpairment "Required Intervention to Prevent Permanent Impairment or Damage (Devices)"

* http://ncicb.nci.nih.gov/xml/owl/EVS/Thesaurus.owl#C48275	"Results In Death" //"Was the serious adverse event life-threatening?"
* http://ncicb.nci.nih.gov/xml/owl/EVS/Thesaurus.owl#C84266	"Is Life Threatening" 
* http://ncicb.nci.nih.gov/xml/owl/EVS/Thesaurus.owl#C83052	"Requires Inpatient Hospitalization"
* http://ncicb.nci.nih.gov/xml/owl/EVS/Thesaurus.owl#C11338	"Results In Persistent Or Significant Disability"
* http://ncicb.nci.nih.gov/xml/owl/EVS/Thesaurus.owl#C83117	"Congenital Anomaly or Birth Defect"
* http://ncicb.nci.nih.gov/xml/owl/EVS/Thesaurus.owl#C82521	"Other Medically Important Condition" 

CodeSystem: FDAaddSeriousnessCriteriaCS
Id: fda-add-seriousness-criteria-cs
Title: "FDA Additional Seriousness Criteria CodeSystem"
Description: "Additional codes found on https://www.fda.gov/safety/reporting-serious-problems-fda/what-serious-adverse-event#:~:text=Required%20Intervention%20to%20Prevent%20Permanent%20Impairment%20or%20Damage%20(Devices),use%20of%20a%20medical%20product. Typically used in reporting for Clinical Research, post-market surveillance (e.g. Form FDA 3500A MedWatch)."
* ^status = #draft
* ^caseSensitive = true
* ^experimental = true
* #requiresPreventImpairment "Required Intervention to Prevent Permanent Impairment or Damage (Devices)" "Report if you believe that medical or surgical intervention was necessary to preclude permanent impairment of a body function, or prevent permanent damage to a body structure, either situation suspected to be due to the use of a medical product"

ValueSet: OutcomeAEClinRes
Id: adverse-event-outcome-clinical-research-vs
Title: "Adverse Event Clinical Research Outcomes"
Description: "This value set includes codes that describe the type of outcome from the adverse event as typically used in reporting for Clinical Research, post-market surveillance (e.g. Medwatch forms). NCI codes used here This list originates from the ICH E2B R3 (https://database.ich.org/sites/default/files/E2D_Guideline.pdf), specifically CDISC CL.C66768.OUT. For information on ICH see https://admin.ich.org/sites/default/files/inline-files/OID_Information_Paper_1.pdf from the INTERNATIONAL CONFERENCE ON HARMONISATION OF TECHNICAL REQUIREMENTS FOR REGISTRATION OF PHARMACEUTICALS FOR HUMAN USE (ICH) document ICH E2B(R3), the Electronic Transmission of Individual Case Safety Reports (ICSRs) Implementation Guide Data Elements and Message Specification, and ICH M8, the Electronic Common Technical Document."
* ^status = #draft
* ^experimental = true
//* urn:oid:2.16.840.1.113883.3.989.2.1.1.19#fatal "Fatal" //"Was the serious adverse event life-threatening?"
//* urn:oid:2.16.840.1.113883.3.989.2.1.1.19#notrecoveredorresolved "Not recovering/not resolved" 
//* urn:oid:2.16.840.1.113883.3.989.2.1.1.19#resolvedwithsequelae "Recovered/Resolved with sequelae"
//* urn:oid:2.16.840.1.113883.3.989.2.1.1.19#recoveredorresolved "Recovered/Resolved"
//* urn:oid:2.16.840.1.113883.3.989.2.1.1.19#recoveringorresolving "Recovering/Resolving"

* http://ncicb.nci.nih.gov/xml/owl/EVS/Thesaurus.owl#C48275 "Fatal" //"Was the serious adverse event life-threatening?"
* http://ncicb.nci.nih.gov/xml/owl/EVS/Thesaurus.owl#C49494 "Not recovering/not resolved" 
* http://ncicb.nci.nih.gov/xml/owl/EVS/Thesaurus.owl#C49495 "Recovered/Resolved with sequelae"
* http://ncicb.nci.nih.gov/xml/owl/EVS/Thesaurus.owl#C49498 "Recovered/Resolved"
* http://ncicb.nci.nih.gov/xml/owl/EVS/Thesaurus.owl#C49496 "Recovering/Resolving"




//CodeSystem: SeriousnessCriteriaCS
//Id: seriousness-criteria-cs
//Title: "Seriousness Criteria Code System"
//Description: "Action criteria usually associated with serious events that pose a threat to a patient's life or functioning"
//* #resultsInDeath "Resulted in Death" "Adverse event resulted in death"
//* #lifeThreatening "Life Threatening" "Life Threatening"
//* #resultsinHospitalization "Resulted in Hospitalization" "Resulted in Hospitalization"
//* #resultsInDisabliity "Resulted in Disability" "Resulted in Disability"
//* #isBirthDefect "Resulted in Birth defect" "Resulted in Birth Defect"
//* #requiresPreventImpairment "Required Intervention" "Required Intervention to Prevent Permanent Impairment or Damage"

ValueSet: AdverseEventSupportingInformation
Id: adverse-event-supporting-info
Title: "AdverseEvent Supporting Information"
Description: "This value set includes codes that describe the supporting information relevant to the event."
* ^status = #draft
* ^experimental = true
* ^copyright = "This value set includes content from SNOMED CT, which is copyright © 2002+ International Health Terminology Standards Development Organisation (IHTSDO), and distributed by agreement between IHTSDO and HL7. Implementer use of SNOMED CT is not covered by this agreement"
* include codes from system SNOMED_CT where concept is-a #609328004
* include codes from system SNOMED_CT where concept is-a #416471007
* include codes from system SNOMED_CT where concept is-a #425457005
* include codes from system SNOMED_CT where concept is-a #365861007
* include codes from system SNOMED_CT where concept is-a #71388002
* include codes from system SNOMED_CT where concept is-a #404684003
* include codes from system SNOMED_CT where concept is-a #410942007
* include codes from system SNOMED_CT where concept is-a #373873005
* include codes from system SNOMED_CT where concept is-a #106181007

ValueSet: CausalityRelatedness
Id: adverse-event-causality-related-vs
Title: "Causality Relatedness values"
Description: "Value set for stating if a suspected entity is Not Related, Unlikely Related, Possibly Related, or Related to the cause of the adverse event. Using NCI codes. The values originate with ICH. For information on ICH see https://admin.ich.org/sites/default/files/inline-files/OID_Information_Paper_1.pdf from the INTERNATIONAL CONFERENCE ON HARMONISATION OF TECHNICAL REQUIREMENTS FOR REGISTRATION OF PHARMACEUTICALS FOR HUMAN USE (ICH) document ICH E2B(R3), the Electronic Transmission of Individual Case Safety Reports (ICSRs) Implementation Guide Data Elements and Message Specification, and ICH M8, the Electronic Common Technical Document"
* ^status = #draft
* ^experimental = true
//* urn:oid:2.16.840.1.113883.3.989.2.1.1.19#notrelated "Not Related"
//* urn:oid:2.16.840.1.113883.3.989.2.1.1.19#unlikely "Unlikely Related"
//* urn:oid:2.16.840.1.113883.3.989.2.1.1.19#possibly "Possibly Related"
//* urn:oid:2.16.840.1.113883.3.989.2.1.1.19#related "Related"

* http://ncicb.nci.nih.gov/xml/owl/EVS/Thesaurus.owl#C53256 "Not Related"
* http://ncicb.nci.nih.gov/xml/owl/EVS/Thesaurus.owl#C53257 "Unlikely Related"
* http://ncicb.nci.nih.gov/xml/owl/EVS/Thesaurus.owl#C53258 "Possibly Related"
* http://ncicb.nci.nih.gov/xml/owl/EVS/Thesaurus.owl#C53260 "Related"

ValueSet: AdverseEventStatus
Id: adverse-event-status-vs
Title: "Adverse Event Status"
Description: "Codes identifying the lifecycle stage of an adverse event."
* ^status = #draft
* ^experimental = true
* http://hl7.org/fhir/event-status#in-progress
* http://hl7.org/fhir/event-status#completed
* http://hl7.org/fhir/event-status#entered-in-error
* http://hl7.org/fhir/event-status#unknown

ValueSet: AdverseEventType
Id: adverse-event-type-vs
Title: "AdverseEvent Type"
Description: "This value set includes codes that describe the adverse event or incident that occurred or was averted."
* ^status = #draft
* ^experimental = true
* ^copyright = "This value set includes content from SNOMED CT, which is copyright © 2002+ International Health Terminology Standards Development Organisation (IHTSDO), and distributed by agreement between IHTSDO and HL7. Implementer use of SNOMED CT is not covered by this agreement"
* include codes from system SNOMED_CT where concept is-a #370894009
* SNOMED_CT#1912002

ValueSet: AdverseEventContributingFactor
Id: adverse-event-contributing-factor-vs
Title: "AdverseEvent Contributing Factor"
Description: "This value set includes codes that describe the contributing factors suspected to have increased the probability or severity of the adverse event."
* ^status = #draft
* ^experimental = true
* ^copyright = "This value set includes content from SNOMED CT, which is copyright © 2002+ International Health Terminology Standards Development Organisation (IHTSDO), and distributed by agreement between IHTSDO and HL7. Implementer use of SNOMED CT is not covered by this agreement"
* include codes from system SNOMED_CT where concept is-a #609328004
* include codes from system SNOMED_CT where concept is-a #416471007
* include codes from system SNOMED_CT where concept is-a #425457005
* include codes from system SNOMED_CT where concept is-a #365861007
* include codes from system SNOMED_CT where concept is-a #71388002
* include codes from system SNOMED_CT where concept is-a #404684003
* include codes from system SNOMED_CT where concept is-a #410942007
* include codes from system SNOMED_CT where concept is-a #373873005
* include codes from system SNOMED_CT where concept is-a #106181007

//ValueSet: AdverseEventPreventiveAction
//Id: adverse-event-preventive-action-vs
//Title: "AdverseEvent Preventive Action"
//Description: "This value set includes codes that describe the preventive actions that contributed to avoiding the adverse event."
//* ^status = #draft
//* ^experimental = true
//* include codes from system SNOMED_CT where concept is-a #425457005
//* include codes from system SNOMED_CT where concept is-a #365861007
//* include codes from system SNOMED_CT where concept is-a #71388002
//* include codes from system SNOMED_CT where concept is-a #410942007
//* include codes from system SNOMED_CT where concept is-a #373873005
//* include codes from system SNOMED_CT where concept is-a #106181007

ValueSet: AdverseEventMitigatingAction
Id: adverse-event-mitigating-action-vs
Title: "AdverseEvent Mitigating Action"
Description: "This value set includes codes that describe the ameliorating actions taken after the adverse event occurred in order to reduce the extent of harm."
* ^status = #draft
* ^experimental = true
* ^copyright = "This value set includes content from SNOMED CT, which is copyright © 2002+ International Health Terminology Standards Development Organisation (IHTSDO), and distributed by agreement between IHTSDO and HL7. Implementer use of SNOMED CT is not covered by this agreement"
* include codes from system SNOMED_CT where concept is-a #71388002
* include codes from system SNOMED_CT where concept is-a #410942007
* include codes from system SNOMED_CT where concept is-a #373873005
* include codes from system SNOMED_CT where concept is-a #106181007

ValueSet: AdverseEventSeriousnessNonOnly
Id: adverse-event-seriousness-non-only-vs
Title: "AdverseEvent Seriousness Non-serious Codes Only"
Description: "This value set includes codes that describe the ameliorating actions taken after the adverse event occurred in order to reduce the extent of harm."
* ^status = #draft
* ^experimental = true
* http://terminology.hl7.org/CodeSystem/adverse-event-seriousness#serious "Serious"
* http://terminology.hl7.org/CodeSystem/adverse-event-seriousness#non-serious "Non-serious"


CodeSystem: AdverseEventSeverityOrGradeCS
Id: adverse-event-severity-or-grade-cs
Title: "AdverseEvent Severity or Grade Codes"
Description: "Hierarchical Code System for codes that indicate severity of the adverse event or grade."
* ^url = "http://hl7.org/fhir/uv/ae-research-backport-ig/CodeSystem/adverse-event-severity-or-grade-cs"
* ^experimental = true
* ^caseSensitive = true
* ^hierarchyMeaning = #is-a
* ^property[0].code = #abstract
* ^property[=].type = #boolean
* ^property[=].description = "True when the code is not intended to be used"
* ^property[+].code = #parent
* ^property[=].uri = "http://hl7.org/fhir/concept-properties#parent"
* ^property[=].type = #code
* ^property[=].description = "The parent term of the current term"
* #severity "Severity Codes" "Grouping concept for severities"
* #severity ^property.code = #abstract
* #severity ^property.valueBoolean = true
* #grade "Grade Codes" "Grouping concept for grades"
* #grade ^property.code = #abstract
* #grade ^property.valueBoolean = true
* #1 "Mild" "An experience that is usually transient, and requires no special treatment or intervention. The event does not generally interfere with usual daily activities. Includes transient laboratory test alterations."
* #1 ^property[+].code = #parent
* #1 ^property[=].valueCode = #grade
* #1 ^property[+].code = #parent
* #1 ^property[=].valueCode = #severity
* #2 "Moderate" "An experience that is alleviated with simple therapeutic treatments. The event impacts usual daily activities. Includes laboratory test alterations indicating injury, but without long-term risk."
* #2 ^property[+].code = #parent
* #2 ^property[=].valueCode = #grade
* #2 ^property[+].code = #parent
* #2 ^property[=].valueCode = #severity
* #3 "Severe" "An adverse event experience that requires intensive therapeutic intervention and interrupts usual daily activities."
* #3 ^property[+].code = #parent
* #3 ^property[=].valueCode = #grade
* #3 ^property[+].code = #parent
* #3 ^property[=].valueCode = #severity
* #4 "Life Threatening or Disabling" "Any adverse event that places the patient, in the view of the initial reporter, at immediate risk of death from the adverse event as it occurred, i.e., it does not include an adverse experience that, had it occurred in a more severe form, might have caused death."
* #4 ^property[+].code = #parent
* #4 ^property[=].valueCode = #grade
* #5 "Death Related to Adverse Event" "The termination of life associated with an adverse event."
* #5 ^property[+].code = #parent
* #5 ^property[=].valueCode = #grade

//https://hl7.org/fhir/R4/valueset-example-hierarchical.json.html
//http://hl7.org/fhir/R4B/valueset-example-expansion.json.html
ValueSet: AdverseEventSeverityOrGrade
Id: adverse-event-severity-or-grade-vs
Title: "AdverseEvent Severity or Grade Value Set"
Description: "This value set includes codes that indicate severity of the adverse event or grade."
* ^status = #draft
* ^experimental = true
* include codes from system adverse-event-severity-or-grade-cs
//http://hl7.org/fhir/uv/ae-research-backport-ig/CodeSystem/adverse-event-severity-or-grade-cs
    where parent in "severity, grade"
* ^expansion.timestamp = "2022-05-22T13:56:07Z"
* ^expansion.total = 8
* ^expansion.offset = 0
* ^expansion.parameter.name = "version"
* ^expansion.parameter.valueString = "1.00"	
* ^expansion.contains[+].display = "Severity codes"
* ^expansion.contains[=].abstract = true
* ^expansion.contains[=].contains[0].system = "http://hl7.org/fhir/uv/ae-research-backport-ig/CodeSystem/adverse-event-severity-or-grade-cs"
* ^expansion.contains[=].contains[=].code = #1
* ^expansion.contains[=].contains[=].display = "Mild"
* ^expansion.contains[=].contains[+].system = "http://hl7.org/fhir/uv/ae-research-backport-ig/CodeSystem/adverse-event-severity-or-grade-cs"
* ^expansion.contains[=].contains[=].code = #2
* ^expansion.contains[=].contains[=].display = "Moderate"
* ^expansion.contains[=].contains[+].system = "http://hl7.org/fhir/uv/ae-research-backport-ig/CodeSystem/adverse-event-severity-or-grade-cs"
* ^expansion.contains[=].contains[=].code = #3
* ^expansion.contains[=].contains[=].display = "Severe"
* ^expansion.contains[+].display = "Grade codes"
* ^expansion.contains[=].abstract = true
* ^expansion.contains[=].contains[0].system = "http://hl7.org/fhir/uv/ae-research-backport-ig/CodeSystem/adverse-event-severity-or-grade-cs"
* ^expansion.contains[=].contains[=].code = #1
* ^expansion.contains[=].contains[=].display = "Mild"
* ^expansion.contains[=].contains[+].system = "http://hl7.org/fhir/uv/ae-research-backport-ig/CodeSystem/adverse-event-severity-or-grade-cs"
* ^expansion.contains[=].contains[=].code = #2
* ^expansion.contains[=].contains[=].display = "Moderate"
* ^expansion.contains[=].contains[+].system = "http://hl7.org/fhir/uv/ae-research-backport-ig/CodeSystem/adverse-event-severity-or-grade-cs"
* ^expansion.contains[=].contains[=].code = #3
* ^expansion.contains[=].contains[=].display = "Severe"
* ^expansion.contains[=].contains[+].system = "http://hl7.org/fhir/uv/ae-research-backport-ig/CodeSystem/adverse-event-severity-or-grade-cs"
* ^expansion.contains[=].contains[=].code = #4
* ^expansion.contains[=].contains[=].display = "Life Threatening or Disabling"
* ^expansion.contains[=].contains[+].system = "http://hl7.org/fhir/uv/ae-research-backport-ig/CodeSystem/adverse-event-severity-or-grade-cs"
* ^expansion.contains[=].contains[=].code = #5
* ^expansion.contains[=].contains[=].display = "Death Related to Adverse Event"


//* ^compose.property = "parent"
//* include codes from system http://hl7.org/fhir/R4/valueset-adverse-event-severity.html
//* include codes from system http://hl7.org/fhir/uv/ae-research-backport-ig/CodeSystem/adverse-event-severity-or-grade-cs
//adverse-event-severity-or-grade-cs
//* compose.property[0] = #parent
//* compose.include.system = "http://hl7.org/fhir/uv/ae-research-backport-ig/CodeSystem/adverse-event-severity-or-grade-cs"


Invariant: aeClinRes-seriousness-1
Description: "If seriousness is serious then must have at least one seriousness criterion."
Expression: 
"(seriousness.coding
.exists(system='http://terminology.hl7.org/CodeSystem/adverse-event-seriousness' and code='serious')
and extension('http://hl7.org/fhir/uv/ae-research-backport-ig/StructureDefinition/seriousness-criteria').exists()
and seriousness.coding
.exists(system='http://terminology.hl7.org/CodeSystem/adverse-event-seriousness' and code='non-serious').not()
)
or
(seriousness.coding.exists(system='http://terminology.hl7.org/CodeSystem/adverse-event-seriousness'
and code='non-serious') and
seriousness.coding
.exists(system='http://terminology.hl7.org/CodeSystem/adverse-event-seriousness' and code='serious').not()
and
extension('http://hl7.org/fhir/uv/ae-research-backport-ig/StructureDefinition/seriousness-criteria').exists().not()
)"

//"(AdverseEvent.seriousness.coding
//.exists(system='http://terminology.hl7.org/CodeSystem/adverse-event-seriousness' and code='serious')
//and extension.where(url='http://hl7.org/fhir/uv/ae-research-backport-ig/StructureDefinition/seriousness-criteria').exists()
//)
//or
//(AdverseEvent.seriousness.coding.exists(system='http://terminology.hl7.org/CodeSystem/adverse-event-seriousness'
//and code='non-serious')
//)"
Severity: #error
//XPath: " "


Invariant:      cnt-3
Description:    "There SHALL be a code with a value of '1' if there is a value. If system is present, it SHALL be UCUM. If present, the value SHALL be a whole number."
Expression:     "(code.exists() or value.empty()) and (system.empty() or system = %ucum) and (code.empty() or code = '1') and (value.empty() or value.hasValue().not() or value.toString().contains('.').not())"
Severity:       #error


Profile: AdverseEventClinicalResearch
Parent: AdverseEvent
Id: AdverseEvent-clinical-research
Title: "Adverse Event Clinical Research"
Description: "Convenience backport into R4 of FHIR R5 Foundational profile of AdverseEvent for Clinical Research communications."

* obeys aeClinRes-seriousness-1

* modifierExtension contains
    Status named status 1..1 ?! SU 

* extension contains 
    //study-info-associated-with-AE named study-info-associated-with-AE 0..* and
	ResearchSubjectRef named research-subject-ref 0..1 and
	CausedSubjectToDiscontinueStudy named caused-subject-to-discontinue-study 0..1 and
    SeriousnessCriteria named seriousness-criteria 0..* and
    SeverityOrGrade named severity-or-grade 0..1 and
    expected-in-research-study named expected-in-research-study 0..1 and
    Note named note 0..* and
//	Status named status 1..1 ?! SU and //?!
	ResolvedDate named resolve-date 0..1 and
//	SupportingMedicationInfo named supporting-medication-info 0..* and
	SuspectEntity named suspect-entity 0..* SU and
	ContributingFactor named contributing-factor 0..* SU and
//	PreventiveAction named preventive-action 0..* SU and
	MitigatingAction named mitigating-action 0..* SU and
	SupportingInfo named supporting-info 0..* SU and
	Participant named participant 0..* and
	ResultingEffect named resultingEffect 0..*

* modifierExtension[Status] ^short = "in-progress | completed | entered-in-error | unknown"
* modifierExtension[Status] ^definition = "The current state of the adverse event or potential adverse event."
* modifierExtension[Status] ^comment = "This is not the reporting of the event to any regulatory or quality organization.  This is not the outcome of the patient's condition."
//* modifierExtension[Status] ^isModifier = true
* modifierExtension[Status] ^isModifierReason = "This element is labeled as a modifier because it is a status element that contains status entered-in-error which means that the resource should not be treated as valid"
* modifierExtension[Status] ^binding.strength = #required
* modifierExtension[Status] ^binding.extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName"
* modifierExtension[Status] ^binding.extension.valueString = "AdverseEventStatus"
* modifierExtension[Status] ^binding.description = "Codes identifying the lifecycle stage of an event."

* extension[ResultingEffect] ^short = "Effect on the subject due to this event"

* extension[ResearchSubjectRef] ^short = "Research Subject record of subject"
* extension[SeverityOrGrade] ^short = "The degree of something undesirable"
* extension[expected-in-research-study] ^short = "Considered likely or probable or anticipated in the research study"
* extension[Note] ^short = "Comment on adverse event"

* extension[ResolvedDate] ^short = "Adverse Event resolution date"

//* extension[SupportingMedicationInfo] ^short = "Additional information regarding medications the subject is taking"
//* extension[SupportingMedicationInfo] ^definition = "Provides references to medications the subject has been prescribed for additional context. These should be medications that are not suspected or considered as potential suspects for the adverse event. For example, a patient who became nauseous after eating a study drug that was not meant to be taken orally. This element could indicate that the patient was using topical acne medication."

* extension[SuspectEntity] ^short = "A suspected agent causing the adverse event"
* extension[SuspectEntity] ^definition = "Describes an entity that is suspected to have caused the adverse event."

* extension[ContributingFactor] ^short = "Contributing factors suspected to have increased the probability or severity of the adverse event"
* extension[ContributingFactor] ^definition = "A contributing factors suspected to have increased the probability or severity of the adverse event."
//* extension[PreventiveAction] ^short = "Preventive actions that contributed to avoiding the adverse event"
//* extension[PreventiveAction] ^definition = "Preventive actions that contributed to avoiding the adverse event."
* extension[MitigatingAction] ^short = "Ameliorating actions taken after the adverse event occurred in order to reduce the extent of harm"
* extension[MitigatingAction] ^definition = "The ameliorating action taken after the adverse event occurred in order to reduce the extent of harm."
* extension[SupportingInfo] ^short = "Subject medical history or document relevant to this adverse event"

* extension[Participant] ^short = "Who was involved in the adverse event or the potential adverse event and what they did"

* event 0..1 SU
* event from adverse-event-type-vs (example)
* event ^short = "Event or incident that occurred or was averted"
* event ^definition = "Specific event that occurred or that was averted, such as patient fall, wrong organ removed, or wrong blood transfused."
* event ^isModifier = false
* event ^binding.extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName"
* event ^binding.extension.valueString = "AdverseEventType"
* event ^binding.description = "Detailed type of event."

* suspectEntity 0..0
//.extension contains InstanceCodeableConcept named instance-codeable-concept 0..1
//* suspectEntity.causality 1..1 MS
//* suspectEntity.causality.productRelatedness 0..0
//* suspectEntity.causality.entityRelatedness from adverse-event-causality-related-vs (preferred)
//* suspectEntity.causality.assessment from adverse-event-causality-related-vs (preferred)

* actuality = http://hl7.org/fhir/adverse-event-actuality#actual
* actuality ^short = "actual"

//* expectedInResearchStudy 0..* MS contentReference http://build.fhir.org/adverseevent-definitions.html#AdverseEvent.expectedInResearchStudy //"expectedInResearchStudy" "Considered likely or probable or anticipated in the research study"

* event 1..1

//* occurrence[x] only Period
//* occurrencePeriod 0..1 MS
* seriousness 1..1 MS 
//* seriousness from http://hl7.org/fhir/ValueSet/adverse-event-seriousness (required)
* seriousness from adverse-event-seriousness-non-only-vs (required)

* seriousness
//obeys aeClinRes-seriousness-1
* seriousness ^short = "Investigator defined severity of the adverse event, in relation to the subject not the resulting condition"
* outcome 1..1 MS
* outcome from adverse-event-outcome-clinical-research-vs (required)
* severity 0..0
* subjectMedicalHistory 0..0
* referenceDocument 0..0
* study 1..1 MS
* resultingCondition 0..0






