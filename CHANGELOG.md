
# Change Log
All notable changes to the Assembly line tooling will be documented here.

## 2022-03-24
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
