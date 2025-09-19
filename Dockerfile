# --- Build Stage  ---
FROM gradle:8.10.2-jdk21-alpine AS build
WORKDIR /app
COPY . .
RUN ./gradlew build -x test --no-daemon

# --- Run Stage ---
FROM openjdk:21-jdk
WORKDIR /app
COPY --from=build /app/build/libs/demo-0.0.1-SNAPSHOT.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java","-XX:ParallelGCThreads=1","-XX:CICompilerCount=2","-jar","app.jar"]