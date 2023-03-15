# WSL Demo With JDK-11

## Requirement
- JDK-11
- Maven

## Build
- ```shell
  mvn clean package
  ```
- When running in wsl terminal assure that JDK-11 has been correctly. Underlying WSL-Distro is set probably to JDK-8.<br />
  ```shell
  export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64/
  export PATH=$JAVA_HOME/bin:$PATH`
  ```
- Check Java version (should be Java 11): 
  ```shell
  java -version
  ```
  ```console
  openjdk version "11.0.17" 2022-10-18
  OpenJDK Runtime Environment (build 11.0.17+8-post-Ubuntu-1ubuntu222.04)
  OpenJDK 64-Bit Server VM (build 11.0.17+8-post-Ubuntu-1ubuntu222.04, mixed mode, sharing)
  ```
- Check Maven version (should be Java 11): 
  ```shell 
  mvn -version
  ```
  Output should be: 
  ```console
  Apache Maven 3.6.3
  Maven home: /usr/share/maven
  Java version: 11.0.17, vendor: Ubuntu, runtime: /usr/lib/jvm/java-11-openjdk-amd64
  Default locale: en, platform encoding: UTF-8
  OS name: "linux", version: "5.15.79.1-microsoft-standard-wsl2", arch: "amd64", family: "unix"
  ```

## Run
```shell
/usr/lib/jvm/java-11-openjdk-amd64/bin/java -jar wsl-java11-1.0-SNAPSHOT-spring-boot.jar
```
or if JDK11 has been set correctly just
```shell
java -jar wsl-java11-1.0-SNAPSHOT-spring-boot.jar
```
## Remark
./github/.m2 folder is excluded from git by intention. the settings.xml files are placed here during github actions build (artifactory and gitub)
