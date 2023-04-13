Extension: Note
Id: note
Title: "Note"
Description: "Comments made about the adverse event by the performer, subject or other participants."
* value[x] only Annotation

Extension: ExpectedInResearchStudy
Id: expected-in-research-study
Title: "Expected In Research Study"
Description: "Considered likely or probable or anticipated in the research study.  Whether the reported event matches any of the outcomes for the patient that are considered by the study as known or likely."
* value[x] only boolean

Extension: InstanceCodeableConcept
Id: instance-codeable-concept
Title: "Instance Codeable Concept"
Description: "Codeable concept for the specific entity that caused the adverse event."
* value[x] only CodeableConcept

Extension: Status
Id: status
Title: "Workflow Status"
Description: "The current workflow state of the adverse event or potential adverse event. This is not the reporting of the event to any regulatory or quality organization.  This is not the outcome of the patient's condition."
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
* extension contains
    item 1..1
* extension[item] ^short = "Item suspected to have increased the probability or severity of the adverse event"
* extension[item].valueReference only Reference(Condition or Observation or AllergyIntolerance or FamilyMemberHistory or Immunization or Procedure or Device or DocumentReference or MedicationAdministration)
* extension[item].valueCodeableConcept from adverse-event-contributing-factor-vs (example)
* extension[item].valueCodeableConcept ^binding.extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName"
* extension[item].valueCodeableConcept ^binding.extension.valueString = "AdverseEventContributingFactor"
* extension[item].valueCodeableConcept ^binding.description = "Codes describing the contributing factors suspected to have increased the probability or severity of the adverse event."


//AdverseEvent.preventiveAction
Extension: PreventiveAction
Id: preventive-action
Title: "Preventive Action"
Description: "Preventive actions that contributed to avoiding the adverse event."
* extension contains
    item 1..1
* extension[item] ^short = "Action that contributed to avoiding the adverse event"
* extension[item].valueReference only Reference(Immunization or Procedure or DocumentReference or MedicationAdministration or MedicationRequest)
* extension[item].valueCodeableConcept from adverse-event-preventive-action-vs (example)
* extension[item].valueCodeableConcept ^binding.extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName"
* extension[item].valueCodeableConcept ^binding.extension.valueString = "AdverseEventPreventiveAction"
* extension[item].valueCodeableConcept ^binding.description = "Codes describing the preventive actions that contributed to avoiding the adverse event."



//AdverseEvent.mitigatingAction
Extension: MitigatingAction
Id: mitigating-action
Title: "Mitigating Action"
Description: "Ameliorating actions taken after the adverse event occurred in order to reduce the extent of harm."
* extension contains
    item 1..1
* extension[item] ^short = "Ameliorating action taken after the adverse event occurred in order to reduce the extent of harm"
* extension[item].valueReference only Reference(Procedure or DocumentReference or MedicationAdministration or MedicationRequest)
* extension[item].valueCodeableConcept from adverse-event-mitigating-action-vs (example)
* extension[item].valueCodeableConcept ^binding.extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName"
* extension[item].valueCodeableConcept ^binding.extension.valueString = "AdverseEventMitigatingAction"
* extension[item].valueCodeableConcept ^binding.description = "Codes describing the ameliorating actions taken after the adverse event occurred in order to reduce the extent of harm."



//AdverseEvent.suspectEntity.causality
Extension: Causality
Id: causality
Title: "Causality - information on the possible cause of the event"
Description: "Causality - information on the possible cause of the event."
* extension contains
    assessmentMethod 0..1 and
    entityRelatedness 0..1 and
    author 0..1
* extension[assessmentMethod] ^short = "Method of evaluating the relatedness of the suspected entity to the event."
* extension[assessmentMethod].valueCodeableConcept from http://hl7.org/fhir/ValueSet/adverse-event-causality-method (preferred)
* extension[assessmentMethod].valueCodeableConcept ^binding.extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName"
* extension[assessmentMethod].valueCodeableConcept ^binding.extension.valueString = "AdverseEventCausalityMethod"
* extension[assessmentMethod].valueCodeableConcept ^binding.description = "Codes for the method of evaluating the relatedness of the suspected entity to the event, such as ProbabilityScale | Bayesian | Checklist."

* extension[entityRelatedness] ^short = "Result of the assessment regarding the relatedness of the suspected entity to the event"
* extension[entityRelatedness].valueCodeableConcept from adverse-event-causality-related-vs (preferred)

* extension[author] ^short = "Author of the information on the possible cause of the event"
* extension[author].valueReference only Reference(Patient or Practitioner or PractitionerRole or RelatedPerson or ResearchSubject)



//AdverseEvent.suspectEntity
Extension: SuspectEntity
Id: suspect-entity
Title: "Suspect Entity"
Description: "Describes the entity that is suspected to have caused the adverse event."
* extension contains
    instance 1..1 and
    Causality named causality 1..1
* extension[instance] ^short = "Refers to the specific entity that is suspected of causing the adverse event"
* extension[instance].valueCodeableConcept from http://snomed.info/sct (example)
* extension[instance].valueReference only Reference(Immunization or Procedure or Substance or Medication or MedicationAdministration or Device or BiologicallyDerivedProduct or ResearchStudy)
* extension[causality]



//AdverseEvent.supportingInfo
Extension: SupportingInfo
Id: supporting-info
Title: "Supporting information relevant to the event"
Description: "Relevant past history for the subject. In a clinical care context, an example being a patient had an adverse event following a penicillin administration and the patient had a previously documented penicillin allergy. In a clinical trials context, an example is a bunion or rash that was present prior to the study. Additionally, the supporting item can be a document that is relevant to this instance of the adverse event that is not part of the subject's medical history. For example, a clinical note, staff list, or material safety data sheet (MSDS). Supporting information is not a contributing factor, preventive action, or mitigating action."
* extension contains
    item 1..1
* extension[item] ^short = "Subject medical history or document relevant to this adverse event"
* extension[item].valueReference only Reference(Condition or Observation or AllergyIntolerance or FamilyMemberHistory or Immunization or Procedure or DocumentReference or MedicationAdministration)
* extension[item].valueCodeableConcept from http://hl7.org/fhir/ValueSet/adverse-event-supporting-info (example)
* extension[item].valueCodeableConcept ^binding.extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName"
* extension[item].valueCodeableConcept ^binding.extension.valueString = "Adverse Event Supporting Info "
* extension[item].valueCodeableConcept ^binding.description = "Codes describing the supporting information relevant to the event."



Extension: SeverityOrGrade
Id: severity-or-grade
Title: "Severity Or Grade"
Description: "Describes the severity of the adverse event, in relation to the subject not the resulting condition. In the context of clinical research, it is the investigator’s assessment of severity. For cancer related trials, severity is represented as a grade."
* value[x] only CodeableConcept
* valueCodeableConcept from http://hl7.org/fhir/R4/valueset-adverse-event-severity (preferred)
//http://hl7.org/fhir/ValueSet/adverse-event-severity (extensible)

Extension: CausedSubjectToDiscontinueStudy
Id: caused-subject-to-discontinue-study
Title: "Adverse event caused subject to discontinue the study"
Description: "Indicates if the subject discontinued the study due to the adverse event."
* value[x] only boolean

Extension: SeriousnessCriteria
Id: seriousness-criteria
Title: "Criteria reviewed in determining serious adverse event"
Description: "TBD - Element to capture the presence or absence of specific factors (criteria) associated with serious adverse events."
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
* value[x] only dateTime

Extension: ResearchSubjectRef
Id: research-subject-ref
Title: "Research Subject record of subject"
Description: "Communicates Research Subject related metadata."
* value[x] only Reference(ResearchSubject)

//AdverseEvent.resultingEffect
Extension: ResultingEffect
Id: resultingEffect
Title: "Resulting Effect"
Description: "Information about the condition that occurred as a result of the adverse event, such as hives due to the exposure to a substance (for example, a drug or a chemical) or a broken leg as a result of the fall."
* value[x] only Reference(Condition or Observation)

//AdverseEvent.participant
Extension: Participant
Id: participant
Title: "Participant"
Description: "Indicates who or what participated in the adverse event and how they were involved."
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
* http://terminology.hl7.org/CodeSystem/v3-ParticipationType#INF	"informant"
* http://terminology.hl7.org/CodeSystem/v3-ParticipationType#PART	"Participation" 
* http://terminology.hl7.org/CodeSystem/v3-ParticipationType#WIT	"witness"
* http://terminology.hl7.org/CodeSystem/v3-ParticipationType#AUT	"author (originator)"

ValueSet: AdverseEventSerCrit
Id: adverse-event-seriousness-criteria-vs
Title: "Adverse Event Seriousness Criteria"
Description: "Action criteria usually associated with serious events that pose a threat to a patient's life or functioning. Adverse Events criteria to expand on the seriousness of the adverse event. Typically used in reporting for Clinical Research, post-market surveillance (e.g. Form FDA 3500A MedWatch). The adverse event seriousness criteria value set is based on the ICH E2D Post-Approval Safety Data Management: Definitions and Standards for Expedited Reporting guidance (https://database.ich.org/sites/default/files/E2D_Guideline.pdf)."
//* codes from system seriousness-criteria-cs
* urn:oid:2.16.840.1.113883.3.989.2.1.1.19#34	"resultsInDeath" //"Was the serious adverse event life-threatening?"
* urn:oid:2.16.840.1.113883.3.989.2.1.1.19#21	"isLifeThreatening" 
* urn:oid:2.16.840.1.113883.3.989.2.1.1.19#33	"requiresInpatientHospitalization"
* urn:oid:2.16.840.1.113883.3.989.2.1.1.19#35	"resultsInPersistentOrSignificantDisability"
* urn:oid:2.16.840.1.113883.3.989.2.1.1.19#12	"congenitalAnomalyBirthDefect"
* urn:oid:2.16.840.1.113883.3.989.2.1.1.19#26	"otherMedicallyImportantCondition" 

ValueSet: OutcomeAEClinRes
Id: adverse-event-outcome-clinical-research-vs
Title: "Adverse Event Clinical Research Outcomes"
Description: "This value set includes codes that describe the type of outcome from the adverse event as typically used in reporting for Clinical Research, post-market surveillance (e.g. Medwatch forms). This list comes from ICH E2B R3 (https://database.ich.org/sites/default/files/E2D_Guideline.pdf), specifically CDISC CL.C66768.OUT."
* urn:oid:2.16.840.1.113883.3.989.2.1.1.19#fatal	"Fatal" //"Was the serious adverse event life-threatening?"
* urn:oid:2.16.840.1.113883.3.989.2.1.1.19#notrecoveredorresolved	"Not recovering/not resolved" 
* urn:oid:2.16.840.1.113883.3.989.2.1.1.19#resolvedwithsequelae	"Recovered/Resolved with sequelae"
* urn:oid:2.16.840.1.113883.3.989.2.1.1.19#recoveredorresolved	"Recovered/Resolved"
* urn:oid:2.16.840.1.113883.3.989.2.1.1.19#roveringorresolving	"Recovering/Resolving"

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

ValueSet: CausalityRelatedness
Id: adverse-event-causality-related-vs
Title: "Causality Relatedness values"
Description: "Valueset for stating if a suspected entity is Not Related, Unlikely Related, Possibly Related, or Related to the cause of the adverse event. This values are derived from the ICH."
* urn:oid:2.16.840.1.113883.3.989.2.1.1.19#notrelated "Not Related"
* urn:oid:2.16.840.1.113883.3.989.2.1.1.19#unlikely "Unlikely Related"
* urn:oid:2.16.840.1.113883.3.989.2.1.1.19#possibly "Possibly Related"
* urn:oid:2.16.840.1.113883.3.989.2.1.1.19#related "Related"

ValueSet: AdverseEventStatus
Id: adverse-event-status-vs
Title: "Adverse Event Status"
Description: "Codes identifying the lifecycle stage of an adverse event."
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
* include codes from system SNOMED_CT where concept is-a #370894009
* SNOMED_CT#1912002

ValueSet: AdverseEventContributingFactor
Id: adverse-event-contributing-factor-vs
Title: "AdverseEvent Contributing Factor"
Description: "This value set includes codes that describe the contributing factors suspected to have increased the probability or severity of the adverse event."
* ^status = #draft
* ^experimental = true
* ^copyright = "This resource includes content from SNOMED Clinical Terms® (SNOMED CT®) which is copyright of the International Health Terminology Standards Development Organisation (IHTSDO). Implementers of these specifications must have the appropriate SNOMED CT Affiliate license - for more information contact http://www.snomed.org/snomed-ct/get-snomed-ct or info@snomed.org"
* include codes from system SNOMED_CT where concept is-a #609328004
* include codes from system SNOMED_CT where concept is-a #416471007
* include codes from system SNOMED_CT where concept is-a #425457005
* include codes from system SNOMED_CT where concept is-a #365861007
* include codes from system SNOMED_CT where concept is-a #71388002
* include codes from system SNOMED_CT where concept is-a #404684003
* include codes from system SNOMED_CT where concept is-a #410942007
* include codes from system SNOMED_CT where concept is-a #373873005
* include codes from system SNOMED_CT where concept is-a #106181007

ValueSet: AdverseEventPreventiveAction
Id: adverse-event-preventive-action-vs
Title: "AdverseEvent Preventive Action"
Description: "This value set includes codes that describe the preventive actions that contributed to avoiding the adverse event."
* ^status = #draft
* ^experimental = true
* include codes from system SNOMED_CT where concept is-a #425457005
* include codes from system SNOMED_CT where concept is-a #365861007
* include codes from system SNOMED_CT where concept is-a #71388002
* include codes from system SNOMED_CT where concept is-a #410942007
* include codes from system SNOMED_CT where concept is-a #373873005
* include codes from system SNOMED_CT where concept is-a #106181007

ValueSet: AdverseEventMitigatingAction
Id: adverse-event-mitigating-action-vs
Title: "AdverseEvent Mitigating Action"
Description: "This value set includes codes that describe the ameliorating actions taken after the adverse event occurred in order to reduce the extent of harm."
* ^status = #draft
* ^experimental = true
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
* http://terminology.hl7.org/CodeSystem/adverse-event-seriousness#Serious "Serious"
* http://terminology.hl7.org/CodeSystem/adverse-event-seriousness#Non-serious "Non-serious"

Invariant: aeClinRes-seriousness-1
Description: "If seriousness is serious then must have at least one seriousness criterion."
Expression: "(seriousness=http://terminology.hl7.org/CodeSystem/adverse-event-seriousness#serious AND extension[seriousness-criteria].exists()) OR seriousness=http://terminology.hl7.org/CodeSystem/adverse-event-seriousness#non-serious"
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
Description: "An example profile of AdverseEvent for Research reporting."
* extension contains 
    //study-info-associated-with-AE named study-info-associated-with-AE 0..* and
	ResearchSubjectRef named research-subject-ref 0..1 and
	CausedSubjectToDiscontinueStudy named caused-subject-to-discontinue-study 0..1 and
    SeriousnessCriteria named seriousness-criteria 0..* and
    SeverityOrGrade named severity-or-grade 0..1 and
    expected-in-research-study named expected-in-research-study 0..1 and
    Note named note 0..* and
	Status named status 1..1 ?! SU and
	ResolvedDate named resolve-date 0..1 and
//	SupportingMedicationInfo named supporting-medication-info 0..* and
	SuspectEntity named suspect-entity 0..* SU and
	ContributingFactor named contributing-factor 0..* SU and
	PreventiveAction named preventive-action 0..* SU and
	MitigatingAction named mitigating-action 0..* SU and
	SupportingInfo named supporting-info 0..* SU and
	Participant named participant 0..* and
	ResultingEffect named resultingEffect 0..*

* extension[ResultingEffect] ^short = "Effect on the subject due to this event"

* extension[ResearchSubjectRef] ^short = "Research Subject record of subject"
* extension[SeverityOrGrade] ^short = "The degree of something undesirable"
* extension[expected-in-research-study] ^short = "Considered likely or probable or anticipated in the research study"
* extension[Note] ^short = "Comment on adverse event"

* extension[Status] ^short = "in-progress | completed | entered-in-error | unknown"
* extension[Status] ^definition = "The current state of the adverse event or potential adverse event."
* extension[Status] ^comment = "This is not the reporting of the event to any regulatory or quality organization.  This is not the outcome of the patient's condition."
//* extension[Status] ^isModifier = true
* extension[Status] ^isModifierReason = "This element is labeled as a modifier because it is a status element that contains status entered-in-error which means that the resource should not be treated as valid"
* extension[Status] ^binding.extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName"
* extension[Status] ^binding.extension.valueString = "AdverseEventStatus"
* extension[Status] ^binding.description = "Codes identifying the lifecycle stage of an event."

* extension[ResolvedDate] ^short = "Adverse Event resolution date"

//* extension[SupportingMedicationInfo] ^short = "Additional information regarding medications the subject is taking"
//* extension[SupportingMedicationInfo] ^definition = "Provides references to medications the subject has been prescribed for additional context. These should be medications that are not suspected or considered as potential suspects for the adverse event. For example, a patient who became nauseous after eating a study drug that was not meant to be taken orally. This element could indicate that the patient was using topical acne medication."

* extension[SuspectEntity] ^short = "A suspected agent causing the adverse event"
* extension[SuspectEntity] ^definition = "Describes an entity that is suspected to have caused the adverse event."

* extension[ContributingFactor] ^short = "Contributing factors suspected to have increased the probability or severity of the adverse event"
* extension[ContributingFactor] ^definition = "A contributing factors suspected to have increased the probability or severity of the adverse event."
* extension[PreventiveAction] ^short = "Preventive actions that contributed to avoiding the adverse event"
* extension[PreventiveAction] ^definition = "Preventive actions that contributed to avoiding the adverse event."
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

//* occurrence[x] only Period
//* occurrencePeriod 0..1 MS
* seriousness 1..1 MS 
//* seriousness from http://hl7.org/fhir/ValueSet/adverse-event-seriousness (required)
* seriousness from adverse-event-seriousness-non-only-vs (required)

* seriousness obeys aeClinRes-seriousness-1
* seriousness ^short = "Investigator defined severity of the adverse event, in relation to the subject not the resulting condition"
* outcome 1..1 MS
* outcome from adverse-event-outcome-clinical-research-vs (required)
* subjectMedicalHistory 0..0
* referenceDocument 0..0
* study 1..1 MS
* resultingCondition 0..0






