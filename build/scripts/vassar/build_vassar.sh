#!/bin/bash

# Stop VASSAR
bash /app/scripts/vassar/stop_vassar.sh

# Clear gradle caches
rm -rf $HOME/.gradle/caches/

# Clear maven local jars
rm -rf $HOME/.m2/repository/seakers/system-architecture-problems
rm -rf $HOME/.m2/repository/seakers/orekit
rm -rf $HOME/.m2/repository/seakers/vassar


# BUILD: seakers/system-architecture-problems
echo "-----> Building seakers/system-architecture-problems"
cd /app/daphne/SystemArchitectureProblems
mvn dependency:purge-local-repository
mvn install


# BUILD: seakers/orekit
echo "-----> Building seakers/orekit"
cd /app/daphne/orekit/orekit
mvn dependency:purge-local-repository
mvn install



# BUILD: schema
echo "-----> Building schema"
cd /app/daphne/VASSAR_lib/src/main/graphql/com/example
apollo schema:download --endpoint=http://graphql:8080/v1/graphql --header 'X-Hasura-Admin-Secret: daphne'
# gradle downloadApolloSchema -Pcom.apollographql.apollo.endpoint=http://graphql:8080/v1/graphql -Pcom.apollographql.apollo.schema=src/main/graphql/com/example/schema.json  "-Pcom.apollographql.apollo.headers=Authorization=Bearer daphne"



# BUILD: seakers/vassar
echo "-----> Building seakers/vassar"
cd /app/daphne/VASSAR_lib
gradle generateApolloSources
# gradle build --refresh-dependencies
gradle publishToMavenLocal


# BUILD: VASSAR_server
echo "-----> Building VASSAR_server"
cd /app/daphne/VASSAR_server || exit
gradle build
