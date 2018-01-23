# FROM openjdk:8-jdk-alpine
# VOLUME /tmp
# ADD /build/libs/bt-example-0.1.0.jar app.jar
# ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/app.jar"]

FROM openjdk:8

RUN apt-get update && apt-get install -y build-essential

ENV APP_HOME /braintree_spring_example
ENV JAVA_OPTS="-Xmx256m -Xms128m"
RUN mkdir $APP_HOME
WORKDIR $APP_HOME
ADD . $APP_HOME

CMD echo "The application will start ..." && \
    java ${JAVA_OPTS} -Djava.security.egd=file:/dev/./urandom -jar /app.jar

EXPOSE 8080 5701/udp

ADD /build/libs/*.jar /app.jar