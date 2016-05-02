FROM tyrone98/java8
MAINTAINER Tyrone "tyrone.dev@gmail.com"

RUN apt-get update \
  && apt-get install -qy curl \
  && curl -sSL https://deb.nodesource.com/setup_6.x | sh - \
  && apt-get update \
  && apt-get -qy install build-essential nodejs \
  && curl -sSL -O https://services.gradle.org/distributions/gradle-2.13-bin.zip \
  && tar zxf  gradle-2.13-bin.zip -C /tmp \
  && curl -sSL -O https://get.docker.com/builds/Linux/x86_64/docker-1.11.1.tgz \
  && tar zxf docker-1.11.1.tgz -C / \
  && chmod +x /usr/bin/docker \
  && useradd -m jenkins \
  && mkdir /jenkins \
  && chown jenkins /jenkins \
  && curl -sSL http://mirrors.jenkins-ci.org/war/2.0/jenkins.war -o /opt/jenkins.war \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* 

ENV JENKINS_HOME /jenkins

USER jenkins
VOLUME /jenkins

EXPOSE 8080

CMD ["java", "-jar", "/opt/jenkins.war"]



