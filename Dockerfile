FROM openjdk:8-jdk
EXPOSE 8080:8080
WORKDIR /housing
CMD ./gradlew run
