#### Správa uživatelů
Byly vytvořeny teamy al-developers, al-maintainers a ssp-maintainers, obsahující členy, kteří mají zapisovat do repositářů nástrojů VL a SSP a dal jim write access, resp mainain acces. Tím by se měly zapsat do souboru .github/CODEOWNERS. To je potřeba zkontrolovat a případně je tam dopsat. To je potřeba k tomu, aby se team automaticky přiřazoval k Pull requestům.
Souboru CODEOWNERS obsahuje jeden z následujících řádků:

    * @datagov-cz/al-developers
    * @datagov-cz/al-mainatiners
    * @datagov-cz/ssp-maintainers



#### Validace dat do SSP
Pro validaci se používá github action v repozitáři `SSP`. v souboru `validation/build.gradle` je potřeba upřesnit umístění repozitáře SGoV validátoru (přesunul se mezi organizacemi a tím se mu změnilo IRI). Jedná se o tento řádek:

    url = uri('https://maven.pkg.github.com/datagov-cz/sgov-validator')


#### Publikace do SSP
Při publikaci dat do SSP přes výrobní linku je využívaná služba sgov. Ta potřebuje zapisovat do repozitáře SSP a proto je potřeba, aby k němu měla přístup. Ten je možné zajistit pomocí autorizačního tokenu, který ale není možné generovat pro organizaci, ale pouze pro uživatele. Za tímto účelem byl vytvořen uživatel GH uživatel otevrenadata@dia.gov.cz. K přístupu do GH repozitářů tzv. odjinud je potřeba využívat jím vygenerovaný token.

#### Redirect na slovník.gov.cz
Stránka slovník.gov.cz je přesměrována na GitHub pages generované v repozitáři `sgov-assembly-line`. Při změně organizace je potřeba změnit adresu, na kterou se stránka odkazuje. Tedy z https://opendata-mvcr.github.io/ssp/ na https://datagov-cz.github.io/ssp.

#### Integrace s Netlify (nepovinné, jen pro dev účely)
Pro integraci s netlify pro testovací deployment je potřeba udělat následující kroky:
* vytvořit účet na netlify (pod administrativním účtem otevrenadata@dia.gov.cz),
* z netlify připojit účet na GH. Netlify nabídne prřipojení k účtu nebo organizaci (datagov-cz) a vybrání repozitářů, pro které připojení bude platit. Důležité jsou:
  * termit-ui,
  * ontographer,
  * showit,
  * mission-control,
* pokud má uživatel pro GH repo náležité oprávnění, vygeneruje netlify link do GH, kde se dokončí nastavení githubu,
* poté je uživatel přesměrován zpátky do netlify pro konfiguraci site specific věcí a tím je konfigurace dokončena.

Podrobný návod v angličtině najdete [na stránce netlify](https://docs.netlify.com/site-deploys/create-deploys/).

##### Webhooks
Webhooks je potřeba mít k automatizovanému deployi změn na dev. Starají se o to, aby v okamžiku, kdy dojde ke změně kódu v repozitáři spustily aktualizaci na serveru. Webhooks jsou závislé na `secrets` a `variables`, které jsou definovány nikoliv v repozitáři, ale v organizace. Při přesunu mezi organizacemi je potřeba všechno zreprodukovat. Konkrétní `secrets` a `variables`:

- `secrets.AL_DEV_SECRET` -- heslo uloženo v organizaci pro spuštení automatizovaného deploy-e libovolného nástroje výrobní linky na dev (např. pro aktualizaci sgov-serveru se pouští CGI skript /modelujeme/update/al-sgov-server.php)

#### Rebuild packages

Packages jou používány k automatickému nasazování na dev prostředí. Po přesunu do nové organizace je zapotřebí vygenerovat packages pomocí příslušných GitHub actions v jednotlivých repozitářích nástrojů Výrobní linky, tedy:

- [React Nginx](https://github.com/datagov-cz/react-nginx) - používaný při vytváření packagů frontendových aplikací
- [Keycloak GraphDB User Replicator](https://github.com/datagov-cz/keycloak-graphdb-user-replicator) - Keycloak server obohacený o replikátor uživatelů do GraphDB používaný jako authorizační server Výrobní linky
- [Mission control](https://github.com/datagov-cz/mission-control) - Frontend aplikace Výrobní linky
- [OntoGrapher](https://github.com/datagov-cz/ontoGrapher) - Frontend aplikace Výrobní linky
- [Termit UI](https://github.com/datagov-cz/termit-ui) - Frontend aplikace Výrobní linky
- [Termit server](https://github.com/datagov-cz/termit) - Backend aplikace Výrobní linky
- [SGoV server](https://github.com/datagov-cz/sgov) - Backend aplikace Výrobní linky

Následně je ve frontend aplikacích potřeba upravit [Dockerfile](https://github.com/datagov-cz/mission-control/blob/main/Dockerfile), aby odkazoval na package React Nginx z nové organizace (tedy `FROM ghcr.io/stara-organizace/react-nginx/react-nginx:latest` -> `FROM ghcr.io/nova-organizace/react-nginx/react-nginx:latest`).

Když máme vytvořeny packages v nové organitaci, můžeme přistoupit k úpravě [Docker-compose](https://github.com/datagov-cz/sgov-assembly-line/blob/main/docker-compose.yml) pro nasazení Výrobní linky. V něm je zapotřebí přepsat všechny odkazy na packages ze staré organizace na odkazy do nové (podobně jako u Dockerfile frontend aplikací). Aby se pomocí webhooks nasazovali nové packages je zapotřebí změny v Docker-compose aplikovat na jednotlivých nasazeních.
