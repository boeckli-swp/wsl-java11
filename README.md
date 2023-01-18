# WSL Demo With JDK-11

## Requirement
- JDK-11
- Maven

## Build
- `mvn clean package`
- When running in wsl terminal assure that JDK-11 has been correctly. Underlying WSL-Distro is set probably to JDK-8.<br />
  `export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64/`<br />
  `export PATH=$JAVA_HOME/bin:$PATH`

## Run
`/usr/lib/jvm/java-11-openjdk-amd64/bin/java -jar wsl-java11-1.0-SNAPSHOT-spring-boot.jar`
