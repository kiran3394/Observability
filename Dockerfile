FROM adoptopenjdk/openjdk11
ADD build/libs/custom-metrics-demo-0.0.1-SNAPSHOT.jar /
EXPOSE 8080

ENTRYPOINT ["java","-jar","/custom-metrics-demo-0.0.1-SNAPSHOT.jar"]