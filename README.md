# Výrobní linka Sémantického slovníku pojmů

Výrobní linka je sada nástrojů, které slouží k tvorbě [Sémantického slovníku pojmů](https://xn--slovnk-7va.gov.cz/). V současné době zahrnuje několik komponent:

1. [Kontrolní panel](https://github.com/opendata-mvcr/mission-control), který používá [SGoV Server](https://github.com/opendata-mvcr/sgov) jako backend. Jedná se o nástroj pro správu pracovních prostorů (transakcí pro editaci Sémantického slovníku pojmů) a jejich publikaci do [Github repozitáře](https://github.com/opendata-mvcr/ssp) odkud jsou vytvořené slovníky publikovány do [SPARQL endpointu](https://xn--slovnk-7va.gov.cz/sparql).
2. [TermIt](https://github.com/opendata-mvcr/termit-ui), který má rovněž vlastní [back-end](https://github.com/opendata-mvcr/termit). Jedná se o nástroj na správu pojmů samotných, jejich názvů, definic, zdrojů a základní strukturování do tezauru. TermIt pracuje s formátem [SKOS](https://www.w3.org/TR/skos-reference/).
3. [OntoGrapher](https://github.com/opendata-mvcr/ontographer) je nástrojem pro tvorbu ontologických konceptuálních modelů na základě pojmů, tedy o jejich vzájemné propojování významovými vazbami (např. `Orgán veřejné moci` je speciálním případem `Organizace`). TermIt pracuje v jazyce [OWL](https://www.w3.org/TR/2012/REC-owl2-overview-20121211/#).
4. [CheckIt]() s [backendem]() je nástroj sloužící pro revizi a schvalování změn provedených na slovnícich pomocí ostatních nástrujů Výrobní linky.

Výrobní linka je rozšiřitelná o další nástroje, které mohou řešit jiné (nebo stejné) dílčí úlohy.

## Nasazení výrobní linky

Tento repozitář obsahuje sadu Docker instrukcí pro nasazení Výrobní linky.

Postup:

0. Stáhni [GraphDB Free](https://graphdb.ontotext.com) do složky `al-db-server`, např. `graphdb-free-9.6.0-dist.zip`.

1. Vygeneruj soubor s proměnnými pomocí utility `gen_env.sh`. Utilita vyžaduje parametr s hodnotou `local`, `development` nebo `production`. V závislosti na parametru bude vygenerován příslušný `.env.*` soubor. Konfigurace komponent bude vygenerována z šablony `components.yml` a zakódována pomocí base64 do jednoduchého řetězce. Příklad:

```
./gen_env.sh local
```

2. Přidej do `.env.<CONTEXT>` proměnné a nastav je:
   Tyto proměnné volíš:

   - `GRAPHDB_ZIP_FILE_NAME` - jméno souboru stažené GraphDB (např. `graphdb-free-9.6.0-dist.zip`)
   - `POSTGRES_DB` - název databáze pro keycloak uživatele
   - `POSTGRES_USER` - uživatelské jméno pro správu databáze
   - `POSTGRES_PASSWORD` - heslo pro správu databáze
   - `KEYCLOAK_USER` - uživatelské jméno k přihlášení do admin konzole Keycloaku
   - `KEYCLOAK_PASSWORD` - heslo k přihlášení do admin konzole Keycloaku
   - `KEYCLOAK_API_USER_USERNAME` - uživatelské jméno pro přístup k API Keycloaku (potřebné pro CheckIt)
   - `KEYCLOAK_API_USER_PASSWORD` - heslo pro přístup k API Keycloaku (potřebné pro CheckIt)
   - `REPOSITORY_GITHUBUSERTOKEN` - GitHub token (nutné pouze pro publikaci pracovního prostoru na Github)

3. Spusť `docker-compose` s příslušným `.env.*` souborem. Příklad:

```
docker-compose --env-file=.env.local up
```

4. Nakonfiguruj a spusť externí webový server pro směrování požadavků z url definované v proměnné `URL` příslušného `.env.*` souboru 
na službu `al-nginx`. V případě lokálního nasazení a webového serevru `apache2` konfigurace může vypadat následovně:
```
<VirtualHost *:80>
        <Location /modelujeme>
                ProxyPass http://localhost:1234/modelujeme nocanon
                ProxyPassReverse http://localhost:1234/modelujeme
        </Location>
</VirtualHost>
 ```

nebo v případe `Nginx`:

```
server {
        listen 80 default_server;
        listen [::]:80 default_server;

        root /var/www/html;

        index index.html index.htm index.nginx-debian.html;

        server_name _;
        location / {
                try_files $uri $uri/ =404;
        }

        location /modelujeme {
                proxy_set_header X-Forwarded-Host $host:$server_port;
                proxy_set_header X-Forwarded-Server $host;
                proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
                proxy_pass http://localhost:1234/modelujeme;
                proxy_buffer_size 128k;
                proxy_buffers 4 256k;
                proxy_busy_buffers_size 256k;
                proxy_read_timeout 600s;
        }
}
```

5. Pro inicializace `al-db-serveru` je potřeba spustit SPARQL dotazy ze složky `al-db-server/lucene` na `/modelujeme/sluzby/db-server/` v sekci `SPARQL`.

6. V al-auth-serveru (`/modelujeme/sluzby/auth-server/admin/`, přihlas se do něj pomocí `$KEYCLOAK_USER` a
`$KEYCLOAK_PASSWORD`)

   - běž do `Realm Settings/Keys` a klikni na `Public key`
     - zkopíruj hodnotu veřejného klíče daného realmu do proměnné `KEYCLOAK_REALMKEY`,
   - běž do `Clients` (levé menu)
     - klikni na klienta `al-sgov-server` a v `Credentials` zkopíruj hodnotu `Secret` klienta do proměnné SGOV_SERVER_KEYCLOAK_CREDENTIALS_SECRET (pokud vidíš `*****` použij `Regenerate Secret`), 
     - stejně tak zkopíruj hodnotu `Secret` klienta `al-termit-server` do proměnné TERMIT_SERVER_KEYCLOAK_CREDENTIALS_SECRET,
     - stejně tak zkopíruj hodnotu `Secret` klienta `al-checkit-server` do proměnné CHECKIT_SERVER_KEYCLOAK_CREDENTIALS_SECRET,
   - vytvoř uživatele výrobní linky v `Users/Add user`
     - nastav mu `Username`, `Email`, `First Name` a `Last Name`
     - po vytvoření mu nastav heslo v `Credentials`
   - vytvoř admina pro přiřazování gestorů ve výrobní lince v `Users/Add user`
     - nastav mu `Username`, `Email`, `First Name` a `Last Name`
     - po vytvoření mu nastav heslo v `Credentials`
     - běž do sekce `Role Mappings` a v `Client Roles` vyhledej `al-checkit-server` -> klikni na `ROLE_ADMIN` a přidej tuto roli mocí tlačítka `Add selected`

7. Restartuj služby `al-sgov-server`, `al-termit-server` a `al-checkit-server`:

```
docker-compose --env-file=.env.local up
```

nebo 

```
docker-compose stop al-sgov-server ; docker-compose --env-file=.env.local up -d al-sgov-server
docker-compose stop al-termit-server ; docker-compose --env-file=.env.local up -d al-termit-server
docker-compose stop al-checkit-server ; docker-compose --env-file=.env.local up -d al-checkit-server
```

8. Ověř, že Výrobní linka běží. V případě lokálního nasazení je její URL `http://localhost/modelujeme`.

## Obnova databáze slovníků z publikovaných dat

Služba `al-db-server` představuje RDF úložište obsahující pracovní verze slovníků a uživatele systému. Uživatele systému lze kdykoli smazat a přegenerovat pomocí služby `al-auth-server`, která ukláda zdrojové data o uživatelích pomocí služby `al-auth-server-db`. Pracovní verze slovníků lze publikovat do [Sémantického slovníku pojmů](https://xn--slovnk-7va.gov.cz/) (SSP). 

V případě, že jsou všechny slovníky publikované, je možné RDF úložistě smazat a obnovit počáteční stav úložište (viz. body týkající se `al-db-serveru` v sekci [Nasazení výrobní linky](https://github.com/opendata-mvcr/sgov-assembly-line/edit/main/README.md#nasazen%C3%AD-v%C3%BDrobn%C3%AD-linky)) a importu všech základních dat na `/modelujeme/sluzby/db-server/import#server`. Po obnovení počátečního stavu uložiště je potřeba naimportovat slovníky z SSP a obnovit i RDF reprezentaci uživatelů systému v tomto úložišti. Záznam uživatele se v RDF úložišti vytvoří automaticky při libovolné aktualizaci uživatele pomocí uživatelského rozhraní na adrese `/modelujeme/sluzby/auth-server/`. Po aktualizaci všech uživatelů je obnova databáze slovníku hotova. 

Alternativně lze RDF reprezentaci uživatelů systému nahrát ze zálohy, protože je obsažena v separatním kontextu RDF úložiště (např. `https://slovník.gov.cz/uživatel`).

---
Tento repozitář je udržován v rámci projektu OPZ č. [CZ.03.4.74/0.0/0.0/15_025/0013983](https://esf2014.esfcr.cz/PublicPortal/Views/Projekty/Public/ProjektDetailPublicPage.aspx?action=get&datovySkladId=F5E162B2-15EC-4BBE-9ABD-066388F3D412).
![Evropská unie - Evropský sociální fond - Operační program Zaměstnanost](https://data.gov.cz/images/ozp_logo_cz.jpg)
