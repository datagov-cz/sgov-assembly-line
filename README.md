# Výrobní linka Sémantického slovníku pojmů

Výrobní linka je sada nástrojů, které slouží k tvorbě [Sémantického slovníku pojmů](https://xn--slovnk-7va.gov.cz/). V současné době zahrnuje několik komponent:
1. [Kontrolní panel](https://github.com/opendata-mvcr/mission-control), který používá [SGoV Server](https://github.com/opendata-mvcr/sgov) jako backend. Jedná se o nástroj pro správu pracovních prostorů (transakcí pro editaci Sémantického slovníku pojmů) a jejich publikaci do [Github repozitáře](https://github.com/opendata-mvcr/ssp) odkud jsou vytvořené slovníky publikovány do [SPARQL endpointu](https://xn--slovnk-7va.gov.cz/sparql).
2. [TermIt](https://github.com/opendata-mvcr/termit-ui), který má rovněž vlastní [back-end](https://github.com/opendata-mvcr/termit). Jedná se o nástroj na správu pojmů samotných, jejich názvů, definic, zdrojů a základní strukturování do tezauru. TermIt pracuje s formátem [SKOS](https://www.w3.org/TR/skos-reference/).
3. [OntoGrapher](https://github.com/opendata-mvcr/ontographer) je nástrojem pro tvorbu ontologických konceptuálních modelů na základě pojmů, tedy o jejich vzájemné propojování významovými vazbami (např. `Orgán veřejné moci` je speciálním případem `Organizace`). TermIt pracuje v jazyce [OWL](https://www.w3.org/TR/2012/REC-owl2-overview-20121211/#).

Výrobní linka je rozšiřitelná o další nástroje, které mohou řešit jiné (nebo stejné) dílčí úlohy.
