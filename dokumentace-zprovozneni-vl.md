##### Správa uživatelů

Vytvořil jsem team c5-developers, přidal do něj členy, kteří mají zapisovat do repositářů nástrojů VL a dal jim PRO VŠECHNY REPOZITÁŘE write access. Tím by se měly zapsat do souboru .github/CODEOWNERS. To je potřeba zkontrolovat a případně je tam dopsat. To je potřeba k tomu, aby se team automaticky přiřazoval k Pull requestům.
Obsah souboru CODEOWNERS:

    * @datagov-cz/c5-developers

##### Validace dat do SSP
Pro validaci se používá github action v repozitáři `SSP`. v souboru `validation/build.gradle` je potřeba upřesnit umístění repozitáře SGoV validátoru (přesunul se mezi organizacemi a tím se mu změnilo IRI). Jedná se o tento řádek:

    url = uri('https://maven.pkg.github.com/datagov-cz/sgov-validator')


##### Integrace s Netlify (nepovinné, jen pro dev účely)

Pro integraci s netlify pro testovací deployment je potřeba udělat následující kroky:
* vytvořit účet na netlify (pod administrativním účtem otevrenadata@dia.gov.cz),
* z netlify připojit účet na GH. Netlify nabídne prřipojení k účtu nebo organizaci (datagov-cz) a vybrání repozitářů, pro které připojení bude platit. Důležité jsou:
  * termit,
  * termit-ui,
  * sgov-assembly-line,
  * ontographer,
  * sgov,
  * showit,
  * mission-control,
* pokud má uživatel pro GH repo náležité oprávnění, vygeneruje netlify link do GH, kde se dokončí nastavení githubu,
* poté je uživatel přesměrován zpátky do netlify pro konfiguraci site specific věcí a tím je konfigurace dokončena.

##### Webhooks
Webhooks je potřeba mít k automatizovanému deployi změn na dev. Starají se o to, aby v okamžiku, kdy dojde ke změně kódu v repozitáři spustily aktualizaci na serveru. Webhooks jsou závislé na `secrets` a `variables`, které jsou definovány nikoliv v repozitáři, ale v organizace. Při přesunu mezi organizacemi je potřeba všechno zreprodukovat.

##### Rebuild packages