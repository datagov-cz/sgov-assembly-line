# This script generates an .env.* file that can be consumed by docker-compose
# The most important piece is serializing the components configuration in a YAML file using base64 to an env variable

die () {
    echo >&2 "$@"
    exit 1
}

[ "$#" -eq 1 ] || die "1 argument required, supported values are local, development or production"

ENV=$1

case $ENV in

  local)
    export CONTEXT=development
    export URL=http://localhost:1234/modelujeme
    FILE=.env.local
    ;;

  development)
    export CONTEXT=development
    export URL=https://xn--slovnk-test-scb.mvcr.gov.cz/modelujeme
    FILE=.env.development
    ;;

  production)
    export CONTEXT=production
    export URL=https://xn--slovnk-7va.gov.cz/modelujeme
    FILE=.env.production
    ;;

  *)
    die "Unknown env ${ENV}, supported values are local, development or production"
    ;;

esac

# Takes components.yml, replaces env variables, base64 encodes it without line wrapping
export COMPONENTS=$(cat components.yml | envsubst | base64 -w 0)

# Takes .env.template file, replaces env variables and saves it as a env-specific file
cat .env.template | envsubst > $FILE
