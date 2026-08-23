# Java — Common Libraries

Add to `pom.xml` (Maven) or `build.gradle` (Gradle).

## Web / HTTP
| Library        | GroupId / ArtifactId                    | Description                  |
|----------------|-----------------------------------------|------------------------------|
| Spring Boot    | `org.springframework.boot:spring-boot-starter-web` | Full web framework |
| Spark Java     | `com.sparkjava:spark-core`              | Lightweight web framework    |
| Javalin        | `io.javalin:javalin`                    | Minimal web framework        |
| OkHttp         | `com.squareup.okhttp3:okhttp`           | HTTP client                  |
| Apache HttpClient | `org.apache.httpcomponents.client5:httpclient5` | HTTP client       |

## Database
| Library        | GroupId / ArtifactId                    | Description                  |
|----------------|-----------------------------------------|------------------------------|
| JDBC (SQLite)  | `org.xerial:sqlite-jdbc`                | SQLite driver                |
| JDBC (PostgreSQL) | `org.postgresql:postgresql`          | PostgreSQL driver            |
| JDBC (MySQL)   | `com.mysql:mysql-connector-j`           | MySQL driver                 |
| Hibernate      | `org.hibernate.orm:hibernate-core`      | ORM                          |
| jOOQ           | `org.jooq:jooq`                         | Type-safe SQL DSL            |

## JSON / Data
| Library        | GroupId / ArtifactId                    | Description                  |
|----------------|-----------------------------------------|------------------------------|
| Jackson        | `com.fasterxml.jackson.core:jackson-databind` | JSON (most popular)    |
| Gson           | `com.google.code.gson:gson`             | Google's JSON library        |
| Moshi          | `com.squareup.moshi:moshi`              | Lightweight JSON             |
| SnakeYAML      | `org.yaml:snakeyaml`                    | YAML parsing                 |

## Testing
| Library        | GroupId / ArtifactId                    | Description                  |
|----------------|-----------------------------------------|------------------------------|
| JUnit 5        | `org.junit.jupiter:junit-jupiter`       | Standard test framework      |
| Mockito        | `org.mockito:mockito-core`              | Mocking framework            |
| AssertJ        | `org.assertj:assertj-core`              | Fluent assertions            |
| TestContainers | `org.testcontainers:testcontainers`     | Real DB/services in tests    |

## Utilities
| Library        | GroupId / ArtifactId                    | Description                  |
|----------------|-----------------------------------------|------------------------------|
| Guava          | `com.google.guava:guava`                | Google's Java utilities      |
| Apache Commons | `org.apache.commons:commons-lang3`      | String, math, collection utils|
| Lombok         | `org.projectlombok:lombok`              | Boilerplate reduction (annotations) |
| SLF4J + Logback| `org.slf4j:slf4j-api` + `ch.qos.logback:logback-classic` | Logging |

## Example pom.xml snippet (Maven)

```xml
<dependencies>
  <dependency>
    <groupId>com.fasterxml.jackson.core</groupId>
    <artifactId>jackson-databind</artifactId>
    <version>2.17.0</version>
  </dependency>
  <dependency>
    <groupId>org.junit.jupiter</groupId>
    <artifactId>junit-jupiter</artifactId>
    <version>5.10.2</version>
    <scope>test</scope>
  </dependency>
</dependencies>
```

## Example build.gradle snippet (Gradle)

```groovy
dependencies {
    implementation 'com.fasterxml.jackson.core:jackson-databind:2.17.0'
    testImplementation 'org.junit.jupiter:junit-jupiter:5.10.2'
}
```
