# Výrobní linka Sémantického slovníku pojmů

Výrobní linka je sada nástrojů, které slouží k tvorbě [Sémantického slovníku pojmů](https://xn--slovnk-7va.gov.cz/). V současné době zahrnuje několik komponent:

1. [Kontrolní panel](https://github.com/opendata-mvcr/mission-control), který používá [SGoV Server](https://github.com/opendata-mvcr/sgov) jako backend. Jedná se o nástroj pro správu pracovních prostorů (transakcí pro editaci Sémantického slovníku pojmů) a jejich publikaci do [Github repozitáře](https://github.com/opendata-mvcr/ssp) odkud jsou vytvořené slovníky publikovány do [SPARQL endpointu](https://xn--slovnk-7va.gov.cz/sparql).
2. [TermIt](https://github.com/opendata-mvcr/termit-ui), který má rovněž vlastní [back-end](https://github.com/opendata-mvcr/termit). Jedná se o nástroj na správu pojmů samotných, jejich názvů, definic, zdrojů a základní strukturování do tezauru. TermIt pracuje s formátem [SKOS](https://www.w3.org/TR/skos-reference/).
3. [OntoGrapher](https://github.com/opendata-mvcr/ontographer) je nástrojem pro tvorbu ontologických konceptuálních modelů na základě pojmů, tedy o jejich vzájemné propojování významovými vazbami (např. `Orgán veřejné moci` je speciálním případem `Organizace`). TermIt pracuje v jazyce [OWL](https://www.w3.org/TR/2012/REC-owl2-overview-20121211/#).

Výrobní linka je rozšiřitelná o další nástroje, které mohou řešit jiné (nebo stejné) dílčí úlohy.

## Nasazení výrobní linky

Tento repozitář obsahuje sadu Docker instrukcí pro nasazení Výrobní linky.

Postup:

0. Stáhni [GraphDB Free](https://graphdb.ontotext.com) do složky `graphdb`, např. `graphdb-free-9.6.0-dist.zip`.

1. Vygeneruj soubor s proměnnými pomocí utility `gen_env.sh`. Utilita vyžaduje parametr s hodnotou `local`, `development` nebo `production`. V závislosti na parametru bude vygenerován příslušný `.env.*` soubor. Konfigurace komponent bude vygenerována z šablony `components.yml` a zakódována pomocí base64 do jednoduchého řetězce. Příklad:

```
./gen_env.sh local
```
2. Přidej do `.env.<CONTEXT>` proměnné a nastav je:
Tyto proměnné volíš:
`POSTGRES_DB`
`POSTGRES_USER`
`POSTGRES_PASSWORD`
`KEYCLOAK_USER`
`KEYCLOAK_PASSWORD`
`REPOSITORY_GITHUBUSERTOKEN` (nutné pouze pro publikaci pracovního prostoru na Github)

3. Spusť `docker-compose` s příslušným `.env.*` souborem. Příklad:

```
docker-compose --env-file=.env.local up
```

4. V dbServeru (`/modelujeme/sluzby/dbServer`) importujte do repozitáře všechny soubory v sekci Server files do kontextu 'http://onto.fel.cvut.cz/ontologies/termit'.

5. V authServeru (`/modelujeme/sluzby/authServer`, přihlaš se do něj pomocí `$KEYCLOAK_USER` a
`$KEYCLOAK_PASSWORD`)
 - přidej v záložce 'Events Config' Event listener `keycloak-graphdb-user-replicator` a ulož,
 - zkopíruj hodnotu veřejného klíče daného realmu do proměnné `KEYCLOAK_REALMKEY`,
 - zkopíruj hodnotu klíče klienta sgovServer do proměnné SGOV_SERVER_KEYCLOAK_CREDENTIALS_SECRET,
 - vytvoř uživatele výrobní linky. Nezapomeň mu nastavit heslo a přiřadit roli ROLE_USER pro službu sgovServer.

6. Restartuj službu `sgovServer`

`docker-compose stop sgovServer ; docker-compose --env-file=.env.local up -d sgovServer`

6. Ověř, že Výrobní linka běží. V případě lokálního nasazení je její URL `http://localhost/modelujeme`.

Tento repozitář vznikl v rámci projektu OPZ č. [CZ.03.4.74/0.0/0.0/15_025/0004172](https://esf2014.esfcr.cz/PublicPortal/Views/Projekty/Public/ProjektDetailPublicPage.aspx?action=get&datovySkladId=7CCECB36-FB27-4B75-9F6B-6892D2107FD8) a je udržován v rámci projektu OPZ č. [CZ.03.4.74/0.0/0.0/15_025/0013983](https://esf2014.esfcr.cz/PublicPortal/Views/Projekty/Public/ProjektDetailPublicPage.aspx?action=get&datovySkladId=F5E162B2-15EC-4BBE-9ABD-066388F3D412).
![Evropská unie - Evropský sociální fond - Operační program Zaměstnanost](https://data.gov.cz/images/ozp_logo_cz.jpg)
