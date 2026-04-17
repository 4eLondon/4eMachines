# Java Dev Container

Includes: JDK 21 (Eclipse Temurin / OpenJDK LTS)

No build tool is pre-installed — add Maven or Gradle to the Dockerfile if
you need them (see below), or use the wrapper scripts (`mvnw` / `gradlew`)
that most projects ship with.

## Build

```bash
# Base image (JDK only)
docker build -t dev-java .

# With Maven
docker build --build-arg BUILD_TOOL=maven -t dev-java .

# With Gradle
docker build --build-arg BUILD_TOOL=gradle -t dev-java .
```

To pre-install Maven or Gradle, add this to the Dockerfile:
```dockerfile
RUN apt-get update && apt-get install -y maven && rm -rf /var/lib/apt/lists/*
# or
RUN apt-get update && apt-get install -y gradle && rm -rf /var/lib/apt/lists/*
```

## Run

```bash
# Basic
docker run --rm -it -v "$PWD":/code dev-java

# Persist Maven local repository between sessions
docker run --rm -it \
  -v "$PWD":/code \
  -v java-m2:/root/.m2 \
  dev-java

# Persist Gradle cache
docker run --rm -it \
  -v "$PWD":/code \
  -v java-gradle:/root/.gradle \
  dev-java
```

## Common commands inside the container

```bash
java --version                  # confirm JDK

# Single file (no build tool)
javac Hello.java                # compile → Hello.class
java Hello                      # run

# Maven project
./mvnw compile                  # compile
./mvnw test                     # test
./mvnw package                  # build JAR
./mvnw exec:java -Dexec.mainClass=com.example.Main

# Gradle project
./gradlew build                 # build
./gradlew test                  # test
./gradlew run                   # run (if Application plugin configured)
```

## Create a Maven project from scratch (inside container, with Maven installed)

```bash
mvn archetype:generate \
  -DgroupId=com.example \
  -DartifactId=my-project \
  -DarchetypeArtifactId=maven-archetype-quickstart \
  -DinteractiveMode=false
```

See `packages.md` for common libraries.
