# --- Build Stage  ---
FROM gradle:8.10.2-jdk21-alpine AS build
WORKDIR /app
COPY . .
RUN ./gradlew build -x test --no-daemon

# --- Run Stage (potential improvement : use a slim image) ---
FROM openjdk:21-jdk
WORKDIR /app
COPY --from=build /app/build/libs/*SNAPSHOT.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java","-XX:ParallelGCThreads=1","-XX:CICompilerCount=2","-jar","app.jar"]