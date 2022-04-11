cd "$( cd "$( dirname "${BASH_SOURCE[0]:-${(%):-%x}}" )" >/dev/null 2>&1 && pwd )"
cd ..

export NEO4J_CONTAINER_NAME=snb-interactive-neo4j
export NEO4J_CONTAINER_ROOT=`pwd`/scratch
export NEO4J_CSV_POSTFIX=_0_0.csv
export NEO4J_DATA_DIR=${NEO4J_CONTAINER_ROOT}/data
export NEO4J_ENV_VARS="--env=NEO4J_dbms_logs_default__format=JSON \
  --env=NEO4J_dbms_logs_query_time__logging__enabled=true \
  --env=NEO4J_dbms_track__query__cpu__time=true \
  --env=NEO4J_dbms_logs_query_allocation__logging__enabled=true \
  --env=NEO4J_dbms_logs_query_page__logging__enabled=true \
  --env=NEO4J_ACCEPT_LICENSE_AGREEMENT=yes"
export NEO4J_VERSION=4.4.1-enterprise

if [[ `uname -m` == "arm64" ]]; then
    export NEO4J_DOCKER_PLATFORM_FLAG="--platform linux/arm64"
else
    export NEO4J_DOCKER_PLATFORM_FLAG=""
fi
