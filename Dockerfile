FROM tyrone98/java8
MAINTAINER Tyrone "tyrone.dev@gmail.com"

ADD http://mirrors.jenkins-ci.org/war/2.0/jenkins.war /opt/jenkins.war

RUN apt-get update \
  && apt-get install -qy curl \
  && curl -sSL https://deb.nodesource.com/setup_6.x | sh - \
  && apt-get update \
  && apt-get -qy install build-essential nodejs \
  && rm -rf /var/lib/apt/lists/* \
  && useradd -ms jenkins 

USER jenkins
ENV JENKINS_HOME /jenkins

RUN mkdir /jenkins
VOLUME /jenkins

ENTRYPOINT ["java", "-jar", "/opt/jenkins.war"]

EXPOSE 8080


