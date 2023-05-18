
# Change Log
All notable changes to the Assembly line tooling will be documented here.

## [Unreleased] - yyyy-mm-dd
- /RELEASE-MANAGER/ short description

### Features
- [TermIt-ui - #127](https://github.com/datagov-cz/termit-ui/pull/127), export button added to vocabulary summary
- [Mission Control - #246](https://github.com/datagov-cz/mission-control/pull/246), added button that calls CheckIt, it it visible only when CheckIt is deployed in AL

### Bug fixes
- [OntoGrapher - #491](https://github.com/datagov-cz/ontoGrapher/issues/491), support for equivalent classes,
- [OntoGrapher - #488](https://github.com/datagov-cz/ontoGrapher/issues/488), fix for selection artifacts baking themselves into exported images,
- [OntoGrapher - #485](https://github.com/datagov-cz/ontoGrapher/issues/485), fix for assignment/creation of tropes in Compact view did not add that trope in Full view
- [TermIt - #109](https://github.com/datagov-cz/termit/issues/109), fix exporting of a vocabulary to respect selected contexts

## 2023-04-08 - Easter release
This release changes user eXperience of major applications -- Mission Control, OntoGrapher, and some minor changes in other tools. It also fixes bugs found in previously released version.

### Features
- [SGoV - #160](https://github.com/datagov-cz/sgov/issues/160), adding number of usages per vocabulary,
- [OntoGrapher - #466](https://github.com/datagov-cz/ontoGrapher/issues/466), [OntoGrapher - #465](https://github.com/datagov-cz/ontoGrapher/issues/465), [OntoGrapher - #464](https://github.com/datagov-cz/ontoGrapher/issues/464), [OntoGrapher - #463](https://github.com/datagov-cz/ontoGrapher/issues/463), [OntoGrapher - #462](https://github.com/datagov-cz/ontoGrapher/issues/462) and [OntoGrapher - #461](https://github.com/datagov-cz/ontoGrapher/issues/461), OntoGrapher UX updates,
- [Mission Control - #235](https://github.com/datagov-cz/mission-control/pull/235), new version of Mission control UX.

### Bug fixes
- [Termit - #106](https://github.com/datagov-cz/termit/issues/106), fixes problem with updating definitions mentioning terms from other draft versions,
- [TermIt - #101](https://github.com/datagov-cz/termit/issues/101), allows creating independent copies of identically named terms in various versions of vocabularies,
- [TermIt - #100](https://github.com/datagov-cz/termit/issues/100), fixes deletion of term deletes also all its occurrences in other versions,
- [TermIt - #98](https://github.com/datagov-cz/termit/issues/98), fixes problems with showing narrower terms of newly created vocabulary,
- [SGoV - #158](https://github.com/datagov-cz/sgov/pull/158), removes application context when removing vocabulary

## 2023-01-20
In the long term was updated architecture of the whole system. It consists of major changes in TermIt UI and SGoV server and some minor changes in other tools. All bug fixes were postponed due to this update to this very date. 

### Features
- [Ontographer - #385](https://github.com/opendata-mvcr/ontoGrapher/issues/385), deprecates workspace loading in favor of vocabulary context(s) loading.
- [TermIt - #165](https://github.com/kbss-cvut/termit/issues/164), TermIt accepts set of vocabularies to be edited. TermIt was edited to handle new architecture, where workspaces don't exist. KBSS TermIt was modified to accept Keycloak as a mean of authentification. All vocabularies are visible in the UI, only the vocabularies which were passed for editation are actually editable, the rest is locked. Vocabularies can be edited in multiple contexts without collisions with other editing versions.
- [TermIt - #32](https://github.com/lecbyjak/intelligent-tree-select/issues/32), TermIt allows expansion of terms in the tree component that have the same parent 
- [SGoV - #141](https://github.com/opendata-mvcr/sgov/pull/141), adds endpoint allowing to validate set of vocabularies
- [SGoV - #146](https://github.com/opendata-mvcr/sgov/pull/146), change to new data architecture with attachments under vocabularies
- [SGoV - #149](https://github.com/opendata-mvcr/sgov/pull/149), searching in SSP is changed from Virtuoso to GraphDB cache
- [SGoV - #154](https://github.com/opendata-mvcr/sgov/pull/154), Change Tracking Context was changed to suit the new Termit
- [Assembly line - #123](https://github.com/opendata-mvcr/sgov-assembly-line/pull/123), [Assembly line - #128](https://github.com/opendata-mvcr/sgov-assembly-line/pull/128), new TermIt deployment settings

### Bug fixes
- [Ontographer - AL#110](https://github.com/opendata-mvcr/sgov-assembly-line/issues/110), fixes bug in which OntoGrapher would list deleted terms in the term panel,
- [Ontographer - AL#116](https://github.com/opendata-mvcr/sgov-assembly-line/issues/116), fixes bug in which OntoGrapher where intrinsic tropes created in Compact Mode wouldn't show up in Full Mode,
- [Ontographer - AL#119](https://github.com/opendata-mvcr/sgov-assembly-line/issues/119), fixes bug in which OntoGrapher where has-trope/is-trope-of links were loaded incorrectly,
- [Ontographer - #454](https://github.com/opendata-mvcr/ontoGrapher/issues/454), fixes bug in which OntoGrapher changes made in diagram layout were discarded after refreshing,
- [Ontographer - AL#122](https://github.com/opendata-mvcr/sgov-assembly-line/issues/122), fixes bug in which OntoGrapher where a new term was not created at the location of the mouse cursor,
- [Ontographer - #457](https://github.com/opendata-mvcr/ontoGrapher/issues/457), fixes bug in which OntoGrapher where creating a loop Full-style connection and switching to Compact view resulted in a crash,
- [Ontographer - #314](https://github.com/opendata-mvcr/ontoGrapher/issues/314), fixes bug in which OntoGrapher where invalid data was sent to the database,
- [Mission Control - #233](https://github.com/opendata-mvcr/mission-control/pull/233), fixes a bug which didn't allow to pass a huge number of vocabularies,
- [SGoV - #148](https://github.com/opendata-mvcr/sgov/pull/148), fixes bug in which empty attachments were published
- [SGoV - #152](https://github.com/opendata-mvcr/sgov/pull/152), fixes bug in which large publications took over 3 min
- [Assembly line - #127](https://github.com/opendata-mvcr/sgov-assembly-line/pull/127), fixes bug in which large publications reported failure even when succeeding

## 2022-05-30
OntoGrapher and SGoV server bug fixes and stabilization

### Bug fixes
- [Ontographer - AL#103](https://github.com/opendata-mvcr/sgov-assembly-line/issues/103), fixes bug in which OntoGrapher would crash when loading workspace data,
- [Ontographer - AL#111](https://github.com/opendata-mvcr/sgov-assembly-line/issues/111), fixes bug in which OntoGrapher wouldn't load workspaces fully,
- [Ontographer - AL#113](https://github.com/opendata-mvcr/sgov-assembly-line/issues/113), fixes bug in which OntoGrapher wouldn't save changes on cardinalities.


## 2022-05-16
Bug fixes in OntoGrapher, API and infrastructure

### Features
- [Ontographer - #429](https://github.com/opendata-mvcr/ontoGrapher/issues/429), alerts user on diagrams belonging to the vocabulary not longer in the workspace.

### Bug fixes
- [Ontographer - #368](https://github.com/opendata-mvcr/ontoGrapher/issues/368), enhances actions on which is definition edit saved,
- [Ontographer - #399](https://github.com/opendata-mvcr/ontoGrapher/issues/399), fixes bug with loading cardinalities,
- [SGoV - #131](https://github.com/opendata-mvcr/sgov/issues/131), fixes API to handle creation of vocabulary with IRI that already exists,
- [SGoV - #132](https://github.com/opendata-mvcr/sgov/issues/132), fixes adding vocabulary with shared attachments,
- [AL - #104](https://github.com/opendata-mvcr/sgov-assembly-line/pull/104), fixes SSP deploy fail due to timeouts on db-server 

## 2022-03-28
Stabilization of assembly line

### Features
- [Ontographer - AL#80](https://github.com/opendata-mvcr/sgov-assembly-line/issues/80), supports batch editing of cardinalities and setting of default cardinality for new rleations,
- [Ontographer - AL#58](https://github.com/opendata-mvcr/sgov-assembly-line/issues/58), fixes bug that OntoGrapher allows two domains or ranges from same relator.
 
### Bug fixes
- [Ontographer - AL#39](https://github.com/opendata-mvcr/sgov-assembly-line/issues/39), fixes OntoGrapher controlls for touchpads,
- [Ontographer - #424](https://github.com/opendata-mvcr/ontoGrapher/issues/424), fixes bug with time needed for finishing transactions exceeds limit,
- [Mission Control - AL#36](https://github.com/opendata-mvcr/sgov-assembly-line/issues/36), does not allow users to create new vocabulary with IRI already existing in SSP.

## 2022-02-22
Added support to touchpad control in OntoGrapher. Fixes bugs regarding caching in TermIt and vizualization in OntoGrapher.

### Features
- [Ontographer - #406](https://github.com/opendata-mvcr/ontoGrapher/issues/406), changes mouse interactions to support touchpad
 
### Bug fixes
- [AL - #91](https://github.com/opendata-mvcr/sgov-assembly-line/issues/91), fixes bug where TermIt caches data and does not show vocabularies relevant to the workspace,
- [Ontographer - #396](https://github.com/opendata-mvcr/ontoGrapher/issues/396), fixes incorrect switch of relators between compact and full view,
- [Ontographer - #398](https://github.com/opendata-mvcr/ontoGrapher/issues/398), fixes bug with filtering object types in compact mode,
- [Ontographer - #397](https://github.com/opendata-mvcr/ontoGrapher/issues/397), fixes bug with relations in canvas opened in other workspace,
- [Ontographer - #393](https://github.com/opendata-mvcr/ontoGrapher/issues/393), fixes problem with loading content of diagrams in new workspaces,
- [Ontographer - #402](https://github.com/opendata-mvcr/ontoGrapher/issues/402), published data does not contain duplicities.

## 2022-02-01
Bug fixes related to the vizualization of terms in OntoGrapher and saving all relations to the RDF.

### Bug fixes
- [Ontographer - #400](https://github.com/opendata-mvcr/ontoGrapher/issues/400), fixes bug with not saving all the cardinalities to RDF data,
- [Ontographer - #373](https://github.com/opendata-mvcr/ontoGrapher/issues/373), fixes bug of showing hidden terms after creation of a new one,
- [Ontographer - #82 (AL repo)](https://github.com/opendata-mvcr/sgov-assembly-line/issues/82), fixes vizualization of retators and tropes in compact view.


## 2022-01-18
Various bug fixes in OntoGrapher.

- [Ontographer - #366](https://github.com/opendata-mvcr/ontoGrapher/issues/366), fixing showing untyped entities in compact view,
- [Ontographer - #371](https://github.com/opendata-mvcr/ontoGrapher/issues/371), fixing creating intrinsic tropes,
- [Ontographer - #372](https://github.com/opendata-mvcr/ontoGrapher/issues/372), fixing problem with model saving,
- [Ontographer - #375](https://github.com/opendata-mvcr/ontoGrapher/issues/375), fixing cardinalities not loading into workspace,
- [Ontographer - #376](https://github.com/opendata-mvcr/ontoGrapher/issues/376), fixing opening a workspace with diagrams in OG,
- [Ontographer - #377](https://github.com/opendata-mvcr/ontoGrapher/issues/377), fixing adding items from external vocabularies,
- [Ontographer - AL#74](https://github.com/opendata-mvcr/sgov-assembly-line/issues/74), fixing loading of workspace.

## 2022-01-06
Bug fixes solving behaviour of publishing diagram.

### Bug fixes
- [SGoV - #113](https://github.com/opendata-mvcr/sgov/issues/114), fixing publishing action behaviour
- [OntoGrapher - #362](https://github.com/opendata-mvcr/ontoGrapher/issues/362), fixes visualization of links coming out and to the concept,
- [OntoGrapher - #359](https://github.com/opendata-mvcr/ontoGrapher/issues/359/), fixes vizualization of diagrams,
- [SGoV assembly line #68](https://github.com/opendata-mvcr/sgov-assembly-line/issues/68), fixed by #359,
- [OntoGrapher - AL#70](https://github.com/opendata-mvcr/sgov-assembly-line/issues/70), fixed by #359.


## 2022-01-03
Support for publishing diagrams along with vocabularies. Two outstanding bugs remain - [SGoV - #114](https://github.com/opendata-mvcr/sgov/issues/114), [OntoGrapher - #68](https://github.com/opendata-mvcr/sgov-assembly-line/issues/68)

### Features
- [SGoV - #106](https://github.com/opendata-mvcr/sgov/issues/106), SGoV server support for publishing diagrams
 
### Bug fixes
- [Mission Control - #196](https://github.com/opendata-mvcr/mission-control/issues/196), enables editing of a vocabulary right after adding it to a workspace

## 2021-11-30
- Label visible in OntoGrapher is marked as dcterms:label and bug fixes.

### Features
- [Ontographer - #329](https://github.com/opendata-mvcr/ontoGrapher/issues/329), Visible labels in OG exported as dcterms:label.

### Bug Fixes
- [Ontographer - #334](https://github.com/opendata-mvcr/ontoGrapher/issues/334), fixes the number of shown terms from external vocabulary in the left panel.
- [Ontographer - #335](https://github.com/opendata-mvcr/ontoGrapher/issues/334), fixes visibility of deleted term from external vocabulary
- [Ontographer - AL#62](https://github.com/opendata-mvcr/sgov-assembly-line/issues/62), fixes saving changes in line shapes
- [Ontographer - AL#63](https://github.com/opendata-mvcr/sgov-assembly-line/issues/63), fixes invalid creation of properties in compact mode
- [Ontographer - #346](https://github.com/opendata-mvcr/ontoGrapher/issues/346), fixes loading of terms into workspace


## 2021-11-01
- Minor bug fixes 

### Bug fixes
- [Ontographer - #323](https://github.com/opendata-mvcr/ontoGrapher/issues/323), More precise translation of Links to Czech
- [Ontographer - #322](https://github.com/opendata-mvcr/ontoGrapher/issues/322), Fixes displaying of domains and ranges in other workspaces in relator detail.

## 2021-10-18
- Diagram export support

### Features
- [Ontographer - #37 (AL repo)](https://github.com/opendata-mvcr/sgov-assembly-line/issues/37), OntoGrapher allows exporting diagrams as PNG or SVG

---
