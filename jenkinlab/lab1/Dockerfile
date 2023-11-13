FROM alpine

WORKDIR /app

COPY .mvn/ .mvn
COPY mvn pom.xml ./

COPY src ./src

CMD ["./mvnw", "spring-boot:run"]
