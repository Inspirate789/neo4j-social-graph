# Setup:
docker pull neo4j:latest
docker run \
    --name testneo4j \
    -p7474:7474 -p7687:7687 \
    -d \
    -v $HOME/neo4j/data:/data \
    -v $HOME/neo4j/logs:/logs \
    -v $HOME/neo4j/import:/var/lib/neo4j/import \
    -v $HOME/neo4j/plugins:/plugins \
    --env NEO4J_AUTH=neo4j/password \
    neo4j:latest

# Entry:
docker exec -ti testneo4j bash
cypher-shell -u neo4j -p password

# Filling the knowledge base:
CREATE CONSTRAINT FOR (person:PERSON) REQUIRE person.name IS UNIQUE;

CREATE
(john:Person {name: "John", sex: "male"}),
(paul:Person {name: "Paul", sex: "male"}),
(peter:Person {name: "Peter", sex: "male"}),
(kate:Person {name: "Kate", sex: "female"}),
(lisa:Person {name: "Lisa", sex: "female"}),
(sara:Person {name: "Sara", sex: "female"}),
(tyler:Person {name: "Tyler", sex: "male"}),
(luke:Person {name: "Luke", sex: "male"}),
(peter)-[:Parent]->(john),
(kate)-[:Parent]->(john),
(paul)-[:Parent]->(peter),
(lisa)-[:Parent]->(peter);

# Find all of John's grandfathers:
MATCH (grandfather:Person {sex: "male"})-[:Parent]-()-[:Parent]-(:Person {name: "John"}) RETURN grandfather;

# Exit:
:exit
exit
docker stop testneo4j
docker rm testneo4j
