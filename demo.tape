Set TypingSpeed 0.25
Type "docker pull neo4j:latest"
Enter
Sleep 10s
Set TypingSpeed 0.3
Type "docker run \"
Enter
Type "    --name testneo4j \"
Enter
Type "    -p7474:7474 -p7687:7687 \"
Enter
Type "    -d \"
Enter
Type "    -v $HOME/neo4j/data:/data \"
Enter
Type "    -v $HOME/neo4j/logs:/logs \"
Enter
Type "    -v $HOME/neo4j/import:/var/lib/neo4j/import \"
Enter
Type "    -v $HOME/neo4j/plugins:/plugins \"
Enter
Type "    --env NEO4J_AUTH=neo4j/password \"
Enter
Type "    neo4j:latest"
Enter
Sleep 5s
Set TypingSpeed 0.25
Type "docker exec -ti testneo4j bash"
Enter
Sleep 3.5s
Type "cypher-shell -u neo4j -p password"
Enter
Sleep 3.5s
Type "CREATE CONSTRAINT FOR (person:PERSON) REQUIRE person.name IS UNIQUE;"
Sleep 3.5s
Enter
Set TypingSpeed 0.3
Type "CREATE"
Enter
Type '(john:Person {name: "John", sex: "male"}),'
Enter
Type '(paul:Person {name: "Paul", sex: "male"}),'
Enter
Type '(peter:Person {name: "Peter", sex: "male"}),'
Enter
Type '(kate:Person {name: "Kate", sex: "female"}),'
Enter
Type '(lisa:Person {name: "Lisa", sex: "female"}),'
Enter
Type '(sara:Person {name: "Sara", sex: "female"}),'
Enter
Type '(tyler:Person {name: "Tyler", sex: "male"}),'
Enter
Type '(luke:Person {name: "Luke", sex: "male"}),'
Enter
Type "(peter)-[:Parent]->(john),"
Enter
Type "(kate)-[:Parent]->(john),"
Enter
Type "(paul)-[:Parent]->(peter),"
Enter
Type "(lisa)-[:Parent]->(peter);"
Sleep 1s
Enter
Set TypingSpeed 0.25
Type 'MATCH (grandfather:Person {sex: "male"})-[:Parent]-()-[:Parent]-(:Person {name: "John"}) RETURN grandfather;'
Enter
Sleep 3.5s
Type ":exit"
Enter
Sleep 1s
Type "exit"
Enter
Sleep 1s
Type "docker stop testneo4j"
Enter
Sleep 10s
Type "docker rm testneo4j"
Enter
Sleep 10s
Type "echo 'Complete!'"
Enter
Sleep 10s
